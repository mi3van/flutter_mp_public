import 'package:domain/src/common/entity/enums/code_exception.dart';

abstract class BaseException implements Exception {
  ExceptionCode get code;

  @override
  String toString() => "${code.value}: ${runtimeType.toString()} ";
}
