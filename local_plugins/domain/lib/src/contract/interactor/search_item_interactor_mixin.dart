import 'package:domain/domain.dart';

mixin SearchItemInteractorMixin {
  Future<int> findItemsByTextToStreamReturnCount(String searchText);

  Stream<(String, (User, List<Item>))?> getUserFoundItemsStream();
}
