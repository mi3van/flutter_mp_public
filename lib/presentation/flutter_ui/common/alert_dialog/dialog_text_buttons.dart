import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/service_locator.dart';

class DialogOkTextButton extends StatelessWidget {
  const DialogOkTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogTextButton(
      title: uiLocator.localesController.localeM.okButtonLabel,
    );
  }
}

class DialogCompleteTextButton extends StatelessWidget {
  const DialogCompleteTextButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogTextButton(
      onPressed: onPressed,
      title: "uiLocator.localesController.locale.btnTitleComplete",
      color: uiLocator.appController.theme(context).colorScheme.tertiary,
    );
  }
}

class DialogSetUpNowTextButton extends StatelessWidget {
  const DialogSetUpNowTextButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogTextButton(
      onPressed: onPressed,
      title: "uiLocator.localesController.locale.btnTitleSetUpNow",
      color: uiLocator.appController.theme(context).colorScheme.tertiary,
    );
  }
}

class DialogCloseTextButton extends StatelessWidget {
  const DialogCloseTextButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogTextButton(
      onPressed: onPressed,
      title: uiLocator.localesController.localeM.closeButtonLabel,
    );
  }
}

class DialogCancelTextButton extends StatelessWidget {
  const DialogCancelTextButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogTextButton(
      onPressed: onPressed,
      title: uiLocator.localesController.localeM.cancelButtonLabel,
      color: uiLocator.appController.theme(context).colorScheme.error,
    );
  }
}

class DialogDeleteTextButton extends StatelessWidget {
  const DialogDeleteTextButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogTextButton(
      onPressed: onPressed,
      title: uiLocator.localesController.localeM.deleteButtonTooltip,
      color: uiLocator.appController.theme(context).colorScheme.error,
    );
  }
}

void Function(BuildContext context) _defaultPress =
    (context) => uiLocator.alertEventHandler.hideCurrentAlert(context);

class DialogTextButton extends StatelessWidget {
  DialogTextButton({
    super.key,
    VoidCallback? onPressed,
    required this.title,
    this.color,
  }) : onPressed =
            onPressed != null ? ((context) => onPressed()) : _defaultPress;

  final void Function(BuildContext context) onPressed;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: paddingSmaller,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () => onPressed(context),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: uiLocator.appController
            .theme(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: color),
      ),
    );
  }
}
