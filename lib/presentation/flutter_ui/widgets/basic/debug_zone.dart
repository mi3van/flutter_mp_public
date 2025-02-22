import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';

class DebugZone extends StatelessWidget {
  final Widget child;

  const DebugZone({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingSmaller),
      decoration: BoxDecoration(color: Colors.deepPurple.shade300),
      child: child,
    );
  }
}
