enum ThemeType {
  auto(_autoValue),
  light(_lightValue),
  dark(_darkValue);

  const ThemeType(this.value);
  final int value;

  static ThemeType fromInt(int value) {
    switch (value) {
      case _autoValue:
        return ThemeType.auto;
      case _lightValue:
        return ThemeType.light;
      case _darkValue:
        return ThemeType.dark;
      default:
        return ThemeType.auto;
    }
  }
}

const _autoValue = 1;
const _lightValue = 2;
const _darkValue = 3;
