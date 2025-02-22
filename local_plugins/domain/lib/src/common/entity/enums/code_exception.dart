enum ExceptionCode {
  commonInputValueException(1),
  cameraAccessException(2),
  commonRequestException(3),
  dataSavingException(4),
  passwordCharCountException(5),
  imgsListIsOverflowException(6),
  noCurrentItemException(7),
  noInternetException(8),
  notAuthUserException(9),
  itemNoParentMoveToRootException(10),
  noUserException(11),
  cloudAccessException(12),
  requestDataNotFoundException(13),
  userUpdateException(14),
  premiumProductNotFoundException(15),
  shareToOwnerException(16),
  shareToAddedUserException(17),
  cannotSaveItemException(18),
  updateAppForSyncException(19),
  backupReadException(20),
  columnsNumberIsUnsupportedExcepion(21),
  movingItemAlreadyHereException(22),
  movingItemThemselvesException(23),
  movingItemTargetPathException(24),
  deleteFileException(25),
  deleteItemException(26),
  toMeAccessRemovedException(27),
  fileChecksumException(28),
  imageCompressionException(29),
  imageCompressInfo(30),
  sharingNotAvailableException(31),
  cloudFileNotFoundException(32),
  syncEventNotFoundException(33),
  unauthorizedCredsException(34),
  innerSyncAlreadyStartedException(35),
  cloudFilePermissionException(36),
  shareToUserMaxCountException(37),
  syncFrequencyInfo(38),
  noFileException(39),
  pdfManyPagesException(40),
  invalidCharactersException(41),
  ;

  final int value;

  const ExceptionCode(this.value);

  static const noInternetSocketAndroid = 7;
  static const noInternetSocketWindows = 11001;
}
