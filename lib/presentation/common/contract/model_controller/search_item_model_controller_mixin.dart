import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

mixin SearchItemModelControllerMixin
    implements SearchItemControllerMixin, SearchItemModelMixin {}

mixin SearchItemModelMixin {
  TextEditingController get searchItemFieldController;

  ValueNotifier<bool> get isSearchingNotifier;

  ValueNotifier<Map<String, (User, List<Item>)>?> get foundUserItemsNotifier;
}
