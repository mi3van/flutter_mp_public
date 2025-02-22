import 'package:domain/src/common/entity/enums/code_exception.dart';
import 'package:domain/src/common/exception/base_exception.dart';
import 'package:domain/src/common/helper_text.dart';

class ToMeAccessRemovedException extends BaseException {
  ToMeAccessRemovedException({
    required List<String> namesList,
  }) : accessMessage = HelperText.stringsToOneWithCommas(namesList);

  final String accessMessage;

  @override
  ExceptionCode get code => ExceptionCode.toMeAccessRemovedException;
}
