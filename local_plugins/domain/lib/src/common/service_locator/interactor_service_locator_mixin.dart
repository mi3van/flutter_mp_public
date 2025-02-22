import 'package:domain/domain.dart';

mixin InteractorServiceLocatorMixin<C, L, M, T, P>
    on
        ControllerHolderMixin<C, L, M, T, P>,
        InteractorHolderMixin,
        RepositoryHolderMixin,
        CommonLocatorMixin {
  Set<InitsAsyncMixin> get necessaryInitsInScope;
  Set<InitsAsyncMixin> get additionalInitsInScope;
  Set<DisposeMixin> get disposablesInScope;
  Set<LifecycleMixin> get lifecyclesInScope;
}
