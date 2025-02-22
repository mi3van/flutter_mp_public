import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/service_locator/palette_mixin.dart';
import 'package:my_precious/presentation/flutter_ui/common/lib_color_schemes.g.dart';

class ThemePalette {
  static Map<int, Color> get primaryOrig => _primaryLightPalette;
  static Map<int, Color> get secondaryOrig => _secondaryLightPalette;
  static Map<int, Color> get tertiaryOrig => _tertiaryLightPalette;

  static final primaryMiddleColor = primaryOrig[50]!;
  static final secondaryMiddleColor = secondaryOrig[50]!;
  static final tertiaryMiddleColor = tertiaryOrig[50]!;

  static PaletteMixin of(ThemeData theme) {
    if (theme.brightness == Brightness.dark) {
      return _PaletteDark();
    } else {
      return _PaletteLight();
    }
  }

  static TextStyle? getActionChipStyle(
    ThemeData theme,
    bool isAvailable, {
    Color? availableTextColor,
  }) {
    final availableTextStyle = availableTextColor == null
        ? null
        : theme.textTheme.labelLarge?.copyWith(color: availableTextColor);

    return isAvailable
        ? availableTextStyle
        // Text style to forbid chip
        : theme.textTheme.labelLarge?.copyWith(
            color: ThemePalette.secondaryMiddleColor,
          );
  }

  static Color? getActionChipBackground(ThemeData theme, bool isAvailable) =>
      isAvailable ? null : theme.colorScheme.surface;
}

class _PaletteLight implements PaletteMixin {
  @override
  get brightness => Brightness.light;
  @override
  get primary => _primaryLightPalette;
  @override
  get secondary => _secondaryLightPalette;
  @override
  get tertiary => _tertiaryLightPalette;
  @override
  final surface = _surfaceLightPalette();
  @override
  final onSurface05 = _onSurface05LightPalette();
  @override
  final onSurface12 = _onSurface12LightPalette();
  @override
  late final onSurface05WithAlpha = onSurface05.withAlpha(_convnientAboveAlpha);
  @override
  late final onSurface12WithAlpha = onSurface12.withAlpha(_convnientAboveAlpha);
}

class _PaletteDark implements PaletteMixin {
  @override
  get brightness => Brightness.dark;
  @override
  final primary = _primaryDarkPalette();
  @override
  final secondary = _secondaryDarkPalette();
  @override
  final tertiary = _tertiaryDarkPalette();
  @override
  final surface = _surfaceDarkPalette();
  @override
  Color onSurface05 = _onSurface05DarkPalette();
  @override
  Color onSurface12 = _onSurface12DarkPalette();
  @override
  late final onSurface05WithAlpha = onSurface05.withAlpha(_convnientAboveAlpha);
  @override
  late final onSurface12WithAlpha = onSurface12.withAlpha(_convnientAboveAlpha);
}

const _convnientAboveAlpha = 156;

_surfaceLightPalette() => _surfacePalette(lightColorScheme);
_onSurface05LightPalette() => _calculateOnSurfaceColor(13, lightColorScheme);
_onSurface12LightPalette() => _calculateOnSurfaceColor(31, lightColorScheme);

final Map<int, Color> _primaryLightPalette = _calculateMaterialPalette(
  main40: lightColorScheme.primary,
  mainContainer: lightColorScheme.primaryContainer,
  onMainContainer: lightColorScheme.onPrimaryContainer,
  altMain40: darkColorScheme.primary,
  altMainContainer: darkColorScheme.primaryContainer,
  altOnMain: darkColorScheme.onPrimary,
);

final Map<int, Color> _secondaryLightPalette = _calculateMaterialPalette(
  main40: lightColorScheme.secondary,
  mainContainer: lightColorScheme.secondaryContainer,
  onMainContainer: lightColorScheme.onSecondaryContainer,
  altMain40: darkColorScheme.secondary,
  altMainContainer: darkColorScheme.secondaryContainer,
  altOnMain: darkColorScheme.onSecondary,
);

final Map<int, Color> _tertiaryLightPalette = _calculateMaterialPalette(
  main40: lightColorScheme.tertiary,
  mainContainer: lightColorScheme.tertiaryContainer,
  onMainContainer: lightColorScheme.onTertiaryContainer,
  altMain40: darkColorScheme.tertiary,
  altMainContainer: darkColorScheme.tertiaryContainer,
  altOnMain: darkColorScheme.onTertiary,
);

_surfaceDarkPalette() => _surfacePalette(darkColorScheme);
_onSurface05DarkPalette() => _calculateOnSurfaceColor(13, darkColorScheme);
_onSurface12DarkPalette() => _calculateOnSurfaceColor(31, darkColorScheme);

