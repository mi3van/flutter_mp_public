import 'package:flutter/widgets.dart';

abstract class HelperAnimation {
  static const _defaultZeroOffset = Offset(0.0, 0.0);
  static const _defaultYPositiveOffset = Offset(0.0, 1.0);
  static const _defaultYNegativeOffset = Offset(0.0, -1.0);
  static const _defaultXPositiveOffset = Offset(1.0, 0.0);
  static const _defaultXNegativeOffset = Offset(-1.0, 0.0);

  static Tween<Offset> get tweenOffsetUp => Tween<Offset>(
        begin: _defaultYPositiveOffset,
        end: _defaultZeroOffset,
      );

  static Tween<Offset> get tweenOffsetDown => Tween<Offset>(
        begin: _defaultYNegativeOffset,
        end: _defaultZeroOffset,
      );

  static Tween<Offset> get tweenOffsetRight => Tween<Offset>(
        begin: _defaultXPositiveOffset,
        end: _defaultZeroOffset,
      );

  static Tween<Offset> get tweenOffsetLeft => Tween<Offset>(
        begin: _defaultXNegativeOffset,
        end: _defaultZeroOffset,
      );

  static const _defaultZeroOpacity = 0.0;
  static const _defaultPartialOpacity = 0.8;

  static Tween<double> get tweenFromPartialOpacity => Tween<double>(
        begin: _defaultPartialOpacity,
        end: _defaultZeroOpacity,
      );

  static Tween<double> get tweenToPartialOffset => Tween<double>(
        begin: _defaultZeroOpacity,
        end: _defaultPartialOpacity,
      );
}
