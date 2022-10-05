class Client {
  late int cLIIDPK;
  late String pARENTNAME;
  late String cLICATEGORYNAME;
  String? cLICATEGORYNAMEEN;
  String? cLIPHOTO;
  late String cLINAME;
  String? cLINAMEENGLISH;
  String? cLIPHONE;
  late String cLIMOBILE;
  String? cLIFAX;
  late String cLIEMAIL;
  String? nATNAME;
  String? nATNAMEEN;
  String? cLIIDENTITYNO;
  String? cLIADDRESS;
  String? cLINOTES;
  bool? cLISTATUS;
  String? cLIIDISSUEDATE;
  String? cLIIDEXPIRYDATE;
  String? cLIRESIDENCYNO;
  String? cLIRESIDENCYEXPIRYDATE;
  String? cLISPONSORNAME;
  String? cLIPASSPORTNO;
  String? cLIPASSPORTISSUEDATE;
  String? cLIPASSPORTEXPIRYDATE;
  String? cLIFAVLANGDESC;
  String? cLIFAVLANGDESCEN;
  String? cLICOMPANYTYPENAME;
  int? iFILE;
  int? CliCategoryID;
  int? NatIdPk;
  String? cLILICENSENO;
  String? cLILICENSEDATE;
  String? cREATEDATE;
  String? cLITAXNUMBER;
  String? cLINOTESEN;
  late List<Classification> classification;

  Client.fromJson(Map<String, dynamic> json) {
    cLIIDPK = json['CLI_ID_PK'];
    CliCategoryID = json['CLI_CATEGORY']??-1;
    NatIdPk = json['NAT_ID_PK']??-1;
    pARENTNAME = json['PARENT_NAME'] ?? '';
    cLICATEGORYNAME = json['CLI_CATEGORY_NAME'] ?? '';
    cLICATEGORYNAMEEN = json['CLI_CATEGORY_NAME_EN'] ?? '';
    // if (json['CLI_PHOTO'] != null) {
    //   cLIPHOTO = json['CLI_PHOTO'];
    // }
    cLINAME = json['CLI_NAME'] ?? '';

    cLINAMEENGLISH =
        json['CLI_NAME_ENGLISH'] == null ? '' : json['CLI_NAME_ENGLISH'];

    cLIPHONE = json['CLI_PHONE'] ?? '';
    cLIMOBILE = json['CLI_MOBILE'] ?? '';
    cLIFAX = json['CLI_FAX'] ?? '';
    cLIEMAIL = json['CLI_EMAIL'] ?? '';
    nATNAME = json['NAT_NAME'] ?? '';
    nATNAMEEN = json['NAT_NAME_EN'] ?? '';
    cLIIDENTITYNO = json['CLI_IDENTITYNO'] ?? '';
    cLIADDRESS = json['CLI_ADDRESS'] ?? 'لايوجد عنوان';
    cLINOTES = json['CLI_NOTES'] ?? '';
    cLISTATUS = json['CLI_STATUS'];
    cLIIDISSUEDATE = json['CLI_ID_ISSUE_DATE'] ?? '';
    cLIIDEXPIRYDATE = json['CLI_ID_EXPIRY_DATE'] ?? '';
    cLIRESIDENCYNO = json['CLI_RESIDENCYNO'] ?? '';
    cLIRESIDENCYEXPIRYDATE = json['CLI_RESIDENCY_EXPIRY_DATE'] ?? '';
    cLISPONSORNAME = json['CLI_SPONSOR_NAME'] ?? '';
    cLIPASSPORTNO = json['CLI_PASSPORT_NO'] ?? '';
    cLIPASSPORTISSUEDATE = json['CLI_PASSPORT_ISSUE_DATE'] ?? '';
    cLIPASSPORTEXPIRYDATE = json['CLI_PASSPORT_EXPIRY_DATE'] ?? '';
    cLIFAVLANGDESC = json['CLI_FAV_LANG_DESC'] ?? '';
    cLIFAVLANGDESCEN = json['CLI_FAV_LANG_DESC_EN'] ?? '';
    cLICOMPANYTYPENAME = json['CLI_COMPANYTYPE_NAME'] ?? '';
    iFILE = json['_FILE'];
    cLILICENSENO = json['CLI_LICENSE_NO'] ?? '';
    cLILICENSEDATE = json['CLI_LICENSE_DATE'] ?? '';
    cREATEDATE = json['CREATE_DATE'] ?? '';
    cLITAXNUMBER = json['CLI_TAX_NUMBER'] ?? '';
    cLINOTESEN = json['CLI_NOTES_EN'] ?? '';

    if (json['classification'] != null) {
      classification = <Classification>[];
      json['classification'].forEach((v) {
        classification.add(new Classification.fromJson(v));
      });
    }
  }
}

class Classification {
  late int? cLIIDPK;
  late String cLITYPENAME;
  late String cLITYPENAMEEN;

  Classification.fromJson(Map<String, dynamic> json) {
    cLIIDPK = json['CLI_ID_PK'];
    cLITYPENAME = json['CLI_TYPE_NAME'] ?? '';
    cLITYPENAMEEN = json['CLI_TYPE_NAME_EN'] ?? '';
  }
}
