import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/entity/dto/chips_data.dart';
import 'package:my_precious/presentation/common/contract/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

const _entries = [
  ChipsData(ImageCompressType.max, iconData: Icons.compress_rounded),
  ChipsData(ImageCompressType.medium, iconData: Icons.fit_screen_outlined),
  ChipsData(ImageCompressType.min, iconData: Icons.expand_rounded),
];

class ImageCompressChips extends StatelessWidget with GetItMixin {
  ImageCompressChips({super.key});

  @override
  Widget build(BuildContext context) {
    final imageCompressType = watchX((SettingsModelControllerMixin model) =>
        (model as SettingsModelMixin).imageCompressNotifier);

    final chips = _entries.map(
      (entry) {
        final isTypeMatch = imageCompressType == entry.type;
        return ChoiceChip(
          avatar: isTypeMatch
              ? null
              : Icon(
                  entry.iconData,
                  color: uiLocator.appController
                      .theme(context)
                      .colorScheme
                      .primary,
                  size: elementHeightMicro,
                ),
          label: Text(
            uiLocator.localesController.getImageCompressTitle(
              entry.type,
            ),
          ),
          labelPadding: const EdgeInsets.symmetric(
            horizontal: paddingForChip,
          ),
          selected: isTypeMatch,
          onSelected: (bool isSelected) {
            final isSettingsChangeAvailable =
                !uiLocator.settingsModel.isSettingsLoadingNotifier.value;

            if (isSelected && isSettingsChangeAvailable) {
              uiLocator.settingsController.updateImageCompressType(entry.type);
            }
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
    );

    return Wrap(
      spacing: paddingSmaller,
      runSpacing: paddingSmaller,
      children: chips.toList(),
    );
  }
}
