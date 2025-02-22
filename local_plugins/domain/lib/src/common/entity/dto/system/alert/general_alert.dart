import 'dart:ui';

import 'package:domain/src/common/entity/enums/alert_type.dart';
import 'package:domain/src/contract/common/alert_mixin.dart';

class GeneralAlert<RoutePageBuilderType> implements AlertMixin {
  @override
  final AlertType type = AlertType.info;
  @override
  final String? title;

  final RoutePageBuilderType pageBuilder;
  final bool? barrierDismissible;
  final String? barrierLabel;
  final Color? barrierColor;

  GeneralAlert({
    required this.pageBuilder,
    this.barrierDismissible,
    this.barrierLabel,
    this.barrierColor,
    this.title,
  });
}
