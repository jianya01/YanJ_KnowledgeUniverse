IMPORT STD;
IMPORT KEL07 AS KEL;
IMPORT KELBlackBox;

EXPORT FileCurrentCarrierAutoNormalized := MODULE

	SHARED iESP2Date(STRING Year, STRING Month, STRING Day) := FUNCTION
		RETURN(INTFORMAT((INTEGER)Year, 4, 1) + INTFORMAT((INTEGER)Month, 2, 1) + INTFORMAT((INTEGER)Day, 2, 1));
	END;
	
	SHARED CleanDate(STRING Date) := FUNCTION
		YYYY := Date[1..4];
		MM := DATE[5..6];
		DD := DATE[7..8];

		RETURN(MAP(KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + MM + DD))										=> YYYY + MM + DD, // Full date is valid
				KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + MM + '01')) AND (INTEGER)DD = 0						=> YYYY + MM + '01', // YYYYMM valid and DD is 00
				KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + '0101')) AND (INTEGER)MM = 0 AND (INTEGER)DD = 0	=> YYYY + '0101', // YYYY valid and MMDD is 0000
								 																							'0')); // Invalid date, set to 0
	END;
	
SHARED t_insurancebatch := RECORD
    string seqnumber{xpath('SeqNumber')};
    string id{xpath('Id')};
    string mporesults{xpath('MPOResults')};
   END;

SHARED t_insurancexmlinfo := RECORD
   string4 flversion{xpath('FLVersion')};
   string9 sidexreturnnode{xpath('SidexReturnNode')};
   t_insurancebatch batch{xpath('Batch')};
  END;

SHARED t_editsdate := RECORD
     string2 month{xpath('Month')};
     string2 day{xpath('Day')};
     string4 year{xpath('Year')};
    END;

SHARED t_reportrequestidrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string60 quoteback{xpath('Quoteback')};
    string4 reportcode{xpath('ReportCode')};
    string15 reportcodedesc{xpath('ReportCodeDesc')};
    string1 reporttype{xpath('ReportType')};
    string6 accountnumber{xpath('AccountNumber')};
    string3 accountsuffix{xpath('AccountSuffix')};
    string15 specialbillid{xpath('SpecialBillId')};
    STRING8 dateoforder{xpath('DateOfOrder')};
    STRING8 dateofreceipt{xpath('DateOfReceipt')};
    STRING8 dateofcompletion{xpath('DateOfCompletion')};
    string1 processingcompletionstatus{xpath('ProcessingcompletionStatus')};
    string2 reportusage{xpath('ReportUsage')};
    string14 referencenumber{xpath('ReferenceNumber')};
    string4 timeofreport{xpath('TimeOfReport')};
    string4 productgroup{xpath('ProductGroup')};
    string1 attach1processstatus{xpath('Attach1ProcessStatus')};
    string1 attach2processstatus{xpath('Attach2ProcessStatus')};
    string1 attach3processstatus{xpath('Attach3ProcessStatus')};
    string1 attach4processstatus{xpath('Attach4ProcessStatus')};
    string1 attach5processstatus{xpath('Attach5ProcessStatus')};
    string1 attach6processstatus{xpath('Attach6ProcessStatus')};
    string1 attach7processstatus{xpath('Attach7ProcessStatus')};
    string1 attach8processstatus{xpath('Attach8ProcessStatus')};
    string1 attach9processstatus{xpath('Attach9ProcessStatus')};
    string1 attach10processtatus{xpath('Attach10ProcesStatus')};
    string2 recordversion{xpath('RecordVersion')};
    string3 processingstatuscode{xpath('ProcessingStatusCode')};
   END;

SHARED t_reportidsectionccstandaloneresultscust := RECORD
   t_reportrequestidrecordreport reportrequestid{xpath('ReportRequestId')};
  END;

