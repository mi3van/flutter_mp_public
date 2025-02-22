import 'package:domain/src/common/entity/enums/code_exception.dart';
import 'package:domain/src/common/exception/base_exception.dart';

class CameraAccessException extends BaseException {
  @override
  ExceptionCode get code => ExceptionCode.cameraAccessException;

  static const cameraDeniedCode = 'CameraAccessDenied';
  static const scannerDeniedCode = 'camera_access_denied';
}