_primaryDarkPalette() => _calculateMaterialPalette(
      main40: lightColorScheme.primary,
      mainContainer: lightColorScheme.primaryContainer,
      onMainContainer: lightColorScheme.onPrimaryContainer,
      altMain40: darkColorScheme.primary,
      altMainContainer: darkColorScheme.primaryContainer,
      altOnMain: darkColorScheme.onPrimary,
      isDarkTheme: true,
    );

_secondaryDarkPalette() => _calculateMaterialPalette(
      main40: lightColorScheme.secondary,
      mainContainer: lightColorScheme.secondaryContainer,
      onMainContainer: lightColorScheme.onSecondaryContainer,
      altMain40: darkColorScheme.secondary,
      altMainContainer: darkColorScheme.secondaryContainer,
      altOnMain: darkColorScheme.onSecondary,
      isDarkTheme: true,
    );

_tertiaryDarkPalette() => _calculateMaterialPalette(
      main40: lightColorScheme.tertiary,
      mainContainer: lightColorScheme.tertiaryContainer,
      onMainContainer: lightColorScheme.onTertiaryContainer,
      altMain40: darkColorScheme.tertiary,
      altMainContainer: darkColorScheme.tertiaryContainer,
      altOnMain: darkColorScheme.onTertiary,
      isDarkTheme: true,
    );

Color _increaseMaterialSaturation(Color color) {
  const minEditableSaturation = 0.343;
  const incrementCoefficient = 1.33;

  var hslColor = HSLColor.fromColor(color);
  if (hslColor.saturation <= minEditableSaturation) {
    return color;
  }
  final increment =
      (hslColor.saturation - minEditableSaturation) / incrementCoefficient;

  var newValue = min(max(hslColor.saturation + increment, 0.0), 1.0);
  return hslColor.withSaturation(newValue).toColor();
}

Map<int, Color> _surfacePalette(ColorScheme theme) => {
      1: _calculateSurfaceColor(13, theme),
      2: _calculateSurfaceColor(20, theme),
      3: _calculateSurfaceColor(28, theme),
      4: _calculateSurfaceColor(31, theme),
      5: _calculateSurfaceColor(36, theme),
    };

Color _calculateSurfaceColor(int alpha, ColorScheme theme) {
  return Color.alphaBlend(theme.primary.withAlpha(alpha), theme.surface);
}

Color _calculateOnSurfaceColor(int alpha, ColorScheme theme) {
  return Color.alphaBlend(theme.onSurface.withAlpha(alpha), theme.surface);
}

Map<int, Color> _calculateMaterialPalette({
  required Color main40,
  required Color mainContainer,
  required Color onMainContainer,
  required Color altMain40,
  required Color altMainContainer,
  required Color altOnMain,
  bool isDarkTheme = false,
}) {
  Color c30Dark = _increaseMaterialSaturation(Color.alphaBlend(
    main40.withAlpha(64),
    altMain40,
  ));
  Color c40Dark = _increaseMaterialSaturation(Color.alphaBlend(
    main40.withAlpha(128),
    altMain40,
  ));
  Color c50 = _increaseMaterialSaturation(Color.alphaBlend(
    main40.withAlpha(191),
    altMain40,
  ));

  if (isDarkTheme) {
    Color startColor = Colors.black;
    Color endColor = Colors.white;
    Color c90 = onMainContainer;
    return {
      100: startColor,
      99: _increaseMaterialSaturation(
        Color.alphaBlend(startColor.withAlpha(230), c90),
      ),
      95: _increaseMaterialSaturation(
        Color.alphaBlend(startColor.withAlpha(128), c90),
      ),
      90: c90,
      80: altOnMain,
      70: altMainContainer,
      60: main40,
      50: c50,
      40: c40Dark,
      30: c30Dark,
      20: altMain40,
      10: mainContainer,
      0: endColor,
    };
  } else {
    Color startColor = Colors.white;
    Color endColor = Colors.black;
    Color c90 = mainContainer;
    return {
      100: startColor,
      99: _increaseMaterialSaturation(
        Color.alphaBlend(startColor.withAlpha(230), c90),
      ),
      95: _increaseMaterialSaturation(
        Color.alphaBlend(startColor.withAlpha(128), c90),
      ),
      90: c90,
      80: altMain40,
      70: c30Dark,
      60: c40Dark,
      50: c50,
      40: main40,
      30: altMainContainer,
      20: altOnMain,
      10: onMainContainer,
      0: endColor,
    };
  }
}
