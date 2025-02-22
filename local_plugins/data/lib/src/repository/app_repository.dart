import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:uuid/data.dart';
import 'package:uuid/rng.dart';

import 'package:uuid/uuid.dart';

class AppRepository implements AppRepositoryMixin {
  static final _uuidBuilder = Uuid(
    goptions: GlobalOptions(CryptoRNG()),
  );

  @override
  get localDbAutoId => HelperIsarDb.localDbAutoId;

  @override
  String get uuidV8Crypto => _uuidBuilder.v8();
}
