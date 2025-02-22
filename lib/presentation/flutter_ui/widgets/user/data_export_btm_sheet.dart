import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/user_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/event_handler/platform_alert_event_handler/material_alert_event_handler.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/marquee_text.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/prec_choice_chip.dart';

import 'package:my_precious/service_locator.dart';

class ExportDataBottomSheet extends StatelessWidget {
  const ExportDataBottomSheet({super.key});

  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    return Theme(
      data: theme.copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: Padding(
        padding: MaterialAlertEventHandler.getBtmSheetKeybPadding(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MarqueeWidget(
              child: Text(
                "_locale.exportDataTitle",
                style: theme.textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: paddingRegular),
            _ExportDataTypeChips(),
            const SizedBox(height: paddingSmaller),
            _ExportDataAvailTypesWidget(),
            const SizedBox(height: paddingSmaller),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: _ExportDataDownlButton(),
                ),
                const SizedBox(width: paddingSmaller),
                Flexible(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.onSurfaceVariant,
                      backgroundColor: theme.colorScheme.primaryContainer,
                    ),
                    onPressed: () async {
                      if (await uiLocator.userController
                          .onExportShareClick()) {}
                    },
                    child: Text(
                      uiLocator.localesController.localeM.shareButtonLabel,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ExportDataTypeChips extends StatelessWidget with GetItMixin {
  _ExportDataTypeChips();

  @override
  Widget build(BuildContext context) {
    final exportType = watchX<UserModelControllerMixin, ExportFileType>(
      (model) => model.exportTypeNotifier,
    );
    return Wrap(
      spacing: paddingSmaller,
      runSpacing: paddingSmaller,
      children: [
        _PrecExportChoiceChip(
          Icons.folder_zip_outlined,
          selectedType: exportType,
          chipType: ExportFileType.backup,
        ),
        _PrecExportChoiceChip(
          Icons.table_chart_outlined,
          selectedType: exportType,
          chipType: ExportFileType.sheet,
        ),
        _PrecExportChoiceChip(
          Icons.description_outlined,
          selectedType: exportType,
          chipType: ExportFileType.text,
        ),
      ],
    );
  }
}

class _PrecExportChoiceChip extends StatelessWidget {
  const _PrecExportChoiceChip(
    this.icon, {
    required this.selectedType,
    required this.chipType,
  });

  final ExportFileType selectedType;
  final ExportFileType chipType;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return PrecChoiceChip(
      uiLocator.localesController.getExportTypeTitle(chipType),
      icon,
      (isSelected) {
        if (isSelected) uiLocator.userController.setNewExportType(chipType);
      },
      isSelected: selectedType == chipType,
    );
  }
}

class _ExportDataAvailTypesWidget extends StatelessWidget with GetItMixin {
  _ExportDataAvailTypesWidget();

  @override
  Widget build(BuildContext context) {
    final exportType = watchX<UserModelControllerMixin, ExportFileType>(
      (model) => model.exportTypeNotifier,
    );

    return AnimatedSwitcher(
      duration: animationDurationFast,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: (exportType == ExportFileType.backup)
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: paddingMicro),
              // child: PasswordTextField(
              //   uiLocator.userModel.passwExportFieldController,
              //   disposeFun: uiLocator.userController.cleanAfterExportSheetClose,
              // ),
            )
          : SizedBox(
              width: double.infinity,
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                key: Key("ExportDataBottomPage_SwitchListTile"),
                title: Text(
                  "uiLocator.localesController.locale.exportDataOnlyObjType",
                  style: uiLocator.appController
                      .theme(context)
                      .textTheme
                      .bodyLarge,
                ),
                value: false,
                onChanged: uiLocator.userController.setIsOnlyObjExport,
              ),
            ),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

class _ExportDataDownlButton extends StatelessWidget with GetItMixin {
  _ExportDataDownlButton();

  @override
  Widget build(BuildContext context) {
    final isFileDownloaded = watchX<UserModelControllerMixin, bool?>(
      (model) => model.isFileDownloadedNotifier,
    );
    final theme = uiLocator.appController.theme(context);
    return AnimatedSwitcher(
      duration: animationDurationFast,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: isFileDownloaded != true
          ? TextButton(
              key: Key("ExportDataDownlButton_is_false"),
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurfaceVariant,
                backgroundColor: theme.colorScheme.primaryContainer,
              ),
              onPressed: uiLocator.userController.onExportDownlClick,
              child: Text(
                "uiLocator.localesController.locale.downloadBtnTitle",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : TextButton(
              key: Key("ExportDataDownlButton_is_true"),
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurfaceVariant,
                backgroundColor: theme.colorScheme.tertiaryContainer,
              ),
              onPressed: () async {
                await uiLocator.userController.onOpenDownloadsClick();
              },
              child: Text(
                "uiLocator.localesController.locale.exportDataOpenDownloadsTitle",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
    );
  }
}
