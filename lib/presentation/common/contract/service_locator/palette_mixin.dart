import 'dart:ui';

typedef ColorMap = Map<int, Color>;

mixin PaletteMixin {
  Brightness get brightness;
  ColorMap get primary;
  ColorMap get secondary;
  ColorMap get tertiary;
  ColorMap get surface;
  Color get onSurface05;
  Color get onSurface12;
  Color get onSurface05WithAlpha;
  Color get onSurface12WithAlpha;
}
