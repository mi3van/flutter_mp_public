// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:my_precious/presentation/common/contract/model_controller/search_item_model_controller_mixin.dart';
import 'package:my_precious/service_locator.dart';

class SearchItemController implements SearchItemModelControllerMixin {
  @override
  late final TextEditingController searchItemFieldController =
      TextEditingController()..addListener(_searchListener);
  @override
  late final ValueNotifier<bool> isSearchingNotifier = ValueNotifier(false);
  @override
  late final ValueNotifier<Map<String, (User, List<Item>)>?>
      foundUserItemsNotifier = ValueNotifier(null);

  late final Debouncer _searchDebouncer = Debouncer(
    duration: slowDebounceDuration,
  );
  SearchItemInteractorMixin get _searchInter => cLocator.searchItemInteractor;

  late StreamSubscription<(String, (User, List<Item>))?> userFoundItemsSubscr;
  late StreamSubscription<Item> itemPushedSubs;
  late StreamSubscription<Item> itemExternalUpdateSubs;
  late StreamSubscription<Item> itemInternalUpdateSubs;
  late StreamSubscription<String> itemDeletedSubs;

  bool isNeedSearchOnStart = false;

  @override
  Future<void> firstOnPageLoading(Object? arguments) async {
    if (searchItemFieldController.text.isEmpty) {
      _tryToRestoreSearch();
    } else {
      searchItemFieldController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: searchItemFieldController.text.length,
      );
      if (isNeedSearchOnStart) {
        await forceSearch();
        isNeedSearchOnStart = false;
      }
    }
  }

  @override
  Future<void> onInit() async {
    _addItemSubscriptions();
  }

  @override
  void cleanValues() {
    _searchDebouncer.cancel();
    searchItemFieldController.clear();
    foundUserItemsNotifier.value = null;
  }

  @override
  void onDispose() {
    _cancelSubscriptions();
    cleanValues();

    searchItemFieldController.dispose();
    isSearchingNotifier.dispose();
    foundUserItemsNotifier.dispose();
  }

  void _addItemSubscriptions() {
    userFoundItemsSubscr = _searchInter.getUserFoundItemsStream().listen(
          _streamHandle,
        );
  }

  Future<void> _cancelSubscriptions() async {
    await itemPushedSubs.cancel();
    await itemExternalUpdateSubs.cancel();
    await itemInternalUpdateSubs.cancel();
    await itemDeletedSubs.cancel();
    await userFoundItemsSubscr.cancel();
  }

  @override
  void cleanSearchText() {
    searchItemFieldController.clear();
  }

  @override
  Future<void> forceSearch() async {
    _searchDebouncer.cancel();
    await _searchAction(searchItemFieldController.text.trim());
  }

  void _searchListener() {
    _searchDebouncer.run(() => _searchActionCheckPrevious());
  }

  Future<void> _searchAction(String searchFieldText) async {
    cLocator.restorationModel.restorableSearchText.value = searchFieldText;
    await _findItemsByTextToStream(searchFieldText);
  }

  Future<void> _tryToRestoreSearch() async {
    final restorableSearchText =
        cLocator.restorationModel.restorableSearchText.value;
    if (restorableSearchText.isNotEmpty) {
      searchItemFieldController.text = restorableSearchText;
      await _findItemsByTextToStream(restorableSearchText);
    }
  }

  Future<void> _searchActionCheckPrevious() async {
    final searchFieldText = searchItemFieldController.text.trim();

    if (cLocator.restorationModel.restorableSearchText.value !=
        searchFieldText) {
      await _searchAction(searchFieldText);
    }
  }

  Future<void> _findItemsByTextToStream(String text) async {
    isSearchingNotifier.value = true;
    final cacheCount =
        await _searchInter.findItemsByTextToStreamReturnCount(text);
    if (cacheCount == 0) isSearchingNotifier.value = false;
  }

  Future<void> _streamHandle(
    (String, (User, List<Item>))? userUuidWithItems,
  ) async {
    if (userUuidWithItems != null) {
      if (foundUserItemsNotifier.value == null) {
        foundUserItemsNotifier.value = {
          userUuidWithItems.$1: userUuidWithItems.$2,
        };
      } else {
        foundUserItemsNotifier.value![userUuidWithItems.$1] =
            userUuidWithItems.$2;
        foundUserItemsNotifier.notifyListeners();
      }
    } else {
      foundUserItemsNotifier.value = null;
    }
  }

  void _addWithoutSync(Item item) {
    isNeedSearchOnStart = true;
  }

  void _updteWithoutSync(Item updatedItem) {
    isNeedSearchOnStart = true;
    bool isNeedUpdate = false;

    foundUserItemsNotifier.value?.values.forEach((entry) {
      final items = entry.$2;
      final foundItem =
          items.firstWhereOrNull((item) => item.uuid == updatedItem.uuid);
      if (foundItem != null) isNeedUpdate = true;
    });

    if (isNeedUpdate) foundUserItemsNotifier.notifyListeners();
  }

  void _itemWasRemoved(String rItemUuid) {
    bool isNeedUpdate = false;

    foundUserItemsNotifier.value?.values.forEach((entry) {
      final items = entry.$2;
      final foundItem =
          items.firstWhereOrNull((item) => item.uuid == rItemUuid);
      if (foundItem != null && items.remove(foundItem) == true) {
        isNeedUpdate = true;
      }
    });

    if (isNeedUpdate) {
      foundUserItemsNotifier.notifyListeners();
      isNeedSearchOnStart = true;
    }
  }
}
