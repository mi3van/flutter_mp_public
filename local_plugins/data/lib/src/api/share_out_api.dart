import 'package:data/data.dart';
import 'package:downloadsfolder/downloadsfolder.dart' as downl;
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import 'package:url_launcher/url_launcher_string.dart' as url_str;

class ShareOutApi implements ShareOutApiMixin {
  @override
  Future<void> share({required String info}) {
    return Share.share(info);
  }

  @override
  Future<bool> shareFilesAndText({required xfiles, String? textData}) async {
    return (await Share.shareXFiles(xfiles, text: textData)).status ==
        ShareResultStatus.success;
  }

  @override
  Future<bool?> saveFileToDownl(xfile, {required filename, required fileExt}) {
    return downl.copyFileIntoDownloadFolder(xfile.path, filename,
        desiredExtension: fileExt);
  }

  @override
  Future<void> openLinkExternal(String link) =>
      url_str.launchUrlString(link, mode: url.LaunchMode.externalApplication);

  @override
  Future<void> openUri(Uri uri) {
    return url.launchUrl(uri, mode: url.LaunchMode.externalApplication);
  }

  @override
  Future<void> openDownloadsFolder() => downl.openDownloadFolder();

  @override
  Future<void> shareToClipboard({required String info}) {
    return Clipboard.setData(ClipboardData(text: info));
  }

  static Future<String> get downloadFolderPath async {
    return (await downl.getDownloadDirectory()).path;
  }
}
