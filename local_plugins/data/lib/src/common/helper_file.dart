import 'dart:convert';
import 'dart:io' show Directory;

import 'package:cross_file/cross_file.dart';
import 'package:domain/domain.dart';
import 'package:path_provider/path_provider.dart' show getTemporaryDirectory;

abstract class HelperFile {
  static Map<String, String> appMimes = {
    "pdf": "application/pdf",
    "xlsx": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "txt": "text/plain",
    "mm": "application/x-freemind",
    MyFileType.image.format: "image/jpeg",
    MyFileType.custom.format: "image/jpeg",
    MyFileType.imagePng.format: "image/png",
  };

  static Future<void> deleteCacheDir({Directory? directory}) async {
    directory ??= await getTemporaryDirectory();
    try {
      if (await directory.exists()) await directory.delete(recursive: true);
    } catch (_) {}
  }

  static Iterable<String> xFileListToPaths(Iterable<XFile> xFiles) {
    return xFiles.map(_xFileToPath);
  }

  static String? xFileToPathNullable(XFile? xFile) {
    return xFile != null ? _xFileToPath(xFile) : null;
  }

  // For import:
  static Future<List<Map<String, dynamic>>> jsonBs64ToImgs(
    ({List<Map<String, dynamic>> jsonList, String imgField}) data,
  ) async {
    return data.jsonList.map((jMap) {
      final imgData = jMap[data.imgField];
      if (imgData != null && imgData is String) {
        jMap[data.imgField] = base64Decode(imgData);
      }
      return jMap;
    }).toList();
  }

  // For export:
  static Future<List<Map<String, dynamic>>> jsonImgsToBs64(
    ({List<Map<String, dynamic>> jsonList, String imgField}) data,
  ) async {
    return data.jsonList.map((jMap) {
      final imgData = jMap[data.imgField];
      if (imgData != null && imgData is List) {
        jMap[data.imgField] = base64Encode(imgData.cast<int>());
      }
      return jMap;
    }).toList();
  }
}

String _xFileToPath(XFile xFile) => xFile.path;
