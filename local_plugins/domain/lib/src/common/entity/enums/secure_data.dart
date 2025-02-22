enum SecureData {
  // Cannot clean:
  originalUserUuid("Temp1"),
  dbVersion("Temp2"),
  sharedToUsersCountLastCheck("Temp3"),
  donationLastDate("Temp4"),
  // Can clean:
  originalUserCreds("Temp5"),
  originalUserPermissionId("Temp6"),
  signedEmail("Temp7"),
  signedName("Temp8"),
  originalUserToMeSharedUuids("Temp9"),
  selectedUserUuid("Temp10"),
  printReportPersonalName("Temp11"),
  printReportPersonalAddress("Temp12"),
  printReportPersonalPhone("Temp13"),
  printReportPersonalEmail("Temp14"),
  printReportInsuranceCompany("Temp15"),
  printReportInsurancePolicy("Temp16"),
  printReportInsurancePhone("Temp17"),
  ;

  const SecureData(this._stringValue);

  final String _stringValue;

  @override
  String toString() => _stringValue;
}
