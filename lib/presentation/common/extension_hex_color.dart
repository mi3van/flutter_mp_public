import 'dart:ui';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHexString(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  // String toHexString({bool leadingHashSign = true, bool withAlpha = true}) =>
  //     '${leadingHashSign ? '#' : ''}'
  //     '${withAlpha ? alpha.toRadixString(16).padLeft(2, '0') : ''}'
  //     '${red.toRadixString(16).padLeft(2, '0')}'
  //     '${green.toRadixString(16).padLeft(2, '0')}'
  //     '${blue.toRadixString(16).padLeft(2, '0')}';
}
