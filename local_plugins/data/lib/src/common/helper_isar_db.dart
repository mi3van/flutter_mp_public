import 'dart:io' show Directory;

import 'package:data/src/common/const.dart';
import 'package:data/src/common/entity/isar_dto/db_basic_dto.dart';
import 'package:data/src/common/entity/isar_dto/db_user.dart';
import 'package:data/src/common/entity/isar_dto/db_user_private_data.dart';
import 'package:data/src/common/entity/isar_dto/db_user_settings.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class HelperIsarDb {
  static get localDbAutoId => Isar.autoIncrement;

// All users db-part
  static Future<Isar> getIsarUsersDb() {
    return _getMainLevelIsarDb(
      databaseName: isarUsersDbName,
      schemas: _dbUserSchemas,
      ramSize: isarUsersDbRAM,
    );
  }

  static checkIdsAfterSave({
    required int oldId,
    required int newId,
  }) {
    if (oldId != newId) throw DataSavingException();
  }

  static Future<Isar> _getMainLevelIsarDb({
    required String databaseName,
    required List<CollectionSchema<DbBasicDto>> schemas,
    required int ramSize,
  }) async {
    final isar = _getIsarIfOpen(databaseName);
    if (isar != null) return isar;

    final result = await _getIsarDbFunction(databaseName, schemas, '', ramSize);
    final dir = result.$1;
    final getIsarFun = result.$2;

    if (await dir.exists()) {
      return getIsarFun();
    } else {
      await dir.create(recursive: true);
      return getIsarFun();
    }
  }
}

Isar? _getIsarIfOpen(String databaseName, {String? dbFolder}) {
  if (kIsWeb) {
    throw Exception("There is no Isar implementation for web");
  }

  final dbInstance = Isar.getInstance(databaseName);
  return (dbInstance != null &&
          dbInstance.isOpen &&
          (dbFolder == null ||
              dbInstance.directory == null ||
              dbInstance.directory!.contains(dbFolder)))
      ? dbInstance
      : null;
}

Future<(Directory, Future<Isar> Function())> _getIsarDbFunction(
  String databaseName,
  List<CollectionSchema<DbBasicDto>> schemas,
  String dbFolder,
  int maxRamSize,
) async {
  final docDirectory = await getApplicationDocumentsDirectory();
  String directoryPath = '${docDirectory.path}\\$appName\\$dbFolder';

  final dir = Directory(directoryPath);

  return (
    dir,
    () => Isar.open(
          schemas,
          directory: directoryPath,
          name: databaseName,
          maxSizeMiB: maxRamSize,
        )
  );
}

// Need all schemas for show in Isar-inspector.
const List<CollectionSchema<DbBasicDto>> _dbUserSchemas = [
  DbUserSchema,
  DbUserPrivateDataSchema,
  DbUserSettingsSchema,
];
