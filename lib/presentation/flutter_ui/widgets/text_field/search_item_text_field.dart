import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

class SearchItemTextField extends StatelessWidget {
  const SearchItemTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    return TextField(
      controller: uiLocator.searchItemModel.searchItemFieldController,
      maxLines: 1,
      maxLength: textFieldSearchItemLength,
      style: theme.textTheme.headlineSmall?.copyWith(
        color: theme.colorScheme.primary,
      ),
      textCapitalization: TextCapitalization.sentences,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onSubmitted: (v) => uiLocator.searchItemController.forceSearch(),
      decoration: InputDecoration(
        hintText: "uiLocator.localesController.locale.searchField",
        hintStyle: theme.textTheme.headlineSmall?.copyWith(
          color: uiLocator.appController.palette.secondary[70],
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
        counterText: '',
      ),
    );
  }
}
