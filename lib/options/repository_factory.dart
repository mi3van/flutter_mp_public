import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:store_package/factory.dart';

abstract class RepositoryFactory {
  static AppRepositoryMixin get appRepository => AppRepository();
  static UserRepositoryMixin get userRepository => UserRepository();
  static SecureStorageRepositoryMixin get secureStorageRepository =>
      SecureStorageRepository();
  static AuthRepositoryMixin get authRepository => AuthRepository();

  static MarketRepositoryMixin get marketRepository =>
      StoreDependFactory.getMarketRepo();

  static HttpRepositoryMixin get httpRepository => HttpRepository();

  static ShareOutRepositoryMixin get shareOutRepo => ShareOutRepository();
}
