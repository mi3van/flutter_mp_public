import 'package:domain/src/common/entity/dto/system/alert/base_alert_exception.dart';
import 'package:domain/src/common/entity/enums/alert_type.dart';
import 'package:domain/src/common/exception/base_exception.dart';

class WarningAlert extends BaseExceptionAlert {
  WarningAlert(BaseException baseException)
      : super(baseException, AlertType.warning);
}
