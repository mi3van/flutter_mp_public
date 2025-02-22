enum Role {
  defaultLocal(_defaultLocal),
  owner(_owner),
  editor(_editor),
  reader(_reader),
  unknown(_unknown),
  ;

  const Role(this._stringValue);

  final String _stringValue;

  static Role fromDb(String value) {
    switch (value) {
      case _defaultLocal:
        return defaultLocal;
      case _editor:
        return editor;
      case _reader:
        return reader;
      case _owner:
        return owner;
      default:
        return unknown;
    }
  }

  @override
  String toString() => _stringValue;
}

const _defaultLocal = "undefined";
const _owner = "owner";
const _editor = "editor";
const _reader = "reader";
const _unknown = "unknown";
