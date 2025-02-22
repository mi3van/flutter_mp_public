import 'package:flutter/material.dart';

class DropdownText extends StatelessWidget {
  const DropdownText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
    );
  }
}
