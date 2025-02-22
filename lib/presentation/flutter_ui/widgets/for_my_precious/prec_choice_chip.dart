import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

class PrecChoiceChip extends StatelessWidget {
  const PrecChoiceChip(
    this.title,
    this.iconData,
    this.onSelected, {
    super.key,
    required this.isSelected,
  });

  final String title;
  final IconData? iconData;
  final bool isSelected;
  final void Function(bool isSelected) onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: isSelected
          ? null
          : Icon(
              iconData,
              color: uiLocator.appController.theme(context).colorScheme.primary,
              size: elementHeightMicro,
            ),
      label: Text(title),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: paddingForChip,
      ),
      selected: isSelected,
      onSelected: onSelected,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
