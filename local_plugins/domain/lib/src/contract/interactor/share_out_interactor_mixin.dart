import 'package:domain/src/common/entity/dto/blob_file.dart';

mixin ShareOutInteractorMixin on BaseShareOutInterRepoApiMixin {
  Future<void> writeToSupport({
    required String supportTitle,
    required String appVersion,
  });

  Future<void> writeEmail({
    required String subject,
    String? body,
  });

  Future<void> shareBlobsAndText(
      {required List<BlobFile> blobs, String? textData});
}

mixin BaseShareOutInterRepoApiMixin {
  Future<void> openDownloadsFolder();

  Future<void> openLinkExternal(String link);

  Future<void> share({required String info});

  Future<void> shareToClipboard({required String info});
}
