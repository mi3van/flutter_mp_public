import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get_it/get_it.dart';
import 'package:my_precious/options/api_factory.dart';
import 'package:my_precious/options/repository_factory.dart';
import 'package:my_precious/presentation/common/contract/export_model_controller.dart';
import 'package:my_precious/presentation/common/contract/service_locator/controller_service_locator_mixin.dart';
import 'package:my_precious/presentation/common/contract/service_locator/presentation_holders.dart';
import 'package:my_precious/presentation/common/contract/service_locator/ui_service_locator_mixin.dart';
import 'package:my_precious/presentation/config.dart';
import 'package:my_precious/presentation/controller/controller_factory.dart';
import 'package:my_precious/presentation/event_handler/event_handler_factory.dart';

GetIt _sl = GetIt.instance;

/// Layers-oriented service locators
final iLocator =
    _InteractorLocator<AppCntxt, AppLocale, AppLocaleM, AppTheme, AppPalette>();
final cLocator =
    _ControllerLocator<AppCntxt, AppLocale, AppLocaleM, AppTheme, AppPalette>();
final uiLocator =
    _UiLocator<AppCntxt, AppLocale, AppLocaleM, AppTheme, AppPalette>();
final rLocator =
    _RepositoryLocator<AppCntxt, AppLocale, AppLocaleM, AppTheme, AppPalette>();

void initServiceLocator(CloudStatus cloudStatus) {
  /// Register app-controllers for basic model-control.
  _sl.registerLazySingleton(() => ControllerFactory.appController);
  _sl.registerLazySingleton(() => InteractorFactory.appInteractor);
  _sl.registerLazySingleton(() => RepositoryFactory.appRepository);

  _sl.registerLazySingleton(() => ControllerFactory.appAlertController);
  _sl.registerLazySingleton(() => ControllerFactory.navigationController);
  _sl.registerLazySingleton(() => ControllerFactory.localesController);
  _sl.registerLazySingleton(
    () => ControllerFactory.getPlatformUiController(cloudStatus),
  );
  _sl.registerLazySingleton(() => ControllerFactory.restorableUiController);

  /// Register event-handler to let control specific
  /// flutter commands with context: show alert, snackbar, etc.
  _sl.registerLazySingleton(() => EventHandlerFactory.alertEventHandler);

  _initLayers();
}

/// Controller is designed to manipulate UI (update binded models),
/// Repository for sending queries to data (API or DB),
/// Interactor is for to be able to send requests to domain logic.
void _initLayers() {
// User part.
  _sl.registerLazySingleton(() => ControllerFactory.userController);
  _sl.registerLazySingleton(() => InteractorFactory.userInteractor);
  _sl.registerLazySingleton(() => RepositoryFactory.userRepository);
// Settings part depends on the user.
  _sl.registerLazySingleton(() => ControllerFactory.settingsController);
  _sl.registerLazySingleton(() => InteractorFactory.settingsInteractor);
  _sl.registerLazySingleton(() => InteractorFactory.dbMigrationInteractor);

// Auth user part.
  _sl.registerLazySingleton(() => ControllerFactory.authController);
  _sl.registerLazySingleton(() => InteractorFactory.authInteractor);
  _sl.registerLazySingleton(() => RepositoryFactory.authRepository);
  _sl.registerLazySingleton(() => ApiFactory.authApi);

// Secure storage part.
  _sl.registerLazySingleton(() => RepositoryFactory.secureStorageRepository);
  _sl.registerLazySingleton(() => ApiFactory.secureStorageApi);

  // Search items part
  _sl.registerLazySingleton(() => ControllerFactory.searchItemController);
  _sl.registerLazySingleton(() => InteractorFactory.searchItemInteractor);

  // Http part.
  _sl.registerLazySingleton(() => RepositoryFactory.httpRepository);

  // Market-oriented repository.
  _sl.registerLazySingleton(() => RepositoryFactory.marketRepository);

  // Share different info outside (text, imgs, links).
  _sl.registerLazySingleton(() => InteractorFactory.shareOutInter);
  _sl.registerLazySingleton(() => RepositoryFactory.shareOutRepo);
  _sl.registerLazySingleton(() => ApiFactory.shareOutApi);
}

