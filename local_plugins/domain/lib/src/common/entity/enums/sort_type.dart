enum SortType {
  name(_nameValue),
  created(_createdValue),
  type(_typeValue),
  modified(_modifiedValue);

  const SortType(this.value);

  final int value;

  static SortType fromInt(int value) {
    switch (value) {
      case _nameValue:
        return SortType.name;
      case _createdValue:
        return SortType.created;
      case _typeValue:
        return SortType.type;
      case _modifiedValue:
        return SortType.modified;
      default:
        throw Exception("Can't generate sort mode from value: $value");
    }
  }
}

const _nameValue = 0;
const _createdValue = 2;
const _typeValue = 4;
const _modifiedValue = 6;
