IMPORT STD;
IMPORT KEL07 AS KEL;
IMPORT KELBlackBox;


EXPORT FileCarrierDiscoveryAutoNormalized := MODULE
	SHARED iESP2Date(STRING Year, STRING Month, STRING Day) := FUNCTION
		RETURN(INTFORMAT((INTEGER)Year, 4, 1) + INTFORMAT((INTEGER)Month, 2, 1) + INTFORMAT((INTEGER)Day, 2, 1));
	END;
	
	SHARED CleanDate(STRING Date) := FUNCTION
		YYYY := Date[1..4];
		MM := DATE[5..6];
		DD := DATE[7..8];

		RETURN(MAP(KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + MM + DD))	=> YYYY + MM + DD, // Full date is valid
				KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + MM + '01')) AND (INTEGER)DD = 0 => YYYY + MM + '01', // YYYYMM valid and DD is 00
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

SHARED t_reportidsupplementarecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string40 accountname{xpath('AccountName')};
    string10 custorgcodelevel1{xpath('CustOrgCodeLevel1')};
    string10 custorgcodelevel2{xpath('CustOrgCodeLevel2')};
    string10 custorgcodelevel3{xpath('CustOrgCodeLevel3')};
    string10 custorgcodelevel4{xpath('CustOrgCodeLevel4')};
    string10 specialfield1{xpath('SpecialField1')};
    string10 specialfield2{xpath('SpecialField2')};
    string10 specialfield3{xpath('SpecialField3')};
    string10 specialfielda{xpath('SpecialFieldA')};
    string10 specialfieldb{xpath('SpecialFieldB')};
    string10 specialfieldc{xpath('SpecialFieldC')};
    string14 relatedreferencenumber{xpath('RelatedReferenceNumber')};
    STRING8 relatedprocessingdate{xpath('RelatedProcessingDate')};
    string4 specialnumericfield1{xpath('SpecialNumericField1')};
   END;

SHARED t_unitquotebackrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string60 quoteback{xpath('Quoteback')};
   END;

SHARED t_reportidsectioncarrierdv3custreport := RECORD
   t_reportrequestidrecordreport reportrequestid{xpath('ReportRequestId')};
   t_reportidsupplementarecordreport reportidsupplementa{xpath('ReportIdSupplementA')};
   t_unitquotebackrecordreport unitquoteback{xpath('UnitQuoteback')};
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

SHARED t_recapprocessingsectioncarrierdv3custreport := RECORD
   t_recapprocessingrecordreport inquiryrecap{xpath('InquiryRecap')};
   t_recapprocessingrecordreport subjectorvinrecap{xpath('SubjectOrVinRecap')};
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

SHARED t_requiredaddressinfosetcarrierdv3custreport := RECORD
     t_addressrecordreport currentorriskaddress{xpath('CurrentOrRiskAddress')};
     t_addressrecordreport mailingaddress{xpath('MailingAddress')};
     t_addressrecordreport formeraddress{xpath('FormerAddress')};
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

SHARED t_inquirypersonsetcarrierdv3custreport := RECORD
    t_personrecordreport person{xpath('Person')};
    t_requiredaddressinfosetcarrierdv3custreport requiredaddressinfoset{xpath('RequiredAddressInfoSet')};
    t_driverlicenserecordreport currentlicense{xpath('CurrentLicense')};
    t_driverlicenserecordreport formerlicense{xpath('FormerLicense')};
    t_vehiclerecordreport vehicle{xpath('Vehicle')};
   END;

SHARED t_subjectsearchinfosectioncarrierdv3custreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   t_inquirypersonsetcarrierdv3custreport inquirypersonset{xpath('InquiryPersonSet')};
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

SHARED t_generalmessagessectioncarrierdv3custreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(99)};
  END;

SHARED t_addinfosectioncarrierdv3custreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(499962)};
  END;

SHARED t_policypersonsection := RECORD
		UNSIGNED8 RecordIdentifier;
		UNSIGNED8 PolicyPersonCounter;
		t_personrecordreport personalidentificationinformation{xpath('PersonalIdentificationInformation')};
    t_addressrecordreport riskaddressinformation{xpath('RiskAddressInformation')};
    t_driverlicenserecordreport currentdriverlicenseinformation{xpath('CurrentDriverLicenseInformation')};
   END;

