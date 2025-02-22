import 'package:domain/domain.dart';

class SnackbarCode implements SnackbarMixin {
  SnackbarCode(this.type);

  final SnackbarCodeType type;
  @override
  String? message;
}
