import 'dart:async';

import 'package:domain/domain.dart';

class SearchItemInteractor with SearchItemInteractorMixin {
  late final _userFoundItemsStreamControl =
      StreamController<(String, (User, List<Item>))?>.broadcast();

  final List<String> _searchTextsCache = [];

  @override
  Future<int> findItemsByTextToStreamReturnCount(searchText) async {
    _searchTextsCache.insert(0, searchText);
    if (_searchTextsCache.length > 1) return _searchTextsCache.length;

    if (searchText.isNotEmpty) {
      final availableUsers = [iLocator.userInteractor.originalUser];
      late User user;
      int whileCount = 0, maxWhileCount = availableUsers.length;

      await Future.doWhile(() async {
        user = availableUsers[whileCount];

        final items = <Item>[];
        for (var i = 0; i < searchText.length; i++) {
          items.add(
            Item(itemUuid: i.toString())..title = "${searchText}_$i",
          );
        }

        _userFoundItemsStreamControl.add((user.dbUserUuid, (user, items)));

        whileCount++;
        return _searchTextsCache.length == 1 && whileCount < maxWhileCount;
      });
    } else {
      _userFoundItemsStreamControl.add(null);
    }

    if (_searchTextsCache.isNotEmpty) {
      final lastAdded = _searchTextsCache.first;
      final length = _searchTextsCache.length;
      if (length == 1) {
        _searchTextsCache.clear();
        return _searchTextsCache.length;
      } else {
        _searchTextsCache.clear();
        return await findItemsByTextToStreamReturnCount(lastAdded);
      }
    } else {
      return 0;
    }
  }

  @override
  Stream<(String, (User, List<Item>))?> getUserFoundItemsStream() =>
      _userFoundItemsStreamControl.stream;
}
