import 'package:domain/src/common/entity/enums/code_exception.dart';
import 'package:domain/src/common/exception/base_exception.dart';

class MovingItemTargetPathException extends BaseException {
  MovingItemTargetPathException({required this.itemTitles});

  final String itemTitles;

  @override
  ExceptionCode get code => ExceptionCode.movingItemTargetPathException;
}