SHARED t_recapprocessingrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string2 specialfield1type{xpath('SpecialField1Type')};
    string1 specialfield1status{xpath('SpecialField1Status')};
    string7 specialfield1count{xpath('SpecialField1Count')};
    string2 specialfield2type{xpath('SpecialField2Type')};
    string1 specialfield2status{xpath('SpecialField2Status')};
    string7 specialfield2count{xpath('SpecialField2Count')};
    string2 specialfield3type{xpath('SpecialField3Type')};
    string1 specialfield3status{xpath('SpecialField3Status')};
    string7 specialfield3count{xpath('SpecialField3Count')};
    string2 specialfield4type{xpath('SpecialField4Type')};
    string1 specialfield4status{xpath('SpecialField4Status')};
    string7 specialfield4count{xpath('SpecialField4Count')};
    string2 specialfield5type{xpath('SpecialField5Type')};
    string1 specialfield5status{xpath('SpecialField5Status')};
    string7 specialfield5count{xpath('SpecialField5Count')};
    string2 specialfield6type{xpath('SpecialField6Type')};
    string1 specialfield6status{xpath('SpecialField6Status')};
    string7 specialfield6count{xpath('SpecialField6Count')};
    string2 specialfield7type{xpath('SpecialField7Type')};
    string1 specialfield7status{xpath('SpecialField7Status')};
    string7 specialfield7count{xpath('SpecialField7Count')};
    string2 specialfield8type{xpath('SpecialField8Type')};
    string1 specialfield8status{xpath('SpecialField8Status')};
    string7 specialfield8count{xpath('SpecialField8Count')};
    string2 specialfield9type{xpath('SpecialField9Type')};
    string1 specialfield9status{xpath('SpecialField9Status')};
    string7 specialfield9count{xpath('SpecialField9Count')};
    string2 specialfield10type{xpath('SpecialField10Type')};
    string1 specialfield10status{xpath('SpecialField10Status')};
    string7 specialfield10count{xpath('SpecialField10Count')};
    string2 specialfield11type{xpath('SpecialField11Type')};
    string1 specialfield11status{xpath('SpecialField11Status')};
    string7 specialfield11count{xpath('SpecialField11Count')};
    string2 specialfield12type{xpath('SpecialField12Type')};
    string1 specialfield12status{xpath('SpecialField12Status')};
    string7 specialfield12count{xpath('SpecialField12Count')};
    string2 specialfield13type{xpath('SpecialField13Type')};
    string1 specialfield13status{xpath('SpecialField13Status')};
    string7 specialfield13count{xpath('SpecialField13Count')};
    string2 specialfield14type{xpath('SpecialField14Type')};
    string1 specialfield14status{xpath('SpecialField14Status')};
    string7 specialfield14count{xpath('SpecialField14Count')};
   END;

SHARED t_recapprocessingsectionccstandaloneresultscust := RECORD
   t_recapprocessingrecordreport reportlevelinquiryrecap{xpath('ReportLevelInquiryRecap')};
   DATASET(t_recapprocessingrecordreport) subjectlevelinquiryrecap{xpath('SubjectLevelInquiryRecap/RecapProcessing'), maxcount(50)};
  END;

SHARED t_reportsectionheaderrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string5 sectionidentifier{xpath('SectionIdentifier')};
    string79 sectionlabel{xpath('SectionLabel')};
    string1 sectiondeveloped{xpath('SectionDeveloped')};
   END;

SHARED t_narrativearecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string2 typeremarks{xpath('TypeRemarks')};
    string79 remarks1{xpath('Remarks1')};
    string79 remarks2{xpath('Remarks2')};
    string2 remarkscode1{xpath('RemarksCode1')};
    string2 remarkscode2{xpath('RemarksCode2')};
   END;

SHARED t_generalmessagessectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(99)};
  END;

SHARED t_addressrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string1 groupusage{xpath('GroupUsage')};
    string9 housenumber{xpath('HouseNumber')};
    string20 streetname{xpath('StreetName')};
    string5 aptnumber{xpath('AptNumber')};
    string20 city{xpath('City')};
    string2 state{xpath('State')};
    string5 zip{xpath('Zip')};
    string4 zip4{xpath('Zip4')};
    string2 yearsataddress{xpath('YearsAtAddress')};
    string2 mthsataddress{xpath('MthsAtAddress')};
    STRING8 datefirstseen{xpath('DateFirstSeen')};
    STRING8 datelastseen{xpath('DateLastSeen')};
    string1 fsihousenumber{xpath('FsiHouseNumber')};
    string1 fsistreetname{xpath('FsiStreetName')};
    string1 fsiaptnumber{xpath('FsiAptNumber')};
    string1 fsicity{xpath('FsiCity')};
    string1 fsistate{xpath('FsiState')};
    string1 fsizip{xpath('FsiZip')};
    string1 fsizip4{xpath('FsiZip4')};
    string1 fsiyearsataddress{xpath('FsiYearsAtAddress')};
    string1 fsimonthsataddress{xpath('FsiMonthsAtAddress')};
    string1 fsidatefirstseen{xpath('FsiDateFirstSeen')};
    string1 fsidatelastseen{xpath('FsiDateLastSeen')};
    string1 ownrentindicator{xpath('OwnrentIndicator')};
    string15 countyname{xpath('CountyName')};
    STRING8 dataassodate{xpath('DataAssoDate')};
    string1 datasourceindicator{xpath('DataSourceIndicator')};
    string2 typecode{xpath('TypeCode')};
    string10 censustract{xpath('CensusTract')};
   END;

SHARED t_groupaddresssectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   t_addressrecordreport groupcurrentaddress{xpath('GroupCurrentAddress')};
   t_addressrecordreport groupriskaddress{xpath('GroupRiskAddress')};
   t_addressrecordreport groupprioraddress{xpath('GroupPriorAddress')};
   t_addressrecordreport groupmailingaddress{xpath('GroupMailingAddress')};
  END;

