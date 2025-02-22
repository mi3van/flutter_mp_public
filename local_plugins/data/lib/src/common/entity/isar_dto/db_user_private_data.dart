import 'package:data/src/common/entity/isar_dto/db_basic_dto.dart';
import 'package:isar/isar.dart';

part 'db_user_private_data.g.dart';

// Naming changed in core files - userSyncSata.
@Collection()
class DbUserPrivateData extends DbBasicDto {
  late Id id;
  DateTime? lastSyncedDate;

// Item-part
  String? blockedItemEventUuid;
  String? lastItemHandledEventUuid;
  String? lastItemSyncedEventUuid;
  String? syncItemNextPageTokn;

  int? eventsItemCountForCheck;

// File-part
  String? blockedFileEventUuid;
  String? lastFileHandledEventUuid;
  String? lastFileSyncedEventUuid;
  String? syncFileNextPageTokn;

  int? eventsFileCountForCheck;

  DbUserPrivateData({
    int? dbId,
  }) {
    id = dbId ?? dbAutoId;
  }
}