SHARED t_reportalertsmonitorinformationsection := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_policypersonsection) policypersons{xpath('PolicyPersons/PolicyPerson'), maxcount(99)};
  END;

SHARED CDisc_Auto_Response:= RECORD
	integer8 RecordIdentifier;
  t_insurancexmlinfo xmlinfo{xpath('XmlInfo')};
  t_reportidsectioncarrierdv3custreport reportidsection{xpath('ReportIdSection')};
  t_recapprocessingsectioncarrierdv3custreport recapprocessingsection{xpath('RecapProcessingSection')};
  t_subjectsearchinfosectioncarrierdv3custreport subjectsearchinfosection{xpath('SubjectSearchInfoSection')};
  t_generalmessagessectioncarrierdv3custreport generalmessagessection{xpath('GeneralMessagesSection')}; //child dataset within this section
  t_addinfosectioncarrierdv3custreport additionalinfosection{xpath('AdditionalInfoSection')};//child dataset within this section
  t_reportalertsmonitorinformationsection reportalertsmonitorsection{xpath('ReportAlertsMonitorSection')};//child dataset within this section -- EMPTY IN RESPONSE FILE
 END;

// Cleaning Functions

t_policypersonsection cleanPolicyPersons(RECORDOF(KELBlackBox.FileCarrierDiscoveryAuto.reportalertsmonitorsection.policypersons) le, UNSIGNED8 recIdentifier, UNSIGNED8 cntr) := TRANSFORM
		SELF.RecordIdentifier := recIdentifier;
		SELF.PolicyPersonCounter := cntr;
		SELF.personalidentificationinformation.dateofbirth := CleanDate(iESP2Date(le.personalidentificationinformation.dateofbirth.Year, le.personalidentificationinformation.dateofbirth.Month, le.personalidentificationinformation.dateofbirth.Day));
		SELF.personalidentificationinformation.dataassociationdate := CleanDate(iESP2Date(le.personalidentificationinformation.dataassociationdate.Year, le.personalidentificationinformation.dataassociationdate.Month, le.personalidentificationinformation.dataassociationdate.Day));
		SELF.personalidentificationinformation.dateofdeath := CleanDate(iESP2Date(le.personalidentificationinformation.dateofdeath.Year, le.personalidentificationinformation.dateofdeath.Month, le.personalidentificationinformation.dateofdeath.Day));
		SELF.riskaddressinformation.datefirstseen := CleanDate(iESP2Date(le.riskaddressinformation.datefirstseen.Year, le.riskaddressinformation.datefirstseen.Month, le.riskaddressinformation.datefirstseen.Day));
		SELF.riskaddressinformation.datelastseen := CleanDate(iESP2Date(le.riskaddressinformation.datelastseen.Year, le.riskaddressinformation.datelastseen.Month, le.riskaddressinformation.datelastseen.Day));
		SELF.riskaddressinformation.dataassodate := CleanDate(iESP2Date(le.riskaddressinformation.dataassodate.Year, le.riskaddressinformation.dataassodate.Month, le.riskaddressinformation.dataassodate.Day));
		SELF.currentdriverlicenseinformation.issuedate := CleanDate(iESP2Date(le.currentdriverlicenseinformation.issuedate.Year, le.currentdriverlicenseinformation.issuedate.Month, le.currentdriverlicenseinformation.issuedate.Day));
		SELF.currentdriverlicenseinformation.expdatev := CleanDate(iESP2Date(le.currentdriverlicenseinformation.expdatev.Year, le.currentdriverlicenseinformation.expdatev.Month, le.currentdriverlicenseinformation.expdatev.Day));
		SELF.currentdriverlicenseinformation.dataassodatev := CleanDate(iESP2Date(le.currentdriverlicenseinformation.dataassodatev.Year, le.currentdriverlicenseinformation.dataassodatev.Month, le.currentdriverlicenseinformation.dataassodatev.Day));
		SELF := le;
	END;
