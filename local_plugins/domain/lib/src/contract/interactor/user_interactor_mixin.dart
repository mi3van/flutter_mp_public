import 'package:domain/domain.dart';

mixin UserInteractorMixin implements OriginalUserMixin, SelectedUserMixin {
  Future<void> onInit();
  Future<void> setAndSaveSelectedUser(String selectedUserUuid);
  Future<String> createUser();
  Future<User?> readUser(String userUuid);
  Future<User?> readUserOrigCached(String userUuid);
  Future<User?> getUserByEmail(String email);
  Future<void> updateUser(User updatedUser);
  // Future<bool> deleteSelectedUserAndData(String userUuid);
  Future<void> exitUser();

  // Functions for interactor
  Future<List<User>> getUsersPack(List<String> userUuids);

  Future<List<String>> getAllLocalUserUuids();
  Future<void> setNewLocalUser(String uuid);

  set exportFileType(ExportFileType exportFileType);

  Future<bool> importBackupSelUser(String filePassword);
  Future<bool> shareAll(String filePassword);
  Future<bool?> downloadAll(String filePassword);
}

mixin OriginalUserMixin {
  User get originalUser;
  String get originalUserUuid;
  String? get originalUserEmail;
}

mixin SelectedUserMixin {
  String get selectedUserUuid;
}
