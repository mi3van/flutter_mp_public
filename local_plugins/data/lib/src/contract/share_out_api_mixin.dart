import 'package:cross_file/cross_file.dart';
import 'package:domain/domain.dart';

mixin ShareOutApiMixin on BaseShareOutInterRepoApiMixin {
  Future<void> openUri(Uri uri);

  Future<bool> shareFilesAndText({
    required List<XFile> xfiles,
    String? textData,
  });
  Future<bool?> saveFileToDownl(
    XFile xfile, {
    required String filename,
    required String fileExt,
  });
}
