import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/assets.dart';
import 'package:my_precious/presentation/common/contract/service_locator/palette_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/lib_color_schemes.g.dart'
    show lightColorScheme;
import 'package:my_precious/presentation/flutter_ui/widgets/welcome_widget.dart';
import 'package:my_precious/service_locator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _currentPageView = 0;

  AppLocale get _locale => uiLocator.localesController.locale;
  PaletteMixin get _palette => uiLocator.appController.palette;

  @override
  Widget build(BuildContext context) {
    final colorScheme = uiLocator.appController.theme(context).colorScheme;
    final welcomeColors = [
      _palette.primary[40],
      _palette.primary[60],
      _palette.primary[80],
      _palette.primary[90],
    ];
    Color diamondColor, cameraColor;
    if (uiLocator.appController.palette.brightness == Brightness.dark) {
      diamondColor = Colors.white;
      cameraColor = lightColorScheme.surface;
    } else {
      diamondColor = colorScheme.onInverseSurface;
      cameraColor = colorScheme.surface;
    }

    return Scaffold(
      body: AnimatedContainer(
        duration: animationDurationSlowest,
        curve: Curves.fastOutSlowIn,
        color: welcomeColors[_currentPageView],
        child: SafeArea(
          child: PageView(
            controller: _pageController,
            onPageChanged: (pageNum) => setState(
              () => _currentPageView = pageNum,
            ),
            children: [
              WelcomeWidget(
                imagePath: Assets.imgSnowflake.link,
                color: diamondColor,
                title: "_locale.welcomePageGreetingsTitle",
                description: "_locale.welcomePageGreetingsDescription",
                onTap: _nextPageTap,
              ),
              WelcomeWidget(
                imagePath: Assets.imgSnowflake.link,
                color: cameraColor,
                title: "_locale.welcomePageSaveTitle",
                description: "_locale.welcomePageSaveDescription",
                onTap: _nextPageTap,
              ),
              WelcomeWidget(
                imagePath: Assets.imgSnowflake.link,
                color: colorScheme.inverseSurface,
                title: "_locale.welcomePageSearchTitle",
                description: "_locale.welcomePageSearchDescription",
                onTap: _nextPageTap,
              ),
              WelcomeWidget(
                imagePath: Assets.imgSnowflake.link,
                color: colorScheme.onSurfaceVariant,
                title: "_locale.welcomePageSyncTitle",
                description: "_locale.welcomePageSyncDescription",
                onTap: () =>
                    uiLocator.appController.onWelcomeWatchedClick(context),
                isFabBig: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _nextPageTap() => _pageController.nextPage(
        duration: animationDurationSlow,
        curve: Curves.fastOutSlowIn,
      );
}
