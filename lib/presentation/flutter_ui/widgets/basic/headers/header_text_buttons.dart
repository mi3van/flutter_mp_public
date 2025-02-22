import 'package:flutter/material.dart';
import 'package:my_precious/presentation/flutter_ui/widgets//basic/headers/_header_button.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/basic/headers/header_text.dart';

class HeaderTextWithButtons extends HeaderText {
  final Widget leadingWidget;
  final VoidCallback leadingOnPressed;
  final Widget? secondaryWidget;
  final void Function(BuildContext context)? secondaryOnPressed;

  const HeaderTextWithButtons({
    super.key,
    required super.title,
    super.align = Alignment.center,
    required super.height,
    required this.leadingWidget,
    required this.leadingOnPressed,
    super.horizontalPadding,
    this.secondaryWidget,
    this.secondaryOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: height,
          width: height,
          child: HeaderButton(
            iconWidget: leadingWidget,
            onPressed: (context) => leadingOnPressed(),
          ),
        ),
        Expanded(child: super.build(context)),
        SizedBox(
          height: height,
          width: height,
          child: secondaryWidget == null
              ? null
              : HeaderButton(
                  iconWidget: secondaryWidget!,
                  onPressed: (context) {
                    if (secondaryOnPressed != null) {
                      secondaryOnPressed!(context);
                    }
                  },
                ),
        ),
      ],
    );
  }
}
