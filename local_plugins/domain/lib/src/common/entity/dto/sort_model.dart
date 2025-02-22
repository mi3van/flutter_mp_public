import 'package:domain/src/common/entity/enums/sort_type.dart';
import 'package:domain/src/contract/common/clone_mixin.dart';

class SortModel implements ClonableMixin<SortModel> {
  SortModel(
    this.sortType, {
    required this.isAscending,
    required this.isFavoritesOnTop,
  });

  static const favoriteTopValue = 200;
  static const ascendingValue = 1;

  SortType sortType;
  bool isAscending;
  bool isFavoritesOnTop;

  @override
  SortModel get clone {
    return SortModel(
      sortType,
      isAscending: isAscending,
      isFavoritesOnTop: isFavoritesOnTop,
    );
  }

  @override
  bool operator ==(other) => identical(this, other)
      ? true
      : other is SortModel &&
          sortType == other.sortType &&
          isAscending == other.isAscending &&
          isFavoritesOnTop == other.isFavoritesOnTop;

  @override
  int get hashCode => Object.hash(
        sortType.value,
        isAscending,
        isFavoritesOnTop,
      );
}
