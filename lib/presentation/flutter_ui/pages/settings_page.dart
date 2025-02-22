import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/headers/header_text_buttons.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/app_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/scroll_view.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/icon_with_title_primary.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/icon_with_title_primary_info.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/loader_app_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/settings/image_compress_chips.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/settings/language_dropdown.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/settings/sign_in_required_widget.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/settings/sync_frequency_chips.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/settings/theme_chips.dart';
import 'package:my_precious/service_locator.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  AppLocale get _locale => uiLocator.localesController.locale;
  AppLocaleM get _materialL => uiLocator.localesController.localeM;

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
            mainWidget: HeaderTextWithButtons(
              title: "_locale.settings",
              height: headerInSliverHeight,
              leadingWidget: PreciousTooltip(
                message: _materialL.previousPageTooltip,
                child: const Icon(Icons.arrow_back_rounded),
              ),
              leadingOnPressed: () =>
                  uiLocator.navigationController.onBackPressed(context),
              secondaryWidget: PreciousTooltip(
                message: _materialL.aboutListTileTitle(appName),
                child: const Icon(Icons.info_outline_rounded),
              ),
              secondaryOnPressed: (tapContext) =>
                  uiLocator.navigationController.appAboutClicked(tapContext),
            ),
            dividerWidget: _HeaderDividerProgressBar(),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  // Language
                  IconWithTitlePrimary(
                    iconData: Icons.translate_rounded,
                    titleText: "_locale.appLanguage",
                  ),
                  LanguageDropdown(),

                  // Stylization
                  IconWithTitlePrimary(
                    iconData: Icons.settings_brightness_outlined,
                    titleText: "_locale.stylization",
                  ),
                  ThemeChips(),

                  // Sort order
                  IconWithTitlePrimary(
                    iconData: Icons.format_line_spacing_rounded,
                    titleText: "_locale.settingsPageSortingTitle",
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.onSurfaceVariant,
                      shape: const StadiumBorder(),
                      backgroundColor: theme.colorScheme.primaryContainer,
                      textStyle: theme.textTheme.labelLarge,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () => uiLocator.navigationController
                        .fromSettingsSortModeClicked(context),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: elementHeightRegular,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "_locale.sortingPanelTitle",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  // Sync frequency
                  IconWithTitlePrimaryWithInfo(
                    iconData: Icons.cloud_sync_rounded,
                    titleText: "_locale.settingsPageAutosyncTitle",
                    onInfoClick:
                        uiLocator.settingsController.syncFrequencyInfoClick,
                  ),
                  _SyncFrequencyOrAuthRequired(),

                  // Image compress
                  IconWithTitlePrimaryWithInfo(
                    iconData: Icons.wallpaper_rounded,
                    titleText: "_locale.imageCompressTitle",
                    onInfoClick:
                        uiLocator.settingsController.imageCompressInfoClick,
                  ),
                  ImageCompressChips(),

                  // const IconWithTitlePrimary(
                  //   iconData: Icons.check_circle_outline_rounded,
                  //   titleText: locale.Major button action,
                  // ),
                  // SelectMajorButton(),
                  // IconWithTitlePrimary(
                  //   iconData: Icons.auto_delete_outlined,
                  //   titleText: locale.autoClearingAfterPrint,
                  // ),
                  // PrintCleanChips(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SyncFrequencyOrAuthRequired extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final isCredentialsExist = watchX<AuthModelControllerMixin, bool?>(
      (model) => model.isCredentialsExistNotifier,
    );
    return isCredentialsExist == true
        ? SyncFrequencyChips()
        : SignInRequiredWidget();
  }
}

class _HeaderDividerProgressBar extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final isSettingsLoading = watchX((SettingsModelControllerMixin model) =>
        model.isSettingsLoadingNotifier);

    return PreciousLoaderAppBar(isLoading: isSettingsLoading);
  }
}
