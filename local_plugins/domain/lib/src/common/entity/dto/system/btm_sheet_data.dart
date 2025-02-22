import 'package:domain/domain.dart';

class BtmSheetData<WidBuilderType> implements BottomSheetMixin<WidBuilderType> {
  BtmSheetData(this.builder);

  @override
  final WidBuilderType builder;
}
