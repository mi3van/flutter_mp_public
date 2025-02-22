import 'package:domain/domain.dart';

class SnackbarFast implements SnackbarMixin {
  SnackbarFast(this.message);
  @override
  final String message;
}
