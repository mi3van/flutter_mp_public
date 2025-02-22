import 'package:flutter/material.dart';

class UnknownRouteWidget extends StatelessWidget {
  static getUnknownRouteBuilder(RouteSettings settings) =>
      MaterialPageRoute<void>(
          builder: (context) => UnknownRouteWidget(routeName: settings.name),
          settings: settings);

  final String? routeName;

  const UnknownRouteWidget({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "uiLocator.localesController.locale.pagingNoRouteFound($routeName!)",
        ),
      ),
    );
  }
}
