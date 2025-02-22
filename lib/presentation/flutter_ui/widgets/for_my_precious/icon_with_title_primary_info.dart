import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/for_my_precious/icon_with_title_primary.dart';

class IconWithTitlePrimaryWithInfo extends IconWithTitlePrimary {
  IconWithTitlePrimaryWithInfo({
    super.key,
    required super.iconData,
    required super.titleText,
    required this.onInfoClick,
  });

  static const height = elementIconSizeBig;
  static final _imageCompressInfoTopPadding = IconWithTitlePrimary.topPadding +
      ((IconWithTitlePrimary.height - height).toInt() >> 1);

  final VoidCallback onInfoClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: super.build(context)),
        Padding(
          padding: EdgeInsets.only(
            top: _imageCompressInfoTopPadding,
          ),
          child: SizedBox(
            height: height,
            width: height,
            child: IconButton(
              iconSize: elementIconSizeMini,
              icon: const Icon(Icons.info_outline_rounded),
              color: IconWithTitlePrimary.defColor,
              splashRadius: elementIconSizeMini,
              onPressed: onInfoClick,
            ),
          ),
        ),
      ],
    );
  }
}
