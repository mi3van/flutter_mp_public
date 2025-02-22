import 'dart:typed_data';

extension ConvertIterable<T> on Iterable<T?> {
  List<T> toNonNullList() {
    return whereType<T>().toList();
  }
}

extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension UintListEqual on Uint8List {
  bool listEqual(Uint8List data) {
    return memEquals(this, data);
  }
}

/// Compares two [Uint8List]s by comparing 8 bytes at a time.
bool memEquals(Uint8List bytes1, Uint8List bytes2) {
  if (identical(bytes1, bytes2)) {
    return true;
  }

  if (bytes1.lengthInBytes != bytes2.lengthInBytes) {
    return false;
  }

  // Treat the original byte lists as lists of 8-byte words.
  var numWords = bytes1.lengthInBytes ~/ 8;
  var words1 = bytes1.buffer.asUint64List(0, numWords);
  var words2 = bytes2.buffer.asUint64List(0, numWords);

  for (var i = 0; i < words1.length; i += 1) {
    if (words1[i] != words2[i]) {
      return false;
    }
  }

  // Compare any remaining bytes.
  for (var i = words1.lengthInBytes; i < bytes1.lengthInBytes; i += 1) {
    if (bytes1[i] != bytes2[i]) {
      return false;
    }
  }

  return true;
}
