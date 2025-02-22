import 'package:domain/src/common/entity/enums/code_exception.dart';
import 'package:domain/src/common/exception/base_exception.dart';

class ItemNoParentMovedToRootException extends BaseException {
  ItemNoParentMovedToRootException({required this.itemTitle});

  final String itemTitle;

  @override
  ExceptionCode get code => ExceptionCode.itemNoParentMoveToRootException;
}
