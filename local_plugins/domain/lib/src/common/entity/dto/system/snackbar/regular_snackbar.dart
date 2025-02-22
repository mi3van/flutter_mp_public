import 'package:domain/domain.dart';

class SnackbarRegular implements SnackbarMixin {
  SnackbarRegular(this.message);
  @override
  final String message;
}