SHARED t_personrecordreport := RECORD
     string3 unitnumber{xpath('UnitNumber')};
     string3 groupsequencenumber{xpath('GroupSequenceNumber')};
     string4 recordcode{xpath('RecordCode')};
     string2 recordoccurra{xpath('RecordOccurrA')};
     string2 recordoccurrb{xpath('RecordOccurrB')};
     string2 classification{xpath('Classification')};
     string4 prefix{xpath('Prefix')};
     string28 last{xpath('Last')};
     string20 first{xpath('First')};
     string15 middle{xpath('Middle')};
     string3 suffix{xpath('Suffix')};
     STRING8 dateofbirth{xpath('DateOfBirth')};
     string3 age{xpath('Age')};
     string1 sex{xpath('Sex')};
     string9 ssn{xpath('SSN')};
     string1 heightfeet{xpath('HeightFeet')};
     string2 heightinches{xpath('HeightInches')};
     string3 weight{xpath('Weight')};
     string1 relationship{xpath('Relationship')};
     string20 relationshipdesc{xpath('RelationshipDesc')};
     string1 individualaddressassociationind{xpath('IndividualAddressAssociationInd')};
     string1 nameassociationindicator{xpath('NameAssociationIndicator')};
     STRING8 dataassociationdate{xpath('DataAssociationDate')};
     string1 maritalstatus{xpath('MaritalStatus')};
     string1 fsiprefix{xpath('FsiPrefix')};
     string1 fsilast{xpath('FsiLast')};
     string1 fsifirst{xpath('FsiFirst')};
     string1 fsimiddle{xpath('FsiMiddle')};
     string1 fsisuffix{xpath('FsiSuffix')};
     string1 fsidateofbirth{xpath('FsiDateOfBirth')};
     string1 fsiage{xpath('FsiAge')};
     string1 fsisex{xpath('FsiSex')};
     string1 fsissn{xpath('FsiSSN')};
     string1 fsiheightfeet{xpath('FsiHeightFeet')};
     string1 fsiheightinches{xpath('FsiHeightInches')};
     string1 fsiweight{xpath('FsiWeight')};
     string1 fsirelationship{xpath('FsiRelationship')};
     string1 fsimaritalstatus{xpath('FsiMaritalStatus')};
     string1 fsieyecolor{xpath('FsiEyeColor')};
     string1 fsihaircolor{xpath('FsiHairColor')};
     string1 ssnverified{xpath('SsnVerified')};
     string1 racecode{xpath('RaceCode')};
     string1 datasourceindicator{xpath('DataSourceIndicator')};
     string3 eyecolor{xpath('EyeColor')};
     string3 haircolor{xpath('HairColor')};
     STRING8 dateofdeath{xpath('DateOfDeath')};
     string2 numberofdependents{xpath('NumberOfDependents')};
     string1 fraudalertind{xpath('FraudAlertInd')};
     string1 multipolicyind{xpath('MultiPolicyInd')};
     string10 dateofloss{xpath('DateOfLoss')};
    END;

SHARED t_requiredaddressinformationccstandaloneresultscust := RECORD
     t_addressrecordreport currentorriskaddress{xpath('CurrentOrRiskAddress')};
     t_addressrecordreport mailingaddress{xpath('MailingAddress')};
     t_addressrecordreport prioraddress{xpath('PriorAddress')};
    END;

SHARED t_driverlicenserecordreport := RECORD
     string3 unitnumber{xpath('UnitNumber')};
     string3 groupsequencenumber{xpath('GroupSequenceNumber')};
     string4 recordcode{xpath('RecordCode')};
     string2 recordoccurra{xpath('RecordOccurrA')};
     string2 recordoccurrb{xpath('RecordOccurrB')};
     string2 classification{xpath('Classification')};
     string25 licensenumber{xpath('LicenseNumber')};
     string2 state{xpath('State')};
     string1 fsilicenseclass{xpath('FsiLicenseClass')};
     string1 fsilicensenumber{xpath('FsiLicenseNumber')};
     string1 fsilicensestate{xpath('FsiLicenseState')};
     string10 _type{xpath('Type')};
     string15 restriction{xpath('Restriction')};
     STRING8 issuedate{xpath('IssueDate')};
     STRING8 expdatev{xpath('ExpDatev')};
     STRING8 dataassodatev{xpath('DataAssoDatev')};
     string1 datasourceindicator{xpath('DataSourceIndicator')};
     string1 typeindicator{xpath('TypeIndicator')};
     string3 unitnumber2{xpath('UnitNumber2')};
    END;

SHARED t_subjectidsetccstandaloneresultscust := RECORD
    		UNSIGNED8 RecordIdentifier;
		UNSIGNED8 SubjectIDRecordCounter;
		t_personrecordreport subject{xpath('Subject')};
    t_requiredaddressinformationccstandaloneresultscust requiredaddressinformation{xpath('RequiredAddressInformation')};
    t_driverlicenserecordreport currentlicense{xpath('CurrentLicense')};
    t_driverlicenserecordreport priorlicense{xpath('PriorLicense')};
   END;

