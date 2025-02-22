import 'package:flutter/foundation.dart';

abstract class RustoreDomainConfig {
  // Needs for test purchase in debug.
  static const appId = kDebugMode ? "2063553579" : "2063552537";
  static const fetchAddress = "https://ya.ru/";
  static const appOrigDomain = kDebugMode ? _ruDomain : _origDmain;
  static const appDomainForUi = _ruDomain;
  static const appMarketLink = 'https://www.rustore.ru/catalog/app/$_origDmain';
  static const subsMarketLink = 'https://www.rustore.ru/catalog/';
}

const _origDmain = "com.mi3van.my_precious";
const _ruDomain = "$_origDmain.ru";
