import 'package:data/data.dart';
import 'package:store_package/factory.dart';

abstract class ApiFactory {
  static AuthApiMixin get authApi => StoreDependFactory.getAuthApi();

  static SecureStorageApiMixin get secureStorageApi => SecureStorageApi();

  static ShareOutApiMixin get shareOutApi => ShareOutApi();
}
