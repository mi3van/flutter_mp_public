import 'package:isar/isar.dart';

mixin BaseIsarMainApiMixin {
  Future<Isar> initIsarMainDb();
}

mixin BaseIsarUserApiMixin {
  Future<Isar> initIsarUserDb(String userUuid);
}