SHARED t_subjectsearchinformationsectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_subjectidsetccstandaloneresultscust) subjectidsets{xpath('SubjectIdSets/SubjectIdSet'), maxcount(50)};
  END;

SHARED t_disclaimsetandreportedpoliciessetcarrieronlyv2report := RECORD
    DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(10014)};
   END;

SHARED t_additionalinformationsectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   t_disclaimsetandreportedpoliciessetcarrieronlyv2report disclaimandpoliciesset{xpath('DisclaimAndPoliciesSet')};
  END;

SHARED t_personaldatasectionccstandaloneresultscust := RECORD
    UNSIGNED8 RecordIdentifier;
		UNSIGNED8 PersonRecordCounter;
		t_personrecordreport personrecord{xpath('PersonRecord')};
    t_driverlicenserecordreport driverlicenserecord{xpath('DriverLicenseRecord')};
   END;

SHARED t_vehiclerecordreport := RECORD
     string3 unitnumber{xpath('UnitNumber')};
     string3 groupsequencenumber{xpath('GroupSequenceNumber')};
     string4 recordcode{xpath('RecordCode')};
     string2 recordoccurra{xpath('RecordOccurrA')};
     string2 recordoccurrb{xpath('RecordOccurrB')};
     string2 classification{xpath('Classification')};
     string2 modelyearv1{xpath('ModelYearv1')};
     string4 modelyear{xpath('ModelYear')};
     string40 makeandmodel{xpath('MakeAndModel')};
     string25 vin{xpath('Vin')};
     string10 platenumber{xpath('PlateNumber')};
     string2 licensestate{xpath('LicenseState')};
     string6 vehicleclass{xpath('VehicleClass')};
     string6 odometerreading{xpath('OdometerReading')};
     string1 vehicledisposition{xpath('VehicleDisposition')};
     string15 titlenumber{xpath('TitleNumber')};
     string1 makemodelformat{xpath('MakemodelFormat')};
     string1 fsilicenseplatenumber{xpath('FsiLicensePlateNumber')};
     string1 fsilicensestate{xpath('FsiLicenseState')};
     string1 fsivin{xpath('FsiVin')};
     string1 fsimakeormodel{xpath('FsiMakeOrModel')};
     string1 fsimodelyear{xpath('FsiModelYear')};
     string1 _type{xpath('Type')};
     string1 brandedindicator{xpath('BrandedIndicator')};
     string1 leasedindicator{xpath('LeasedIndicator')};
     string10 dateofloss{xpath('DateOfLoss')};
    END;

SHARED t_vehicledatarelationshiprecordreport := RECORD
     string3 unitnumber{xpath('UnitNumber')};
     string3 groupsequencenumber{xpath('GroupSequenceNumber')};
     string4 recordcode{xpath('RecordCode')};
     string2 recordoccurra{xpath('RecordOccurrA')};
     string2 recordoccurrb{xpath('RecordOccurrB')};
     string1 vinddecodeindicator{xpath('VindDecodeIndicator')};
     string20 vinstatus{xpath('VinStatus')};
     string1 vindvehicleindicator{xpath('VindVehicleIndicator')};
     string4 vindvehicleyear{xpath('VindVehicleYear')};
     string4 vindmake{xpath('VindMake')};
     string3 vindseries{xpath('VindSeries')};
     string3 vindsubseries{xpath('VindSubSeries')};
     string18 makedesc{xpath('MakeDesc')};
     string17 seriesdesc{xpath('SeriesDesc')};
     string18 subseriesdesc{xpath('SubSeriesDesc')};
     string2 bodystyle{xpath('BodyStyle')};
     string20 bodystyledesc{xpath('BodyStyleDesc')};
    END;

SHARED t_discoveredselectedvehicledataset := RECORD
    t_vehiclerecordreport vehicle{xpath('Vehicle')};
    t_vehicledatarelationshiprecordreport vehicledatarelationship{xpath('VehicleDataRelationship')};
    DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(3)};
   END;

SHARED t_attachmentsectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_personaldatasectionccstandaloneresultscust) personaldatasections{xpath('PersonalDataSections/PersonalDataSection'), maxcount(99)};
   DATASET(t_discoveredselectedvehicledataset) vehicledatasets{xpath('VehicleDataSets/VehicleDataSet'), maxcount(25)};
  END;

SHARED t_inquiryhistoryheaderrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    STRING8 dateofinquiry{xpath('DateOfInquiry')};
    string50 inquirername{xpath('InquirerName')};
    string60 quoteback{xpath('Quoteback')};
    string10 inquirerid{xpath('InquirerId')};
    string1 infosrc{xpath('InfoSrc')};
    string2 unitclassification{xpath('UnitClassification')};
    string2 reportusage{xpath('ReportUsage')};
   END;

