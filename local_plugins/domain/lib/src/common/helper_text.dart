import 'dart:typed_data';
import 'dart:ui';

import 'package:domain/domain.dart';

typedef TextParts = (String, String?);

/// Outlines a text using shadows.
const _textDxOffset = 1.4;
const _textDyOffset = 1.0;
const _iconSimpleOffset = 1.8;
const _iconAngleOffset = _iconSimpleOffset * degree45Angle;
Map<String, List<Shadow>> _shadowList = {};

abstract class HelperText {
  String getTextFirstSymbols(String text) {
    final trimmedText = text.trim();
    if (trimmedText.isEmpty) {
      return ellipsisCharacter;
    } else if (trimmedText.length == 1) {
      return trimmedText[0];
    } else {
      return trimmedText[0] + trimmedText[1];
    }
  }

  static List<Shadow> getOutlinedTextShadows({required Color strokeColor}) {
    return _getShadowsList(
      strokeColor,
      listId: "${strokeColor.hashCode}_text",
      offsetsMap: _textShadowOffsets,
      blurRadius: 2,
    );
  }

  static List<Shadow> getIconShadows({required Color strokeColor}) {
    return _getShadowsList(
      strokeColor,
      listId: "${strokeColor.hashCode}_icon",
      offsetsMap: _iconShadowOffsets,
    );
  }

  static _getShadowsList(
    Color strokeColor, {
    required String listId,
    required Map<String, Offset> offsetsMap,
    double blurRadius = 0,
  }) {
    final shadows = _shadowList[listId];
    if (shadows != null) {
      return shadows;
    }
    List<Shadow> result = [];
    offsetsMap.forEach((key, offset) {
      result.add(Shadow(
        offset: offset,
        color: strokeColor,
        blurRadius: blurRadius,
      ));
    });
    _shadowList[listId] = result;
    return result;
  }

  static const Map<String, Offset> _textShadowOffsets = {
    'left': Offset(-_textDxOffset, 0),
    'top': Offset(0, -_textDyOffset),
    'right': Offset(_textDxOffset, 0),
    'bottom': Offset(0, _textDyOffset),
    'top-left': Offset(-_textDxOffset, -_textDyOffset),
    'top-right': Offset(_textDxOffset, -_textDyOffset),
    'bottom-left': Offset(-_textDxOffset, _textDyOffset),
    'bottom-right': Offset(_textDxOffset, _textDyOffset),
  };

  static const Map<String, Offset> _iconShadowOffsets = {
    'left': Offset(-_iconSimpleOffset, 0),
    'top': Offset(0, -_iconSimpleOffset),
    'right': Offset(_iconSimpleOffset, 0),
    'bottom': Offset(0, _iconSimpleOffset),
    'top-left': Offset(-_iconAngleOffset, -_iconAngleOffset),
    'top-right': Offset(_iconAngleOffset, -_iconAngleOffset),
    'bottom-left': Offset(-_iconAngleOffset, _iconAngleOffset),
    'bottom-right': Offset(_iconAngleOffset, _iconAngleOffset),
  };

  static TextParts divideOnTwoStrings(String text, int textLimitInUtf8) {
    final stringInUtf8 = TypeConverter.stringToUtf8(text);
    final countInUtf8 = stringInUtf8.length;

    if (countInUtf8 <= textLimitInUtf8) {
      return (text, null);
    } else {
      String part1 = TypeConverter.utf8ToString(
        stringInUtf8.getRange(0, textLimitInUtf8).toList(),
      );
      if (part1.endsWith(_malformedChar)) {
        part1 = part1.substring(0, part1.length - 1);
      }
      return (part1, text.substring(part1.length, text.length));
    }
  }

  static bool isRtlLocale(String localeCode) =>
      _rtlLocaleCodes.contains(localeCode);

  static String getFilename({
    required String appInfo,
    required String header,
    required String formDate,
  }) {
    return _removeIllegalFilenameCharacters(
      _getDefFilename(appInfo, header, formDate),
    );
  }

  static String _getDefFilename(String appInf, String headr, String frmtdDate) {
    return "${appAbbreviature}_${appInf}_${headr}_$frmtdDate";
  }

  static String _removeIllegalFilenameCharacters(
    String filename, {
    String newCharacter = '_',
  }) {
    return filename.replaceAll(fileUnavSymbolsRegexp, newCharacter);
  }

  static String stringsToOneWithCommas(Iterable<String?> strings) {
    return strings.map((string) => _getTitleWithQuotas(string)).join(', ');
  }

  static String getUserDescription(User user) {
    if (user.nickname != null && user.nickname!.isNotEmpty) {
      return "${user.nickname} (${user.email})";
    } else {
      return user.email;
    }
  }

  static String dataInKb(Uint8List? fileData) {
    if (fileData != null) {
      return "${_convDoubleDig1(fileData.lengthInBytes / 1024)} KB";
    } else {
      return "No data";
    }
  }

  static String _convDoubleDig1(double value) => _convDoubleAction(value, 1);

  static String doubleDig2(double value) => _convDoubleAction(value, 2);

  static String _convDoubleAction(double value, int fractionDigits) {
    return value.toStringAsFixed(fractionDigits);
  }

  static String? ifEmptyNull(String? text) {
    return text != null && text.isNotEmpty ? text : null;
  }

  static String getTextOrDashIfEmpty(String? text) {
    return ifEmptyNull(text) ?? HelperText.dashChar;
  }

  static String mergeTwoWithDivider(
      String? first, String? second, String divider) {
    first ??= "";
    String? scndNullable = ifEmptyNull(second);

    if (scndNullable != null) {
      if (first.isNotEmpty) {
        first += "$divider$scndNullable";
      } else {
        first = scndNullable;
      }
    }
    return first;
  }

  static const noBreakSpaceCharacter = "\u00A0";
  static const newLineCharacter = "\u000A";
  static const _malformedChar = "\uFFFD"; // "�"
  static const dashChar = "\u2014"; // "—"
  static const numberoChar = "\u004E\u00BA"; // "\u2116"; "№" - error in arabic.
  static const ellipsisCharacter = "\u2026"; // "...".
}

String _getTitleWithQuotas(String? title) => title != null ? '"$title"' : '""';

const _rtlLocaleCodes = [
  'ar', // Arabic
  'ur', // Urdu
  // 'fa', // Farsi
  // 'he', // Hebrew
  // 'ps', // Pashto
];

// const _nbsp = 0x00A0;
// final _nbspString = String.fromCharCode(_nbsp);
