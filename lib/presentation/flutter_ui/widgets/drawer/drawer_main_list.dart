import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets//basic/divider_in_column.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/headers/header_text.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/drawer/drawer_button_icon.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/drawer/drawer_button_widget.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/drawer/drawer_title.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/user/_user_mini_avatar.dart';
import 'package:my_precious/service_locator.dart';

const _dividerVerticalPadding = 0.0;

class DrawerMainList extends StatelessWidget {
  const DrawerMainList({super.key});

  static const double itemHeight = elementHeightBig;
  static const double itemHeightMini = itemHeight - 10.0;
  static const double maxWidth = drawerMaxWidth;
  static final double _avatarPadding =
      paddingRegular - UserMiniAvatar.avatarDiff;
  static final double _textPadding = paddingSmall - UserMiniAvatar.avatarDiff;

  AppLocale get _locale => uiLocator.localesController.locale;

  @override
  Widget build(BuildContext context) {
    final colorScheme = uiLocator.appController.theme(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(paddingSmall),
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => uiLocator.navigationController
                .fromDrawerAppNameClicked(context),
            child: HeaderText(
              title: appName,
              height: DrawerMainList.itemHeightMini,
              align: AlignmentDirectional.bottomStart,
              horizontalPadding: paddingRegular,
            ),
          ),
        ),
        DrawerButtonWidget(
          title: "_locale.toMyProfile",
          tooltip: "_locale.openProfilePage",
          leadingWidget: UserMiniAvatar(),
          padding: EdgeInsetsDirectional.fromSTEB(
              _avatarPadding, 0, paddingRegular, 0),
          textPadding: _textPadding,
          onPressed: () =>
              uiLocator.navigationController.fromDrawerUserClicked(context),
        ),
        DividerInColumn(
          color: colorScheme.outline,
          verticalPadding: _dividerVerticalPadding,
        ),
        DrawerTitle(title: "_locale.others"),
        DrawerMyButtonIcon(
          title: "_locale.settings",
          iconData: Icons.miscellaneous_services_rounded,
          onPressed: () =>
              uiLocator.navigationController.fromDrawerSettingsClicked(context),
        ),
      ],
    );
  }
}