SHARED t_inquiryhistorysectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_inquiryhistoryheaderrecordreport) histories{xpath('Histories/InquiryHistoryHeader'), maxcount(99)};
  END;

SHARED CC_Auto_Response := RECORD
integer8 RecordIdentifier;
  t_insurancexmlinfo xmlinfo{xpath('XmlInfo')};
  t_reportidsectionccstandaloneresultscust reportidsection{xpath('ReportIdSection')};
  t_recapprocessingsectionccstandaloneresultscust recapprocessingsection{xpath('RecapProcessingSection')};
  t_generalmessagessectionccstandaloneresultscust generalmessagessection{xpath('GeneralMessagesSection')};
  t_groupaddresssectionccstandaloneresultscust groupaddresssection{xpath('GroupAddressSection')};
  t_subjectsearchinformationsectionccstandaloneresultscust subjectsearchinformationsection{xpath('SubjectSearchInformationSection')};
  t_additionalinformationsectionccstandaloneresultscust additionalinformationsection{xpath('AdditionalInformationSection')};
  t_attachmentsectionccstandaloneresultscust attachmentsection{xpath('AttachmentSection')};
 // t_inquiryhistorysectionccstandaloneresultscust inquiryhistorysection{xpath('InquiryHistorySection')};
  string errorcode;
  integer8 transaction_time{xpath('_call_latency_ms')};
 END;

// Cleaning Functions
 t_subjectidsetccstandaloneresultscust cleanSubjectIDSection(RECORDOF(KELBlackBox.FileCurrentCarrierAuto.subjectsearchinformationsection.subjectidsets) le, UNSIGNED8 recIdentifier, UNSIGNED8 cntr) := TRANSFORM
		SELF.RecordIdentifier := recIdentifier;
		SELF.SubjectIDRecordCounter := cntr;
		SELF.subject.dateofbirth := CleanDate(iESP2Date(le.subject.dateofbirth.Year, le.subject.dateofbirth.Month, le.subject.dateofbirth.Day));
		SELF.subject.dataassociationdate := CleanDate(iESP2Date(le.subject.dataassociationdate.Year, le.subject.dataassociationdate.Month, le.subject.dataassociationdate.Day));
		SELF.subject.dateofdeath := CleanDate(iESP2Date(le.subject.dateofdeath.Year, le.subject.dateofdeath.Month, le.subject.dateofdeath.Day));
		SELF.requiredaddressinformation.currentorriskaddress.datefirstseen := CleanDate(iESP2Date(le.requiredaddressinformation.currentorriskaddress.datefirstseen.Year, le.requiredaddressinformation.currentorriskaddress.datefirstseen.Month, le.requiredaddressinformation.currentorriskaddress.datefirstseen.Day));
		SELF.requiredaddressinformation.currentorriskaddress.datelastseen := CleanDate(iESP2Date(le.requiredaddressinformation.currentorriskaddress.datelastseen.Year, le.requiredaddressinformation.currentorriskaddress.datelastseen.Month, le.requiredaddressinformation.currentorriskaddress.datelastseen.Day));
		SELF.requiredaddressinformation.currentorriskaddress.dataassodate := CleanDate(iESP2Date(le.requiredaddressinformation.currentorriskaddress.dataassodate.Year, le.requiredaddressinformation.currentorriskaddress.dataassodate.Month, le.requiredaddressinformation.currentorriskaddress.dataassodate.Day));
		SELF.requiredaddressinformation.mailingaddress.datefirstseen := CleanDate(iESP2Date(le.requiredaddressinformation.mailingaddress.datefirstseen.Year, le.requiredaddressinformation.mailingaddress.datefirstseen.Month, le.requiredaddressinformation.mailingaddress.datefirstseen.Day));
		SELF.requiredaddressinformation.mailingaddress.datelastseen := CleanDate(iESP2Date(le.requiredaddressinformation.mailingaddress.datelastseen.Year, le.requiredaddressinformation.mailingaddress.datelastseen.Month, le.requiredaddressinformation.mailingaddress.datelastseen.Day));
		SELF.requiredaddressinformation.mailingaddress.dataassodate := CleanDate(iESP2Date(le.requiredaddressinformation.mailingaddress.dataassodate.Year, le.requiredaddressinformation.mailingaddress.dataassodate.Month, le.requiredaddressinformation.mailingaddress.dataassodate.Day));
		SELF.requiredaddressinformation.prioraddress.datefirstseen := CleanDate(iESP2Date(le.requiredaddressinformation.prioraddress.datefirstseen.Year, le.requiredaddressinformation.prioraddress.datefirstseen.Month, le.requiredaddressinformation.prioraddress.datefirstseen.Day));
		SELF.requiredaddressinformation.prioraddress.datelastseen := CleanDate(iESP2Date(le.requiredaddressinformation.prioraddress.datelastseen.Year, le.requiredaddressinformation.prioraddress.datelastseen.Month, le.requiredaddressinformation.prioraddress.datelastseen.Day));
		SELF.requiredaddressinformation.prioraddress.dataassodate := CleanDate(iESP2Date(le.requiredaddressinformation.prioraddress.dataassodate.Year, le.requiredaddressinformation.prioraddress.dataassodate.Month, le.requiredaddressinformation.prioraddress.dataassodate.Day));
		SELF.currentlicense.issuedate := CleanDate(iESP2Date(le.currentlicense.issuedate.Year, le.currentlicense.issuedate.Month, le.currentlicense.issuedate.Day));
		SELF.currentlicense.expdatev := CleanDate(iESP2Date(le.currentlicense.expdatev.Year, le.currentlicense.expdatev.Month, le.currentlicense.expdatev.Day));
		SELF.currentlicense.dataassodatev := CleanDate(iESP2Date(le.currentlicense.dataassodatev.Year, le.currentlicense.dataassodatev.Month, le.currentlicense.dataassodatev.Day));
		SELF.priorlicense.issuedate := CleanDate(iESP2Date(le.priorlicense.issuedate.Year, le.priorlicense.issuedate.Month, le.priorlicense.issuedate.Day));
		SELF.priorlicense.expdatev := CleanDate(iESP2Date(le.priorlicense.expdatev.Year, le.priorlicense.expdatev.Month, le.priorlicense.expdatev.Day));
		SELF.priorlicense.dataassodatev := CleanDate(iESP2Date(le.priorlicense.dataassodatev.Year, le.priorlicense.dataassodatev.Month, le.priorlicense.dataassodatev.Day));
		SELF := le;
	END;
	