// ROOT		
CDisc_Auto_Response cleanCDiscAuto(KELBlackBox.FileCarrierDiscoveryAuto le) := TRANSFORM
		SELF.RecordIdentifier := le.RecordIdentifier;
		SELF.ReportIdSection.reportrequestid.dateoforder := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateoforder.Year, le.ReportIdSection.reportrequestid.dateoforder.Month, le.ReportIdSection.reportrequestid.dateoforder.Day));
		SELF.ReportIdSection.reportrequestid.dateofreceipt := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateofreceipt.Year, le.ReportIdSection.reportrequestid.dateofreceipt.Month, le.ReportIdSection.reportrequestid.dateofreceipt.Day));
		SELF.ReportIdSection.reportrequestid.dateofcompletion := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateofcompletion.Year, le.ReportIdSection.reportrequestid.dateofcompletion.Month, le.ReportIdSection.reportrequestid.dateofcompletion.Day));
		SELF.ReportIdSection.reportidsupplementa.relatedprocessingdate := CleanDate(iESP2Date(le.ReportIdSection.reportidsupplementa.relatedprocessingdate.Year, le.ReportIdSection.reportidsupplementa.relatedprocessingdate.Month, le.ReportIdSection.reportidsupplementa.relatedprocessingdate.Day));
		SELF.subjectsearchinfosection.inquirypersonset.person.dateofbirth := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.person.dateofbirth.Year, le.subjectsearchinfosection.inquirypersonset.person.dateofbirth.Month, le.subjectsearchinfosection.inquirypersonset.person.dateofbirth.Day));
		SELF.subjectsearchinfosection.inquirypersonset.person.dataassociationdate := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.person.dataassociationdate.Year, le.subjectsearchinfosection.inquirypersonset.person.dataassociationdate.Month, le.subjectsearchinfosection.inquirypersonset.person.dataassociationdate.Day));
		SELF.subjectsearchinfosection.inquirypersonset.person.dateofdeath := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.person.dateofdeath.Year, le.subjectsearchinfosection.inquirypersonset.person.dateofdeath.Month, le.subjectsearchinfosection.inquirypersonset.person.dateofdeath.Day));
		SELF.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.datefirstseen := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.datefirstseen.Year, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.datefirstseen.Month, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.datefirstseen.Day));
		SELF.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.datelastseen := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.datelastseen.Year, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.datelastseen.Month, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.datelastseen.Day));
		SELF.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.dataassodate := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.dataassodate.Year, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.dataassodate.Month, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.currentorriskaddress.dataassodate.Day));
		SELF.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.datefirstseen := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.datefirstseen.Year, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.datefirstseen.Month, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.datefirstseen.Day));
		SELF.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.datelastseen := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.datelastseen.Year, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.datelastseen.Month, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.datelastseen.Day));
		SELF.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.dataassodate := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.dataassodate.Year, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.dataassodate.Month, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.mailingaddress.dataassodate.Day));
		SELF.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.datefirstseen := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.datefirstseen.Year, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.datefirstseen.Month, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.datefirstseen.Day));
		SELF.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.datelastseen := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.datelastseen.Year, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.datelastseen.Month, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.datelastseen.Day));
		SELF.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.dataassodate := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.dataassodate.Year, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.dataassodate.Month, le.subjectsearchinfosection.inquirypersonset.requiredaddressinfoset.formeraddress.dataassodate.Day));
		SELF.subjectsearchinfosection.inquirypersonset.currentlicense.issuedate := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.currentlicense.issuedate.Year, le.subjectsearchinfosection.inquirypersonset.currentlicense.issuedate.Month, le.subjectsearchinfosection.inquirypersonset.currentlicense.issuedate.Day));
		SELF.subjectsearchinfosection.inquirypersonset.currentlicense.expdatev := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.currentlicense.expdatev.Year, le.subjectsearchinfosection.inquirypersonset.currentlicense.expdatev.Month, le.subjectsearchinfosection.inquirypersonset.currentlicense.expdatev.Day));
		SELF.subjectsearchinfosection.inquirypersonset.currentlicense.dataassodatev := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.currentlicense.dataassodatev.Year, le.subjectsearchinfosection.inquirypersonset.currentlicense.dataassodatev.Month, le.subjectsearchinfosection.inquirypersonset.currentlicense.dataassodatev.Day));
		SELF.subjectsearchinfosection.inquirypersonset.formerlicense.issuedate := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.formerlicense.issuedate.Year, le.subjectsearchinfosection.inquirypersonset.formerlicense.issuedate.Month, le.subjectsearchinfosection.inquirypersonset.formerlicense.issuedate.Day));
		SELF.subjectsearchinfosection.inquirypersonset.formerlicense.expdatev := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.formerlicense.expdatev.Year, le.subjectsearchinfosection.inquirypersonset.formerlicense.expdatev.Month, le.subjectsearchinfosection.inquirypersonset.formerlicense.expdatev.Day));
		SELF.subjectsearchinfosection.inquirypersonset.formerlicense.dataassodatev := CleanDate(iESP2Date(le.subjectsearchinfosection.inquirypersonset.formerlicense.dataassodatev.Year, le.subjectsearchinfosection.inquirypersonset.formerlicense.dataassodatev.Month, le.subjectsearchinfosection.inquirypersonset.formerlicense.dataassodatev.Day));
		SELF.reportalertsmonitorsection.policypersons := PROJECT(le.reportalertsmonitorsection.policypersons, cleanPolicyPersons(LEFT, le.RecordIdentifier, COUNTER));
		SELF := le;
	END;

