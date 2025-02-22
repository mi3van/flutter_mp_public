import 'package:domain/domain.dart';

class Item implements CloudDtoMixin {
  @override
  final String uuid;
  String? title;
  @override
  String? cloudId;
  bool isFavorite;
  @override
  bool? isNeedInCloudDelete;

  Item({
    required String itemUuid,
    this.cloudId,
    this.isNeedInCloudDelete,
    bool? isFavorite,
  })  : uuid = itemUuid,
        isFavorite = isFavorite ?? false;

  @override
  bool operator ==(other) => identical(this, other)
      ? true
      : other is Item &&
          uuid == other.uuid &&
          title == other.title &&
          cloudId == other.cloudId &&
          isFavorite == other.isFavorite &&
          isNeedInCloudDelete == other.isNeedInCloudDelete;

  @override
  int get hashCode => Object.hash(
        uuid,
        title,
        // cloudId,
        isFavorite,
      );
}
