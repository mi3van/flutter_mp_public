import 'package:domain/src/common/entity/enums/alert_type.dart';

mixin AlertMixin {
  String? get title;
  AlertType get type;
}