EXPORT FileCDiscAutoRoot := PROJECT(KELBlackBox.FileCarrierDiscoveryAuto, cleanCDiscAuto(LEFT));	

//  generalmessagessection - reportlevelinquiryrecap 		
EXPORT FileCDiscAutoGenMessages_ReportHeader := PROJECT(FileCDiscAutoRoot, 
																	TRANSFORM({INTEGER8 RecordIdentifier, RECORDOF(FileCDiscAutoRoot.generalmessagessection) - messages}, 
																		SELF.RecordIdentifier := Left.RecordIdentifier; 
																		SELF := LEFT.generalmessagessection));

//  additionalinfosection - reportsectionheader																				
EXPORT FileCDiscAutoAddInfo_ReportHeader := PROJECT(FileCDiscAutoRoot, 
																	TRANSFORM({INTEGER8 RecordIdentifier, RECORDOF(FileCDiscAutoRoot.additionalinfosection) - messages}, 
																		SELF.RecordIdentifier := Left.RecordIdentifier; 
																		SELF := LEFT.additionalinfosection));																			

//  reportalertsmonitorsection - reportsectionheader		
EXPORT FileCDiscAutoReportAlertMonitor__ReportHeader := PROJECT(FileCDiscAutoRoot, 
																	TRANSFORM({INTEGER8 RecordIdentifier, RECORDOF(FileCDiscAutoRoot.reportalertsmonitorsection) - policypersons}, 
																		SELF.RecordIdentifier := Left.RecordIdentifier; 
																		SELF := LEFT.reportalertsmonitorsection));	

// **************Normalizations ******************
// **1** generalmessagessection	- messages
{integer8 RecordIdentifier, integer MessageCounter, t_narrativearecordreport} getGenMesgMessages(CDisc_Auto_Response L, t_narrativearecordreport R, integer cntr) := transform
               self.RecordIdentifier := L.RecordIdentifier;
               self.MessageCounter := cntr;
               Self := R;
      				 END;
   
EXPORT FileCDiscAutoGenMessages:= normalize(FileCDiscAutoRoot, left.generalmessagessection.messages, getGenMesgMessages(LEFT, Right, counter));

// **2** generalmessagessection - messages
{integer8 RecordIdentifier, integer MessageCounter, t_narrativearecordreport} getAddInfoMessages(CDisc_Auto_Response L, t_narrativearecordreport R, integer cntr) := transform
               self.RecordIdentifier := L.RecordIdentifier;
               self.MessageCounter := cntr;
               Self := R;
      				 END;
   
EXPORT FileCDiscAutoAddInfo:= normalize(FileCDiscAutoRoot, left.additionalinfosection.messages, getAddInfoMessages(LEFT, Right, counter));

// **3** reportalertsmonitorsection	- policypersons
t_policypersonsection getPolicyPersons(CDisc_Auto_Response L, t_policypersonsection R, integer cntr) := transform
               self.RecordIdentifier := L.RecordIdentifier;
               self.PolicyPersonCounter := cntr;
               Self := R;
      				 END;
   
EXPORT FileCDiscAutoReportAlertMonitor:= normalize(FileCDiscAutoRoot, left.reportalertsmonitorsection.policypersons, getPolicyPersons(LEFT, Right, counter));			
END;