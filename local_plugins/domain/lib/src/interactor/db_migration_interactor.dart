import 'dart:async';

import 'package:domain/domain.dart';

class DbMigrationInteractor with DbMigrateInteractorMixin {
  @override
  Future<void> onInit() async {
    String? savedVer = await iLocator.secureStorageRepository.readData(
      SecureData.dbVersion,
    );
    int dbVersion = int.parse(savedVer ?? "0");

    if (dbVersion >= coreDbVersion) return;

    await Future.doWhile(() async {
      dbVersion = await _migrateDbAction(dbVersion);

      await iLocator.secureStorageRepository.updateData(
        SecureData.dbVersion,
        dbVersion.toString(),
      );
      return dbVersion != coreDbVersion;
    });
  }

  Future<int> _migrateDbAction(int dbVersion) async {
    switch (dbVersion) {
      case 0:
        // Added in 2024.2.1;
        // await _migrateToV1();
        return 2; // Auto set-up for v2.
      case 1:
        // Added in 2024.3.0;
        // await _migrateToV2();
        return 2;
      case 2:
        // Added in 2024.3.5;
        // await _migrateToV3();
        return 3;
      case 3:
        // Added in 2024.4.2;
        // await _migrateToV4();
        return 4;
      default:
        return coreDbVersion;
    }
  }

//   Future<void> _migrateToV1() async {
//     final userUuids = await iLocator.userInteractor.getAllLocalUserUuids();

//     await Future.forEach(userUuids, (usrUuid) async {
//       if (await iLocator.fileRepository.isAnyBlobExits(userUuid: usrUuid)) {
//         await iLocator.fileRepository.deltAllOverflowedFiles(userUuid: usrUuid);
//       }
//       final itms = await iLocator.itemRepository.getAllData(userUuid: usrUuid);

//       await Future.forEach(itms, (item) async {
//         if (item.imageDbUuids != null && item.imageDbUuids!.isNotEmpty) {
//           final file = await iLocator.fileInteractor.readByUuid(
//             item.imageDbUuids!.first,
//             userUuid: usrUuid,
//           );
//           if (file != null && file.itemUuid != item.uuid) {
//             await iLocator.fileInteractor.updateBlobInfoOnly(
//               file..itemUuid = item.uuid,
//               userUuid: usrUuid,
//             );
//           }
//           final parts = _getDescrParts(item.description);

//           item
//             ..imageDbUuids = null
//             ..dividedDescrPart1 = parts?.$1
//             ..dividedDescrPart2 = parts?.$2;
//         }
//       });

//       await iLocator.itemRepository.updateAllData(itms, userUuid: usrUuid);
//     });
//   }

//   Future<void> _migrateToV2() async {
//     final userUuids = await iLocator.userInteractor.getAllLocalUserUuids();

//     await Future.forEach(userUuids, (userUuid) async {
//       final itms = await iLocator.itemRepository.getAllData(userUuid: userUuid);

//       await Future.forEach(itms, (item) async {
//         final parts = _getDescrParts(item.description);
//         item
//           ..dividedDescrPart1 = parts?.$1
//           ..dividedDescrPart2 = parts?.$2;
//       });

//       await iLocator.itemRepository.updateAllData(itms, userUuid: userUuid);
//     });
//   }

//   TextParts? _getDescrParts(String? description) => description == null
//       ? null
//       : iLocator.cloudInteractor.divideTextByLimit(description);

// // Handle List<int> to List<byte> in Isar.
//   Future<void> _migrateToV3() async {
//     final userUuids = await iLocator.userInteractor.getAllLocalUserUuids();

//     await Future.forEach(userUuids, (userUuid) async {
//       try {
//         final blbs = await iLocator.fileRepository.getAllBlobsWithDeprectdData(
//           usrUuid: userUuid,
//         );
//         await iLocator.fileRepository.updateAllData(blbs, userUuid: userUuid);

//         final itms = await iLocator.itemRepository.getAllDataWithDeprctdPreview(
//           userUuid: userUuid,
//         );
//         await iLocator.itemRepository.updateAllData(itms, userUuid: userUuid);
//       } on FileNotFoundException {
//         // Ignore - images already was moved.
//       }
//     });
//   }

// // Fill items qrCode fields with uuids.
//   Future<void> _migrateToV4() async {
//     final userUuids = await iLocator.userInteractor.getAllLocalUserUuids();

//     await Future.forEach(userUuids, (userUuid) async {
//       final itms = await iLocator.itemRepository.getAllData(userUuid: userUuid);

//       for (var item in itms) {
//         item.qrCode = item.uuid;
//       }

//       await iLocator.itemRepository.updateAllData(itms, userUuid: userUuid);
//     });
//   }
}
