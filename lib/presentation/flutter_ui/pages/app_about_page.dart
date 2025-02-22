import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/assets.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/headers/header_text.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/headers/header_text_buttons.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/app_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/scroll_view.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/icon_with_title_on_surface.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/prec_divider_in_column.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/service_locator.dart';

class AppAboutPage extends StatelessWidget {
  const AppAboutPage({super.key});

  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    final theme = uiLocator.appController.theme(context);

    return Scaffold(
      body: PreciousScrollView(
        scrollController: PreciousScrollView.getScrollController(),
        slivers: [
          PreciousSliverAppBar(
            isPinned: true,
            isExpandable: true,
            backgroundImageLink: uiLocator.appModel.holidayMode.mainImgLnk,
            dividerWidget: const PreciousDividerInColumn(verticalPadding: 0),
            mainWidget: HeaderTextWithButtons(
              title: "_locale.aboutAppTitle",
              height: headerInSliverHeight,
              leadingWidget: PreciousTooltip(
                message:
                    uiLocator.localesController.localeM.previousPageTooltip,
                child: const Icon(Icons.arrow_back_rounded),
              ),
              leadingOnPressed: () =>
                  uiLocator.navigationController.onBackPressed(context),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
                paddingRegular, paddingRegular, paddingRegular, 0.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  HeaderText(
                    title: appName,
                    height: headerInSliverHeight,
                    align: Alignment.center,
                  ),
                  Text(
                    "_locale.feature",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: paddingMicro),
                  Text(
                    "_locale.featureLongDescription",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: paddingSmaller),
                  const PreciousDividerInColumn(
                    verticalPadding: paddingSmaller,
                    bottomPadding: paddingRegular,
                  ),
                  IconWithTitleOnSurface(
                    iconData: Icons.support_agent_rounded,
                    title: "_locale.supportEmail",
                    subtitle: "_locale.supportEmailDescription",
                    onTap: uiLocator.appController.onSupportClick,
                    onLongPress: uiLocator.appController.onSupportLongClick,
                  ),
                  IconWithTitleOnSurface(
                    iconData: Icons.offline_share_outlined,
                    title: "_locale.shareAppLink",
                    subtitle: "_locale.shareAppLinkDescription",
                    onTap: uiLocator.appController.onShareLinkClick,
                    onLongPress: uiLocator.appController.onShareLinkLongClick,
                  ),
                  IconWithTitleOnSurface(
                    iconData: Icons.star_outline_rounded,
                    title: "_locale.rateTheApp",
                    subtitle: "_locale.rateTheAppDescription",
                    onTap: uiLocator.appController.onRateAppClick,
                  ),
                  IconWithTitleOnSurface(
                    iconData: Icons.policy_outlined,
                    title: "_locale.privacyPolicy",
                    subtitle: "_locale.privacyPolicyDescription",
                    onTap: uiLocator.appController.onPrivacyPolicyClick,
                  ),
                  IconWithTitleOnSurface(
                    iconData: Icons.app_settings_alt_outlined,
                    title: "_locale.applicationVersion",
                    subtitle: appVersionDisplay,
                    onTap: uiLocator.appController.onAppVersionClick,
                  ),
                  const PreciousDividerInColumn(),
                  Text(
                    "_locale.thanksForTranslations",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: paddingMicro),
                  Text(
                    translationAuthors,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: paddingSmaller),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.onSurfaceVariant,
                      shape: const StadiumBorder(),
                      backgroundColor: theme.colorScheme.primaryContainer,
                      textStyle: theme.textTheme.labelLarge,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: uiLocator.appController.onSuggestTransltionClick,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: elementHeightRegular,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "_locale.suggestTranslationTitle",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const PreciousDividerInColumn(),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                        text: "_locale.builtWithTitle",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: paddingMicro,
                          ),
                          child: Image.asset(
                            Assets.flutterLogoGrey.link,
                            color: Colors.grey,
                            colorBlendMode: BlendMode.srcIn,
                            height: elementIconSizeMini,
                            cacheHeight: elementIconSizeRegular.toInt(),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
