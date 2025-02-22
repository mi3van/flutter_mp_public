import 'package:flutter/widgets.dart';

class ChipsData<T> {
  const ChipsData(this.type, {this.iconData});
  final T type;
  final IconData? iconData;
}
