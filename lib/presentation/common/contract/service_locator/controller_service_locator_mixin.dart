import 'package:domain/domain.dart';
import 'package:my_precious/presentation/common/contract/service_locator/presentation_holders.dart';

mixin ControllerServiceLocatorMixin<C, L, M, T, P>
    on
        ControllerHolderMixin<C, L, M, T, P>,
        InteractorHolderMixin,
        ModelHolderMixin {}
