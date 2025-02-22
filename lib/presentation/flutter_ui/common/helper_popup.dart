import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/common/theme_palette.dart';
import 'package:my_precious/service_locator.dart';

abstract class HelperPopup {
  static Future<void> showPopupMenu(
    BuildContext context,
    List<PopupMenuEntry<void>> items, {
    Offset offset = const Offset(5, 5),
  }) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;

    return showMenu(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusSmall),
      ),
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(
            button.size.topLeft(Offset.zero) + offset,
            ancestor: overlay,
          ),
          button.localToGlobal(
            button.size.bottomRight(Offset.zero) - offset,
            ancestor: overlay,
          ),
        ),
        Offset.zero & overlay.size,
      ),
      color: uiLocator.appController.theme(context).colorScheme.surface,
      items: items,
    );
  }

  static Widget getTooltipDefault(
    BuildContext context, {
    required Widget content,
    required Widget child,
    JustTheController? controller,
  }) {
    return JustTheTooltip(
      controller: controller,
      content: Padding(
        padding: const EdgeInsets.all(paddingSmaller),
        child: content,
      ),
      waitDuration: tooltipWaitDuration,
      margin: const EdgeInsets.all(paddingSmaller),
      backgroundColor: uiLocator.appController.palette.surface[3],
      borderRadius: const BorderRadius.all(
        Radius.circular(borderRadiusSmall),
      ),
      tailLength: 6.0,
      tailBaseWidth: 8.0,
      shadow: BoxShadow(
        color: Colors.black87.withAlpha(77),
        offset: Offset.zero,
        blurRadius: 0.0,
      ),
      child: child,
    );
  }

  static TextStyle? getTooltipTextStyle(BuildContext context) {
    return uiLocator.appController
        .theme(context)
        .textTheme
        .labelSmall
        ?.copyWith(
          color: ThemePalette.secondaryMiddleColor,
        );
  }

  static void showToastWaitLittle() {
    return uiLocator.appAlertController.showSnackBarCode(
      SnackbarCodeType.waitLittle,
    );
  }

  static void showToastNeedInternet() {
    return uiLocator.appAlertController.showSnackBarCode(
      SnackbarCodeType.internetRequired,
    );
  }
}
