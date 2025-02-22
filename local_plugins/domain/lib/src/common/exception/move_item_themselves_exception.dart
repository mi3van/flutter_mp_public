import 'package:domain/src/common/entity/enums/code_exception.dart';
import 'package:domain/src/common/exception/base_exception.dart';

class MovingItemThemselvesException extends BaseException {
  MovingItemThemselvesException({required this.itemTitles});

  final String itemTitles;

  @override
  ExceptionCode get code => ExceptionCode.movingItemThemselvesException;
}
