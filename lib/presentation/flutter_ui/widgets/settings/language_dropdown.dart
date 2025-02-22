import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/common/contract/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious/presentation/flutter_ui/widgets//basic/dropdown_text.dart';
import 'package:my_precious/service_locator.dart';

class LanguageDropdown extends StatelessWidget with GetItMixin {
  LanguageDropdown({super.key});

  static const _widgetHeight = elementHeightRegular;

  @override
  Widget build(BuildContext context) {
    final localeCode = watchX(
      (SettingsModelControllerMixin model) => model.selectedLocaleNotifier,
    );
    return SizedBox(
      height: _widgetHeight,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField(
            alignment: Alignment.center,
            value: localeCode,
            items: _languageMenuItems,
            onChanged: uiLocator.settingsController.updateLocalizationCode,
            style: uiLocator.appController.theme(context).textTheme.bodyLarge,
            elevation: elevationRegularInt,
            borderRadius: BorderRadius.circular(borderRadiusSmall),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down_rounded),
            decoration: const InputDecoration(
              contentPadding: EdgeInsetsDirectional.only(end: paddingSmaller),
            ),
            focusColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

final _languageMenuItems = localeNames.entries
    .map((itemType) => DropdownMenuItem(
          value: itemType.key,
          child: DropdownText(text: itemType.value),
        ))
    .toList();
