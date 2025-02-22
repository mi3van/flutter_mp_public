import 'dart:io' show File;
import 'dart:typed_data';

// ignore: depend_on_referenced_packages
import 'package:compute/compute.dart';
import 'package:cross_file/cross_file.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:path_provider/path_provider.dart' as path
    show getTemporaryDirectory;

class ShareOutRepository implements ShareOutRepositoryMixin {
  ShareOutApiMixin get _api => rLocator.shareOutApi;
  @override
  Future<void> share({required String info}) {
    return _api.share(info: info);
  }

  @override
  Future<void> openLinkExternal(String link) => _api.openLinkExternal(link);

  @override
  Future<void> openDownloadsFolder() => _api.openDownloadsFolder();

  @override
  Future<void> shareToClipboard({required String info}) {
    return _api.shareToClipboard(info: info);
  }

  @override
  Future<void> writeToMail({required String mail, subject, body}) {
    return _api.openUri(Uri(
      scheme: 'mailto',
      path: mail,
      queryParameters: {'subject': subject, 'body': body},
    ));
  }

  @override
  Future<bool> shareMultiBytes(Iterable<DataBytesAndName> dataLst, {textData}) {
    return _bytesToFilesAndAction(dataLst,
        (xfiles) => _api.shareFilesAndText(xfiles: xfiles, textData: textData));
  }

  @override
  Future<bool> shareBytes(DataBytesAndName data, {textData}) async {
    return _bytesToFilesAndAction([data],
        (xfiles) => _api.shareFilesAndText(xfiles: xfiles, textData: textData));
  }

  @override
  Future<bool?> downlBytes(DataBytesAndName data) async {
    return _bytesToFilesAndAction(
      [data],
      (files) => _api.saveFileToDownl(files.first,
          filename: data.fileNm, fileExt: data.fileExt),
    );
  }

  @override
  Future<List<int>> convertTextArrayToExcelBytes(textArray) =>
      compute(_dataToExcelBytes, textArray);

  @override
  Future<List<int>> convertTextArrayToTextBytes(textArray) =>
      compute(_textArrayToBytes, textArray);

  @override
  Future<List<int>> convertJsonMapToUtf8(dataJson) async {
    return await compute(
        TypeConverter.stringToUtf8,
        await compute(
          TypeConverter.mapToJson,
          dataJson,
        ));
  }

  @override
  convertUtf8ToJsonMap(List<int> bytes) async {
    return await compute(
        _strToJsn,
        await compute(
          TypeConverter.utf8ToString,
          bytes,
        ));
  }

  Future<Map<String, List<Map<String, dynamic>>>> _strToJsn(String encd) async {
    return Map.fromEntries(
      TypeConverter.mapFromJson(encd).entries.map((entry) {
        return MapEntry(
            entry.key, (entry.value as List).cast<Map<String, dynamic>>());
      }),
    );
  }

  Future<T> _bytesToFilesAndAction<T>(
    Iterable<DataBytesAndName> datas,
    Future<T> Function(List<XFile> files) action,
  ) async {
    final tempDir = await path.getTemporaryDirectory();

    final result = await action(
      await Future.wait(
        datas.map(
          (data) async => XFile(
              (await _createFile(
                data.data,
                path: tempDir.path,
                fileNm: data.fileNm,
                fileExt: data.fileExt,
              ))
                  .path,
              mimeType: HelperFile.appMimes[data.fileExt]),
        ),
      ),
    );
    HelperFile.deleteCacheDir(directory: tempDir);

    return result;
  }

  Uint8List _dataToExcelBytes(List<List<String>> dataArray) {
    // final excel = Excel.createExcel()..rename(_defSheetName, appName);
    // // Setup columns width.
    // for (var clmnInfo in _clmnsInfo) {
    //   excel[appName].setColumnWidth(clmnInfo.pstn, clmnInfo.width);
    // }
    // // Add data.
    // for (var rowData in dataArray) {
    //   excel[appName].appendRow(
    //     rowData.map((cellText) => TextCellValue(cellText)).toList(),
    //   );
    // }
    // final result = excel.encode();
    // return result != null
    //     ? Uint8List.fromList(result)
    //     : throw throw DataSavingException(dataPart: "Excel");
    return Uint8List(0);
  }

  List<int> _textArrayToBytes(List<List<String>> textArray) {
    final strBuf = StringBuffer();
    // Add data.
    for (var rowData in textArray) {
      strBuf.writeln(rowData.join(", "));
    }
    return TypeConverter.stringToUtf8(strBuf.toString());
  }

  Future<File> _createFile(List<int> bytes,
      {required String path,
      required String fileNm,
      required String fileExt}) async {
    return (await File("$path/$fileNm.$fileExt").create(recursive: true))
        .writeAsBytes(bytes);
  }
}

const _defSheetName = 'Sheet1';
const _clmnsInfo = [
  (pstn: 2, width: 30.0),
  (pstn: 3, width: 15.0),
  (pstn: 4, width: 12.0),
  (pstn: 5, width: 12.0),
];
