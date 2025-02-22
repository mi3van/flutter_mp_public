import 'package:domain/domain.dart';
import 'package:domain/src/interactor/app_interactor.dart';
import 'package:domain/src/interactor/auth_interactor.dart';
import 'package:domain/src/interactor/db_migration_interactor.dart';
import 'package:domain/src/interactor/search_item_interactor.dart';
import 'package:domain/src/interactor/settings_interactor.dart';
import 'package:domain/src/interactor/share_out_interactor.dart';
import 'package:domain/src/interactor/user_interactor.dart';

abstract class InteractorFactory {
  static AppInteractorMixin get appInteractor => AppInteractor();

  static UserInteractorMixin get userInteractor => UserInteractor();

  static SettingsInteractorMixin get settingsInteractor => SettingsInteractor();

  static AuthInteractorMixin get authInteractor => AuthInteractor();

  static SearchItemInteractorMixin get searchItemInteractor =>
      SearchItemInteractor();

  static DbMigrateInteractorMixin get dbMigrationInteractor =>
      DbMigrationInteractor();

  static ShareOutInteractorMixin get shareOutInter => ShareOutInteractor();
}
