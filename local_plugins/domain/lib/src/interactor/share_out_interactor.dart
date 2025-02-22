import 'dart:core';

import 'package:domain/domain.dart';

class ShareOutInteractor implements ShareOutInteractorMixin {
  ShareOutRepositoryMixin get _repo => iLocator.shareOutRepository;

  @override
  Future<void> writeToSupport({
    required supportTitle,
    required appVersion,
  }) async {
    return writeEmail(
      subject: supportTitle,
      body: await iLocator.appInteractor.getSysMainInfo(appVersion: appVersion),
    );
  }

  @override
  Future<void> writeEmail({
    required subject,
    body,
  }) async {
    const nbsp = HelperText.noBreakSpaceCharacter;
    await _repo.writeToMail(
      mail: appSupportEmail,
      subject: "$subject $appName $appFolderEnd".replaceAll(" ", nbsp),
      body: body?.replaceAll(" ", nbsp),
    );
  }

  @override
  Future<void> share({required String info}) {
    return _repo.share(info: info);
  }

  @override
  Future<void> shareBlobsAndText({required blobs, String? textData}) {
    return _repo.shareMultiBytes(
      blobs.map((blob) => (
            data: blob.data,
            fileNm: blob.fileId.toString(),
            fileExt: blob.fileType.format,
          )),
      textData: textData,
    );
  }

  @override
  Future<void> shareToClipboard({required info}) {
    return _repo.shareToClipboard(info: info);
  }

  @override
  Future<void> openLinkExternal(String link) => _repo.openLinkExternal(link);

  @override
  Future<void> openDownloadsFolder() => _repo.openDownloadsFolder();
}
