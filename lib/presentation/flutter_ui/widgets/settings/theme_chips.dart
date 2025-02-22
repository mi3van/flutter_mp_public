import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/entity/dto/chips_data.dart';
import 'package:my_precious/presentation/common/contract/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

const _entries = [
  ChipsData(ThemeType.auto, iconData: Icons.brightness_auto_rounded),
  ChipsData(ThemeType.light, iconData: Icons.brightness_low_rounded),
  ChipsData(ThemeType.dark, iconData: Icons.brightness_4_rounded),
];

class ThemeChips extends StatelessWidget with GetItMixin {
  ThemeChips({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = watchX((SettingsModelControllerMixin model) =>
        (model as SettingsModelMixin).themeNotifier);

    final chips = _entries.map((entry) {
      final isTypeMatch = currentTheme == entry.type;
      return ChoiceChip(
        avatar: isTypeMatch
            ? null
            : Icon(
                entry.iconData,
                color:
                    uiLocator.appController.theme(context).colorScheme.primary,
                size: elementHeightMicro,
              ),
        label: Text(uiLocator.localesController.getThemeTypeTitle(entry.type)),
        labelPadding: const EdgeInsets.symmetric(
          horizontal: paddingForChip,
        ),
        selected: isTypeMatch,
        onSelected: (bool isSelected) {
          final isSettingsChangeAvailable =
              !uiLocator.settingsModel.isSettingsLoadingNotifier.value;

          if (isSelected && isSettingsChangeAvailable) {
            uiLocator.settingsController.updateTheme(entry.type);
          }
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    });

    return Wrap(
      spacing: paddingSmaller,
      runSpacing: paddingSmaller,
      children: chips.toList(),
    );
  }
}