t_personaldatasectionccstandaloneresultscust cleanPersonalDataSections(RECORDOF(KELBlackBox.FileCurrentCarrierAuto.attachmentsection.personaldatasections) le, UNSIGNED8 recIdentifier, UNSIGNED8 cntr) := TRANSFORM
		SELF.RecordIdentifier := recIdentifier;
		SELF.PersonRecordCounter := cntr;
		SELF.personrecord.dateofbirth := CleanDate(iESP2Date(le.personrecord.dateofbirth.Year, le.personrecord.dateofbirth.Month, le.personrecord.dateofbirth.Day));
		SELF.personrecord.dataassociationdate := CleanDate(iESP2Date(le.personrecord.dataassociationdate.Year, le.personrecord.dataassociationdate.Month, le.personrecord.dataassociationdate.Day));
		SELF.personrecord.dateofdeath := CleanDate(iESP2Date(le.personrecord.dateofdeath.Year, le.personrecord.dateofdeath.Month, le.personrecord.dateofdeath.Day));
		SELF.driverlicenserecord.issuedate := CleanDate(iESP2Date(le.driverlicenserecord.issuedate.Year, le.driverlicenserecord.issuedate.Month, le.driverlicenserecord.issuedate.Day));
		SELF.driverlicenserecord.expdatev := CleanDate(iESP2Date(le.driverlicenserecord.expdatev.Year, le.driverlicenserecord.expdatev.Month, le.driverlicenserecord.expdatev.Day));
		SELF.driverlicenserecord.dataassodatev := CleanDate(iESP2Date(le.driverlicenserecord.dataassodatev.Year, le.driverlicenserecord.dataassodatev.Month, le.driverlicenserecord.dataassodatev.Day));
		SELF := le;
		END;
