import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

mixin AuthModelControllerMixin implements AuthControllerMixin, AuthModelMixin {}

mixin AuthModelMixin {
  ValueNotifier<bool> get isAuthLoadingNotifier;
  ValueNotifier<bool> get isUserSignedInNotifier;
  ValueNotifier<bool> get isCredentialsExistNotifier;
}
