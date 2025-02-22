import 'package:domain/domain.dart';

class SyncEventNotFoundException extends BaseException {
  SyncEventNotFoundException();

  @override
  ExceptionCode get code => ExceptionCode.syncEventNotFoundException;
}
