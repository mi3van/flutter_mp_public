import 'dart:math' as math;

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/entity/dto/chips_data.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/prec_divider_in_column.dart';
import 'package:my_precious/service_locator.dart';

const _entries = [
  ChipsData(SortType.name, iconData: Icons.type_specimen_rounded),
  ChipsData(SortType.created, iconData: Icons.calendar_month_rounded),
  ChipsData(SortType.type, iconData: Icons.layers_rounded),
  ChipsData(SortType.modified, iconData: Icons.access_time_filled_rounded),
];

class ItemsSortModeAlertDialog extends StatelessWidget {
  const ItemsSortModeAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        // Need for Chips-click ui show.
        data: uiLocator.appController
            .theme(context)
            .copyWith(canvasColor: Colors.transparent),
        child: AlertDialog(
          scrollable: true,
          alignment: Alignment.topCenter,
          title: Text(
            "uiLocator.localesController.locale.sortingPanelTitle",
            style: uiLocator.appController.theme(context).textTheme.titleLarge,
          ),
          titlePadding: const EdgeInsets.fromLTRB(
            paddingHuge,
            paddingRegular,
            paddingHuge,
            0,
          ),
          content: const _ItemsSortModeSelector(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: paddingRegular,
            vertical: paddingSmall,
          ),
          insetPadding: const EdgeInsets.all(paddingSmaller),
        ),
      ),
    );
  }
}

class _ItemsSortModeSelector extends StatefulWidget {
  const _ItemsSortModeSelector();

  @override
  State<_ItemsSortModeSelector> createState() => _ItemsSortModeSelectorState();
}

class _ItemsSortModeSelectorState extends State<_ItemsSortModeSelector> {
  final SortModel _sortModel = uiLocator.settingsModel.sortModel;

  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    final colorScheme = uiLocator.appController.theme(context).colorScheme;

    final mainChips = _entries.map((entry) {
      final isModeMatch = _sortModel.sortType == entry.type;
      return FilterChip(
        avatar: isModeMatch
            ? null
            : Icon(
                entry.iconData,
                color: colorScheme.primary,
                size: elementHeightMicro,
              ),
        label: Text(
          uiLocator.localesController.getSortTypeTitle(
            entry.type,
          ),
        ),
        labelPadding: const EdgeInsets.symmetric(
          horizontal: paddingForChip,
        ),
        selected: isModeMatch,
        onSelected: (bool isSelected) {
          final isSettingsChangeAvailable =
              !uiLocator.settingsModel.isSettingsLoadingNotifier.value;

          if (isSelected && isSettingsChangeAvailable) {
            setState(() {
              _sortModel.sortType = entry.type;
              _updateSortMode();
            });
          }
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    });

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: mobileButtonMaxWidth,
        minWidth: mobileButtonMaxWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: paddingSmaller,
            runSpacing: paddingSmaller,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ...mainChips,
              Container(
                height: elementHeightSmaller,
                width: 1.0,
                color: uiLocator.appController.palette.secondary[70]!,
              ),
              ChoiceChip(
                showCheckmark: false,
                avatar: !_sortModel.isFavoritesOnTop
                    ? Icon(
                        Icons.favorite_outline_rounded,
                        color: colorScheme.primary,
                        size: elementHeightMicro,
                      )
                    : Icon(
                        Icons.favorite_rounded,
                        color: colorScheme.primary,
                        size: elementHeightMicro,
                      ),
                label: Text("_locale.sortPanelFavOnTopAddon"),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: paddingForChip,
                ),
                selected: _sortModel.isFavoritesOnTop,
                onSelected: (bool isSelected) {
                  final isSettingsChangeAvailable =
                      !uiLocator.settingsModel.isSettingsLoadingNotifier.value;

                  if (isSettingsChangeAvailable) {
                    setState(() {
                      _sortModel.isFavoritesOnTop = isSelected;
                      _updateSortMode();
                    });
                  }
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
          PreciousDividerInColumn(
            verticalPadding: paddingSmaller,
            color: uiLocator.appController.palette.secondary[70]!,
          ),
          Wrap(
            spacing: paddingSmaller,
            runSpacing: paddingSmaller,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              FilterChip(
                avatar: _sortModel.isAscending
                    ? null
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(math.pi),
                        child: Icon(
                          Icons.sort_rounded,
                          color: colorScheme.primary,
                          size: elementHeightMicro,
                        ),
                      ),
                label: Text("_locale.sortPanelAscending"),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: paddingForChip,
                ),
                selected: _sortModel.isAscending,
                onSelected: (bool isSelected) {
                  final isSettingsChangeAvailable =
                      !uiLocator.settingsModel.isSettingsLoadingNotifier.value;

                  if (isSelected && isSettingsChangeAvailable) {
                    setState(() {
                      _sortModel.isAscending = true;
                      _updateSortMode();
                    });
                  }
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              FilterChip(
                avatar: !_sortModel.isAscending
                    ? null
                    : Icon(
                        Icons.sort_rounded,
                        color: colorScheme.primary,
                        size: elementHeightMicro,
                      ),
                label: Text("_locale.sortPanelDescending"),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: paddingForChip,
                ),
                selected: !_sortModel.isAscending,
                onSelected: (bool isSelected) {
                  final isSettingsChangeAvailable =
                      !uiLocator.settingsModel.isSettingsLoadingNotifier.value;

                  if (isSelected && isSettingsChangeAvailable) {
                    setState(() {
                      _sortModel.isAscending = false;
                      _updateSortMode();
                    });
                  }
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateSortMode() {
    uiLocator.settingsController.updateSortModel(_sortModel);
  }
}