// ROOT		
CC_Auto_Response cleanCCAuto(KELBlackBox.FileCurrentCarrierAuto le) := TRANSFORM
		SELF.RecordIdentifier := le.RecordIdentifier;
		SELF.ReportIdSection.reportrequestid.dateoforder := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateoforder.Year, le.ReportIdSection.reportrequestid.dateoforder.Month, le.ReportIdSection.reportrequestid.dateoforder.Day));
		SELF.ReportIdSection.reportrequestid.dateofreceipt := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateofreceipt.Year, le.ReportIdSection.reportrequestid.dateofreceipt.Month, le.ReportIdSection.reportrequestid.dateofreceipt.Day));
		SELF.ReportIdSection.reportrequestid.dateofcompletion := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateofcompletion.Year, le.ReportIdSection.reportrequestid.dateofcompletion.Month, le.ReportIdSection.reportrequestid.dateofcompletion.Day));
		SELF.groupaddresssection.groupcurrentaddress.datefirstseen := CleanDate(iESP2Date(le.groupaddresssection.groupcurrentaddress.datefirstseen.Year, le.groupaddresssection.groupcurrentaddress.datefirstseen.Month, le.groupaddresssection.groupcurrentaddress.datefirstseen.Day));
		SELF.groupaddresssection.groupcurrentaddress.datelastseen := CleanDate(iESP2Date(le.groupaddresssection.groupcurrentaddress.datelastseen.Year, le.groupaddresssection.groupcurrentaddress.datelastseen.Month, le.groupaddresssection.groupcurrentaddress.datelastseen.Day));
		SELF.groupaddresssection.groupcurrentaddress.dataassodate := CleanDate(iESP2Date(le.groupaddresssection.groupcurrentaddress.dataassodate.Year, le.groupaddresssection.groupcurrentaddress.dataassodate.Month, le.groupaddresssection.groupcurrentaddress.dataassodate.Day));
		SELF.groupaddresssection.groupriskaddress.datefirstseen := CleanDate(iESP2Date(le.groupaddresssection.groupriskaddress.datefirstseen.Year, le.groupaddresssection.groupriskaddress.datefirstseen.Month, le.groupaddresssection.groupriskaddress.datefirstseen.Day));
		SELF.groupaddresssection.groupriskaddress.datelastseen := CleanDate(iESP2Date(le.groupaddresssection.groupriskaddress.datelastseen.Year, le.groupaddresssection.groupriskaddress.datelastseen.Month, le.groupaddresssection.groupriskaddress.datelastseen.Day));
		SELF.groupaddresssection.groupriskaddress.dataassodate := CleanDate(iESP2Date(le.groupaddresssection.groupriskaddress.dataassodate.Year, le.groupaddresssection.groupriskaddress.dataassodate.Month, le.groupaddresssection.groupriskaddress.dataassodate.Day));
		SELF.groupaddresssection.groupprioraddress.datefirstseen := CleanDate(iESP2Date(le.groupaddresssection.groupprioraddress.datefirstseen.Year, le.groupaddresssection.groupprioraddress.datefirstseen.Month, le.groupaddresssection.groupprioraddress.datefirstseen.Day));
		SELF.groupaddresssection.groupprioraddress.datelastseen := CleanDate(iESP2Date(le.groupaddresssection.groupprioraddress.datelastseen.Year, le.groupaddresssection.groupprioraddress.datelastseen.Month, le.groupaddresssection.groupprioraddress.datelastseen.Day));
		SELF.groupaddresssection.groupprioraddress.dataassodate := CleanDate(iESP2Date(le.groupaddresssection.groupprioraddress.dataassodate.Year, le.groupaddresssection.groupprioraddress.dataassodate.Month, le.groupaddresssection.groupprioraddress.dataassodate.Day));
		SELF.groupaddresssection.groupmailingaddress.datefirstseen := CleanDate(iESP2Date(le.groupaddresssection.groupmailingaddress.datefirstseen.Year, le.groupaddresssection.groupmailingaddress.datefirstseen.Month, le.groupaddresssection.groupmailingaddress.datefirstseen.Day));
		SELF.groupaddresssection.groupmailingaddress.datelastseen := CleanDate(iESP2Date(le.groupaddresssection.groupmailingaddress.datelastseen.Year, le.groupaddresssection.groupmailingaddress.datelastseen.Month, le.groupaddresssection.groupmailingaddress.datelastseen.Day));
		SELF.groupaddresssection.groupmailingaddress.dataassodate := CleanDate(iESP2Date(le.groupaddresssection.groupmailingaddress.dataassodate.Year, le.groupaddresssection.groupmailingaddress.dataassodate.Month, le.groupaddresssection.groupmailingaddress.dataassodate.Day));
		SELF.subjectsearchinformationsection.subjectidsets := PROJECT(le.subjectsearchinformationsection.subjectidsets, cleanSubjectIDSection(LEFT, le.RecordIdentifier, COUNTER));
		SELF.attachmentsection.personaldatasections := PROJECT(le.attachmentsection.personaldatasections, cleanPersonalDataSections(LEFT, le.RecordIdentifier, COUNTER));
		SELF := le;
	END;

EXPORT FileCCAutoRoot := PROJECT(KELBlackBox.FileCurrentCarrierAuto, cleanCCAuto(LEFT));		

//  Recap processing - reportlevelinquiryrecap 		
EXPORT FileCCAutoReportRecap := PROJECT(FileCCAutoRoot, 
																	TRANSFORM({INTEGER8 RecordIdentifier, RECORDOF(FileCCAutoRoot.recapprocessingsection) - subjectlevelinquiryrecap}, 
																		SELF.RecordIdentifier := Left.RecordIdentifier; 
																		SELF := LEFT.recapprocessingsection));

//  General Messages - reportsectionheader																				
EXPORT FileCCAutoGenMesg_ReportSection := PROJECT(FileCCAutoRoot, 
																	TRANSFORM({INTEGER8 RecordIdentifier, RECORDOF(FileCCAutoRoot.generalmessagessection) - messages}, 
																		SELF.RecordIdentifier := Left.RecordIdentifier; 
																		SELF := LEFT.generalmessagessection));																			

