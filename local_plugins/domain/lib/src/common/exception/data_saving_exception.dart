import 'package:domain/src/common/entity/enums/code_exception.dart';
import 'package:domain/src/common/exception/base_exception.dart';

class DataSavingException extends BaseException {
  DataSavingException({this.dataPart});
  final String? dataPart;

  @override
  String toString() {
    final superString = super.toString();
    return dataPart == null ? superString : '$superString-$dataPart';
  }

  @override
  ExceptionCode get code => ExceptionCode.dataSavingException;
}
