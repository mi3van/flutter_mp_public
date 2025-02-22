import 'package:data/data.dart';
import 'package:isar/isar.dart';

abstract class DbBasicDto {
  @Ignore()
  int get dbAutoId => rLocator.localDbAutoId;
}
