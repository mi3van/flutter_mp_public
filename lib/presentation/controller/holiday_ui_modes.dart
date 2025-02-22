import 'package:my_precious/presentation/common/contract/entity/enums/assets.dart';
import 'package:my_precious/presentation/common/contract/model_controller/app_model_controller_mixin.dart';

class RegularDayHolidayUiMode implements HolidayUiModeMixin {
  @override
  String get mainImgLnk => Assets.imgSnowflake.link;
}

class ChristmasHolidayUiMode implements HolidayUiModeMixin {
  @override
  String get mainImgLnk => Assets.imgSnowflake.link;
}
