// import 'package:pdf/widgets.dart' as pdf_w;
// import 'package:printing/printing.dart';

// abstract class HelperPdfFont {
//   static Future<pdf_w.Font?> getPdfMainFont(String languageCode) async {
//     if (languageCode.startsWith("ar") || languageCode.startsWith("ur")) {
//       return PdfGoogleFonts.notoSansArabicRegular();
//     } else if (languageCode.startsWith("hi")) {
//       return PdfGoogleFonts.hindRegular();
//     } else if (languageCode.startsWith("ja")) {
//       return PdfGoogleFonts.shipporiMinchoRegular();
//     } else if (languageCode.startsWith("ko")) {
//       return PdfGoogleFonts.nanumGothicRegular();
//     } else if (languageCode.startsWith("zh")) {
//       return PdfGoogleFonts.zCOOLXiaoWeiRegular();
//       // Ended with null.
//       // } else if (languageCode.startsWith("ur")) {
//       //   return PdfGoogleFonts.notoNastaliqUrduRegular();
//     } else {
//       return null;
//     }
//   }

// // "ar","ur", - Excluded by ltr check.
//   static const customFonts = [
//     "hi",
//     "ja",
//     "ko",
//     // Cyrillic bold is not supported.
//     "ru",
//     "zh",
//   ];

//   static Future<pdf_w.Font> getIconsFont() => PdfGoogleFonts.notoColorEmoji();

//   static Future<pdf_w.Font> getDefaultFont() =>
//       fontFromAssetBundle('assets/fonts/Roboto-Regular.ttf');
// }