//  AttachmentSection - reportsectionheader		
EXPORT FileCCAutoAttachSect_ReportSection := PROJECT(FileCCAutoRoot, 
																	TRANSFORM({INTEGER8 RecordIdentifier, RECORDOF(FileCCAutoRoot.attachmentsection) - personaldatasections - vehicledatasets}, 
																		SELF.RecordIdentifier := Left.RecordIdentifier; 
																		SELF := LEFT.attachmentsection));	

//  subjectSearchInformationSection - reportsectionheader
EXPORT FileCCAutoSubjectSearch_ReportSection := PROJECT(FileCCAutoRoot, 
																	TRANSFORM({INTEGER8 RecordIdentifier, RECORDOF(FileCCAutoRoot.subjectsearchinformationsection) - subjectidsets}, 
																		SELF.RecordIdentifier := Left.RecordIdentifier; 
																		SELF := LEFT.subjectsearchinformationsection));	



// **************Normalizations ******************
// **1** recapprocessingsection - subject level
{integer8 RecordIdentifier, integer RecapRecordCounter, t_recapprocessingrecordreport} getRecapMessages(CC_Auto_Response L, t_recapprocessingrecordreport R, integer cntr) := transform
               self.RecordIdentifier := L.RecordIdentifier;
               self.RecapRecordCounter := cntr;
               Self := R;
      				  END;
         
EXPORT FileCCAutoSubjectRecap := normalize(FileCCAutoRoot, left.recapprocessingsection.subjectlevelinquiryrecap, getRecapMessages(LEFT, Right, counter));


// **2** generalmessagessection - messages
{integer8 RecordIdentifier, integer MessageRecordCounter, t_narrativearecordreport} getGenMessages(CC_Auto_Response L, t_narrativearecordreport R, integer cntr) := transform
                  self.RecordIdentifier := L.RecordIdentifier;
                  self.MessageRecordCounter := cntr;
                  Self := R;
         				  END;
       
EXPORT FileCCAutoGeneralMessages:= normalize(FileCCAutoRoot, left.generalmessagessection.messages, getGenMessages(LEFT, Right, counter));

// **3** subjectSearchInformationSection - SubjectSearchId Sets
t_subjectidsetccstandaloneresultscust getSubIDsets(CC_Auto_Response L, t_subjectidsetccstandaloneresultscust R, integer cntr) := transform
                  self.RecordIdentifier := L.RecordIdentifier;
                  self.SubjectIDRecordCounter := cntr;
                  Self := R;
      						END;
            
EXPORT FileCCAutoSubIDSets:= normalize(FileCCAutoRoot, left.subjectsearchinformationsection.subjectidsets, getSubIDsets(LEFT, Right, counter));
EXPORT FileCCAutoSubIDSets2:= NORMALIZE(FileCCAutoRoot, LEFT.subjectsearchinformationsection.subjectidsets, TRANSFORM(t_subjectidsetccstandaloneresultscust, SELF := RIGHT));
 
// **4** additionalinformationsection - messages
{integer8 RecordIdentifier, integer AddMessageRecordCounter, t_narrativearecordreport} getAddMessages(CC_Auto_Response L, t_narrativearecordreport R, integer cntr) := transform
               self.RecordIdentifier := L.RecordIdentifier;
               self.AddMessageRecordCounter := cntr;
               Self := R;
      				 END;
         
   
EXPORT FileCCAutoAdditionalMesg:= normalize(FileCCAutoRoot, left.additionalinformationsection.DisclaimAndPoliciesSet.messages, getAddMessages(LEFT, Right, counter));

 
// **5** attachmentsection			- personrecord
t_personaldatasectionccstandaloneresultscust getAttSectMessages(CC_Auto_Response L, t_personaldatasectionccstandaloneresultscust R, integer cntr) := transform
               self.RecordIdentifier := L.RecordIdentifier;
               self.PersonRecordCounter := cntr;
               Self := R;
      				 END;
   
EXPORT FileCCAutoAttachmentSect:= normalize(FileCCAutoRoot, left.attachmentsection.PersonalDataSections, getAttSectMessages(LEFT, Right, counter));
EXPORT FileCCAutoAttachmentSect2:= NORMALIZE(FileCCAutoRoot, LEFT.attachmentsection.PersonalDataSections, TRANSFORM(t_personaldatasectionccstandaloneresultscust, SELF := RIGHT));
 

// **6** attachmentsection			- vehicledatasets
{integer8 RecordIdentifier, integer VehicleCounter, t_discoveredselectedvehicledataset} getAttSectMessages(CC_Auto_Response L, t_discoveredselectedvehicledataset R, integer cntr) := transform
               self.RecordIdentifier := L.RecordIdentifier;
               self.VehicleCounter := cntr;
               Self := R;
      				 END;
   
EXPORT FileCCAutoAttachmentSectVehicle:= normalize(FileCCAutoRoot, left.attachmentsection.VehicleDataSets, getAttSectMessages(LEFT, Right, counter));
																		
END;
