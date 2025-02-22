import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/auth_model_controller_mixin.dart';
import 'package:my_precious/presentation/common/contract/model_controller/user_model_controller_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/headers/header_text_buttons.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/bottom_bar/precious_root_bottom_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/drawer/drawer_main_list.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/app_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/for_slivers/scroll_view.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/icon_with_title_primary.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/loader_app_bar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/tooltip.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/cloud_selection_widget.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/data_control_widget.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/edit_user_avatar.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/sync_control_widget.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/try_connect_widget.dart';
import 'package:my_precious/service_locator.dart';

// const _smallListSpace = SizedBox(height: paddingSmaller);
// const _regularListSpace = SizedBox(height: paddingRegular);

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (b, _) =>
          uiLocator.navigationController.onRootPop(context),
      child: Scaffold(
        drawer: SafeArea(
          child: Drawer(
            backgroundColor: uiLocator.appController.palette.surface[1],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadiusBig),
              ),
            ),
            child: const DrawerMainList(),
          ),
        ),
        bottomNavigationBar: const SafeArea(child: RootBottomBar()),
        resizeToAvoidBottomInset: true,
        body: PreciousScrollView(
          scrollController: PreciousScrollView.getScrollController(),
          slivers: [
            PreciousSliverAppBar(
              isPinned: true,
              isExpandable: true,
              backgroundImageLink: uiLocator.appModel.holidayMode.mainImgLnk,
              mainWidget: HeaderTextWithButtons(
                title: "_locale.profile",
                height: headerInSliverHeight,
                leadingWidget: PreciousTooltip(
                  message:
                      uiLocator.localesController.localeM.previousPageTooltip,
                  child: const Icon(Icons.arrow_back_rounded),
                ),
                leadingOnPressed: () =>
                    uiLocator.navigationController.onBackPressed(context),
              ),
              dividerWidget: _UserDividerProgressBar(),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    const SizedBox(height: paddingRegular),
                    const EditUserAvatar(),

                    IconWithTitlePrimary(
                      iconData: Icons.cloud_sync_rounded,
                      titleText: "_locale.dataSynchronization",
                    ),
                    _SynchronizationSignIn(),

                    IconWithTitlePrimary(
                      iconData: Icons.rule_folder_outlined,
                      titleText: "_locale.userPageHeaderDataManagement",
                    ),
                    DataControlWidget(),

                    IconWithTitlePrimary(
                      iconData: Icons.analytics_outlined,
                      titleText: "_locale.yourStatistics",
                    ),
                    // Text(
                    //   'Your organized inventory for all elapsed time:\n'
                    //   'Total items amount - 308,\n'
                    //   'of these, is objects - 288!',
                    //   textAlign: TextAlign.center,
                    //   style: theme.textTheme.bodyLarge,
                    // ),
                    Text(
                      '${"_locale.youAreWellDoneForHelpingNature"}\n'
                      '${"_locale.thankYou"}',
                      textAlign: TextAlign.center,
                      style: uiLocator.appController
                          .theme(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                            color: ThemePalette.secondaryMiddleColor,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserDividerProgressBar extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final isUserLoading =
        watchX((UserModelControllerMixin model) => model.isUserLoadingNotifier);
    final isAuthLoading =
        watchX((AuthModelControllerMixin model) => model.isAuthLoadingNotifier);

    return PreciousLoaderAppBar(
      isLoading: isUserLoading || isAuthLoading,
    );
  }
}

class _SynchronizationSignIn extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final isSignedIn = watchX(
        (AuthModelControllerMixin model) => model.isUserSignedInNotifier);
    final isCredentialsExist = watchX(
        (AuthModelControllerMixin model) => model.isCredentialsExistNotifier);
    return isSignedIn == true
        ? SynchronizationControlWidget()
        : isCredentialsExist != true
            ? CloudSelectionWidget()
            : TryConnectWidget();
  }
}
