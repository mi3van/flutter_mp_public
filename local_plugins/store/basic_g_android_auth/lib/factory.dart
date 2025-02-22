import 'package:basic_g_android_auth/src_auth/api/auth_android_api.dart';
// ignore: depend_on_referenced_packages
import 'package:data/data.dart';

abstract class GAuthAndroidFactory {
  static AuthApiMixin get instance => GoogleAndroidAuthApi();
}
