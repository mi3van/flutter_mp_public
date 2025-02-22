import 'dart:convert' show json, utf8;

abstract class TypeConverter {
  static String mapToJson(Map<String, dynamic> map) {
    return json.encode(map);
  }

  static Map<String, dynamic> mapFromJson(String jsonMap) {
    return json.decode(jsonMap);
  }

  // List<String>
  static String? listStringToString(List<String>? strList) {
    if (strList != null) {
      return json.encode(strList);
    } else {
      return null;
    }
  }

  static List<String>? listStringFromString(String? strListInString) {
    if (strListInString != null) {
      return (List<String>.from(json.decode(strListInString)));
    } else {
      return null;
    }
  }

  // bool
  static String? boolToString(bool? booleanValue) {
    return booleanValue?.toString();
  }

  static bool boolFromString(String? boolInString) {
    return boolInString != 'false';
  }

  static String? twoStringsToOne(String? firstPart, String? secondPart) {
    return secondPart == null || firstPart == null
        ? firstPart
        : "$firstPart$secondPart";
  }

  // String-UTF
  static List<int> stringToUtf8(String string) {
    return utf8.encode(string);
  }

  static String utf8ToString(List<int> utf8List) {
    return utf8.decode(utf8List, allowMalformed: true);
  }

  static int stringToInt(String string) {
    return int.parse(string, radix: 10);
  }

  static int? stringTryToInt(String? string) {
    return string != null ? int.tryParse(string, radix: 10) : null;
  }

  static String? intToString(int? intValue) {
    return intValue?.toString();
  }
}
