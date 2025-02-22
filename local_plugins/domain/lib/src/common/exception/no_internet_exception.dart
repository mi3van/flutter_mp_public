import 'package:domain/src/common/entity/enums/code_exception.dart';
import 'package:domain/src/common/exception/base_exception.dart';

class NoInternetException extends BaseException {
  @override
  ExceptionCode get code => ExceptionCode.noInternetException;
}
