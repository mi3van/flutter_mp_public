import 'dart:typed_data';

import 'package:domain/domain.dart';

class BlobFile implements CloudDtoMixin, ClonableMixin<BlobFile> {
  final int fileId;
  @override
  final String uuid;
  String? itemUuid;
  late MyFileType fileType;
  late Uint8List data;
  @override
  String? cloudId;
  DateTime created;
  @override
  bool? isNeedInCloudDelete;

  BlobFile({
    required this.fileId,
    required String fileUuid,
    required this.itemUuid,
    required this.created,
    this.cloudId,
    this.isNeedInCloudDelete = false,
  }) : uuid = fileUuid;

  @override
  get clone => BlobFile(
        fileId: fileId,
        fileUuid: uuid,
        itemUuid: itemUuid,
        created: created,
        cloudId: cloudId,
        isNeedInCloudDelete: isNeedInCloudDelete,
      )
        ..fileType = fileType
        ..data = data;

  @override
  bool operator ==(other) => identical(this, other)
      ? true
      : other is BlobFile &&
          fileId == other.fileId &&
          uuid == other.uuid &&
          itemUuid == other.itemUuid &&
          fileType == other.fileType &&
          data.listEqual(other.data) &&
          cloudId == other.cloudId &&
          created == other.created &&
          isNeedInCloudDelete == other.isNeedInCloudDelete;

  @override
  int get hashCode => Object.hash(
        fileId,
        uuid,
        itemUuid,
        fileType.index,
        data.lengthInBytes,
        cloudId,
        HelperDate.simpleHashCode(created),
        isNeedInCloudDelete,
      );
}
