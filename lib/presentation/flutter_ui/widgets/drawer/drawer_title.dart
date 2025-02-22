import 'package:flutter/material.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/flutter_ui/widgets/drawer/drawer_main_list.dart';
import 'package:my_precious/service_locator.dart';

class DrawerTitle extends StatelessWidget {
  final String title;

  const DrawerTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DrawerMainList.itemHeight,
      padding: const EdgeInsets.all(paddingRegular),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: uiLocator.appController.theme(context).textTheme.titleMedium,
      ),
    );
  }
}
