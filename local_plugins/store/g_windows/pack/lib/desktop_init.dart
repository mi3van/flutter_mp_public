// ignore: depend_on_referenced_packages
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:window_size/window_size.dart';

// Run only single instance of flutter desktop application
// https://stackoverflow.com/questions/67233239/run-only-single-instance-of-flutter-desktop-application

void desktopInit() {
  setWindowTitle(appName);
  if (kDebugMode) {
    const debugWindowWidth = 554.0;
    const debugWindowHeight = 1028.0;
    const debugWindowLeft = 1374.0;
    const debugWindowTop = 0.0;
    // Need for 150% scale.
    // const debugWindowWidth = 450.0;
    // const debugWindowHeight = 1018.0;
    // const debugWindowLeft = 1480.0;
    // const debugWindowTop = 0.0;
    const frame = Rect.fromLTWH(
      debugWindowLeft,
      debugWindowTop,
      debugWindowWidth,
      debugWindowHeight,
    );
    setWindowFrame(frame);
  } else {
    const offset = 20.0;
    const frame = Rect.fromLTWH(
      offset,
      offset,
      _desktopUsualWidth,
      _desktopUsualHeight,
    );
    setWindowFrame(frame);
  }

  setWindowMinSize(const Size(_desktopMinWidth, _desktopMinHeight));
  // setWindowMaxSize(const Size(desktopMaxWidth, desktopMaxHeight));
}

// Window ui-settings.
const _desktopUsualWidth = 700.0;
const _desktopUsualHeight = 1000.0;
const _desktopMinWidth = 400.0;
const _desktopMinHeight = 600.0;
// const _desktopMaxWidth = 1280.0;
// const _desktopMaxHeight = 3000.0;
