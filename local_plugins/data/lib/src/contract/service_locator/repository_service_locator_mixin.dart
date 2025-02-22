import 'package:data/src/contract/auth_api_mixin.dart';
import 'package:data/src/contract/secure_storage_api_mixin.dart';
import 'package:data/src/contract/share_out_api_mixin.dart';
import 'package:data/src/contract/user_api_mixin.dart';
import 'package:domain/domain.dart';

mixin RepositoryServiceLocatorMixin {
  int get localDbAutoId;
  String get uuidV8Crypto;

  MarketRepositoryMixin get marketRepository;
  HttpRepositoryMixin get httpRepository;
  AuthApiMixin get authApi;
  UserApiMixin get userStorageApi;

  SecureStorageApiMixin get secureStorageApi;

  ShareOutApiMixin get shareOutApi;
}
