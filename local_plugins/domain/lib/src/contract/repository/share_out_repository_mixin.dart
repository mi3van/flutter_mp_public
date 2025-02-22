import 'package:domain/domain.dart';

typedef DataBytesAndName = DataAndName<List<int>>;
typedef DataAndName<T> = ({T data, String fileNm, String fileExt});

mixin ShareOutRepositoryMixin on BaseShareOutInterRepoApiMixin {
  Future<void> writeToMail({
    required String mail,
    String? subject,
    String? body,
  });

  Future<bool> shareMultiBytes(Iterable<DataBytesAndName> dataList,
      {String? textData});
  Future<bool> shareBytes(DataBytesAndName data, {String? textData});
  Future<bool?> downlBytes(DataBytesAndName data);

  Future<List<int>> convertTextArrayToExcelBytes(
    List<List<String>> textArray,
  );
  Future<List<int>> convertTextArrayToTextBytes(
    List<List<String>> textArray,
  );
  // For import:
  Future<Map<String, List<Map<String, dynamic>>>> convertUtf8ToJsonMap(
    List<int> bytes,
  );
  // For export:
  Future<List<int>> convertJsonMapToUtf8(
    Map<String, List<Map<String, dynamic>>> dataJson,
  );
}
