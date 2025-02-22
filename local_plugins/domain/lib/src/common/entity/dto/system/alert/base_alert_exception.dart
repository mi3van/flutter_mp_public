import 'package:domain/src/common/entity/enums/alert_type.dart';
import 'package:domain/src/common/exception/base_exception.dart';
import 'package:domain/src/contract/common/alert_mixin.dart';

abstract class BaseExceptionAlert implements AlertMixin {
  @override
  final AlertType type;
  @override
  final String? title = null;
  final BaseException baseException;

  BaseExceptionAlert(this.baseException, this.type);
}
