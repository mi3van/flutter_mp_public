import 'package:domain/domain.dart';

// Context, Locale, Material locale, Theme, Theme palette.
mixin ControllerHolderMixin<C, L, M, T, P> {
  AppControllerMixin<C, T, P> get appController;
  AppAlertControllerMixin get appAlertController;
  LocalesControllerMixin<C, L, M> get localesController;
  UserControllerMixin get userController;
  SettingsControllerMixin get settingsController;
  AuthControllerMixin get authController;
  SearchItemControllerMixin get searchItemController;
}

mixin InteractorHolderMixin {
  AppInteractorMixin get appInteractor;
  UserInteractorMixin get userInteractor;
  DbMigrateInteractorMixin get dbMigrateInteractor;
  SettingsInteractorMixin get settingsInteractor;
  AuthInteractorMixin get authInteractor;

  SearchItemInteractorMixin get searchItemInteractor;
  ShareOutInteractorMixin get shareOutInteractor;
}

mixin RepositoryHolderMixin {
  AppRepositoryMixin get appRepository;
  UserRepositoryMixin get userRepository;
  SecureStorageRepositoryMixin get secureStorageRepository;
  UserSettingsRepositoryMixin get userSettingsRepository;
  AuthRepositoryMixin get authRepository;

  MarketRepositoryMixin get marketRepository;
  HttpRepositoryMixin get httpRepository;
  ShareOutRepositoryMixin get shareOutRepository;
}
