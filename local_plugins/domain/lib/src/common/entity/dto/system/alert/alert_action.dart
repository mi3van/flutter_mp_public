import 'dart:ui';

import 'package:domain/domain.dart';

class ActionAlert implements AlertMixin {
  @override
  final AlertType type;
  @override
  final String title;
  final String? description;
  final List<AlertActionData> actions;

  ActionAlert({
    required this.title,
    required this.actions,
    this.description,
  }) : type = AlertType.actionRequired;
}

class ActionAlertWithCode implements AlertMixin {
  @override
  final AlertType type;
  @override
  final String title;
  final ActionAlertTextCode titleCode;
  final ActionAlertTextCode? descriptionCode;
  final List<AlertActionCodeData> actions;
  final bool isAlertDismissible;

  ActionAlertWithCode({
    required this.titleCode,
    required this.actions,
    // Used as descriptionAddon
    required this.title,
    required this.isAlertDismissible,
    this.descriptionCode,
  }) : type = AlertType.actionRequired;
}

// Click auto-hide alert is included in the action.
class AlertActionData {
  final String title;
  final VoidCallback? action;

  AlertActionData({
    required this.title,
    this.action,
  });
}

class AlertActionCodeData {
  final ActionAlertTextCode titleCode;
  final VoidCallback? action;

  AlertActionCodeData(this.titleCode, {this.action});
}
