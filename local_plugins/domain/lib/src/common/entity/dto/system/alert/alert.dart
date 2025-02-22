import 'package:domain/src/common/entity/enums/alert_type.dart';
import 'package:domain/src/contract/common/alert_mixin.dart';

class Alert implements AlertMixin {
  @override
  final AlertType type;
  @override
  final String? title;
  final String message;

  Alert({
    required this.message,
    required this.type,
    this.title,
  });
}
