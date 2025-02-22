import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/entity/dto/chips_data.dart';
import 'package:my_precious/presentation/common/contract/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

const _entries = [
  ChipsData(SyncFrequencyType.minutely), // , Icons.repeat_one_rounded),
  ChipsData(SyncFrequencyType.daily), //, iconData: Icons.watch_later_outlined),
  ChipsData(SyncFrequencyType.weekly), //, iconData: Icons.next_week_outlined),
  // ChipsData(SyncFrequencyType.monthly), Icons.calendar_month_rounded),
  ChipsData(SyncFrequencyType.never), //, iconData: Icons.cancel_outlined),
];

class SyncFrequencyChips extends StatelessWidget with GetItMixin {
  SyncFrequencyChips({super.key});

  @override
  Widget build(BuildContext context) {
    final syncFrequency = watchX((SettingsModelControllerMixin model) =>
        (model as SettingsModelMixin).syncFrequencyNotifier);

    final chips = _entries.map(
      (entry) {
        return ChoiceChip(
          label: Text(
            uiLocator.localesController.getSyncTypeTitle(entry.type),
          ),
          labelPadding: const EdgeInsets.symmetric(
            horizontal: paddingForChip,
          ),
          selected: syncFrequency == entry.type,
          onSelected: (bool isSelected) {
            final isSettingsChangeAvailable =
                !uiLocator.settingsModel.isSettingsLoadingNotifier.value;

            if (isSelected && isSettingsChangeAvailable) {
              uiLocator.settingsController.updateSyncFrequency(entry.type);
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