class _UiLocator<C, L, M, T, P> extends MainHolder<C, L, M, T, P>
    implements UiServiceLocatorMixin<C, L, M, T, P> {
  @override
  get alertEventHandler => _sl();
  @override
  get navigationController =>
      _sl<NavigationControllerMixin>() as NavigationControllerMixin<C>;
  @override
  get platformUiController => _sl();
  @override
  get restorationUiController => restorableMC;
}

class _ControllerLocator<C, L, M, T, P> extends MainHolder<C, L, M, T, P>
    implements ControllerServiceLocatorMixin<C, L, M, T, P> {}

class _RepositoryLocator<C, L, M, T, P> extends MainHolder<C, L, M, T, P>
    implements RepositoryServiceLocatorMixin {
  @override
  get authApi => _sl();
  @override
  get userStorageApi => _sl();
  @override
  get secureStorageApi => _sl();
  @override
  get shareOutApi => _sl();

  @override
  get localDbAutoId => _sl<AppRepositoryMixin>().localDbAutoId;
  @override
  get uuidV8Crypto => _sl<AppRepositoryMixin>().uuidV8Crypto;
  @override
  get marketRepository => _sl();
  @override
  get httpRepository => _sl();
}

class _InteractorLocator<C, L, M, T, P> extends MainHolder<C, L, M, T, P>
    implements InteractorServiceLocatorMixin<C, L, M, T, P> {
  @override
  get appAlertController => _sl<AppAlertModelControllerMixin>();
  @override
  get appRepository => _sl();
  @override
  get userRepository => _sl();
  @override
  get userSettingsRepository => userRepository;
  @override
  get authRepository => _sl();
  @override
  get secureStorageRepository => _sl();
  @override
  get marketRepository => _sl();
  @override
  get httpRepository => _sl();
  @override
  get shareOutRepository => _sl();
  @override
  Set<InitDisposeMixin> get necessaryInitsInScope => {
        // Consistency is important, user-init first in scope
        userMC,
        settingsMC,
      };
  @override
  Set<InitDisposeMixin> get additionalInitsInScope => {
        authMC,
        searchItemMC,
      };
  @override
  get disposablesInScope => {
        ...necessaryInitsInScope,
        ...additionalInitsInScope,
        restorableMC,
      };
  @override
  get lifecyclesInScope => {};
}

abstract class MainHolder<C, L, M, T, P>
    implements
        ModelHolderMixin,
        ControllerHolderMixin<C, L, M, T, P>,
        InteractorHolderMixin,
        CommonLocatorMixin {
  AppModelControllerMixin get appMC => _sl();
  AppAlertModelControllerMixin get appAlertMC => _sl();
  UserModelControllerMixin get userMC => _sl();
  SettingsModelControllerMixin get settingsMC => _sl();
  AuthModelControllerMixin get authMC => _sl();
  SearchItemModelControllerMixin get searchItemMC => _sl();
  RestorationUiControllerModelMixin get restorableMC => _sl();

  @override
  get appModel => appMC;
  @override
  get appAlertModel => appAlertMC;
  @override
  get searchItemModel => searchItemMC;
  @override
  get userModel => userMC;
  @override
  get settingsModel => settingsMC;
  @override
  get authModel => authMC;
  @override
  get restorationModel => restorableMC;

  @override
  get appController => appMC as AppControllerMixin<C, T, P>;
  @override
  get appAlertController => appAlertMC;
  @override
  get authController => authMC as AuthControllerMixin;
  @override
  get userController => userMC;
  @override
  get settingsController => settingsMC;

  @override
  get searchItemController => searchItemMC as SearchItemControllerMixin;
  @override
  get localesController =>
      _sl<LocalesControllerMixin>() as LocalesControllerMixin<C, L, M>;

  @override
  get appInteractor => _sl();
  @override
  get userInteractor => _sl();
  @override
  get dbMigrateInteractor => _sl();
  @override
  get authInteractor => _sl();
  @override
  get settingsInteractor => _sl();
  @override
  get shareOutInteractor => _sl();
  @override
  get searchItemInteractor => _sl();

// Common part
  @override
  get supportLocales => appSupportLocales;
  @override
  bool get isDebugMode => kDebugMode;
}
