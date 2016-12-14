t_insurancebatch := RECORD
    string seqnumber{xpath('SeqNumber')};
    string id{xpath('Id')};
    string mporesults{xpath('MPOResults')};
   END;

t_insurancexmlinfo := RECORD
   string4 flversion{xpath('FLVersion')};
   string9 sidexreturnnode{xpath('SidexReturnNode')};
   t_insurancebatch batch{xpath('Batch')};
  END;

t_editsdate := RECORD
     string2 month{xpath('Month')};
     string2 day{xpath('Day')};
     string4 year{xpath('Year')};
    END;

t_reportrequestidrecordreport := RECORD
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
    t_editsdate dateoforder{xpath('DateOfOrder')};
    t_editsdate dateofreceipt{xpath('DateOfReceipt')};
    t_editsdate dateofcompletion{xpath('DateOfCompletion')};
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

t_reportidsectionccstandaloneresultscust := RECORD
   t_reportrequestidrecordreport reportrequestid{xpath('ReportRequestId')};
  END;

t_recapprocessingrecordreport := RECORD
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

t_recapprocessingsectionccstandaloneresultscust := RECORD
   t_recapprocessingrecordreport reportlevelinquiryrecap{xpath('ReportLevelInquiryRecap')};
   DATASET(t_recapprocessingrecordreport) subjectlevelinquiryrecap{xpath('SubjectLevelInquiryRecap/RecapProcessing'), maxcount(50)};
  END;

t_reportsectionheaderrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string5 sectionidentifier{xpath('SectionIdentifier')};
    string79 sectionlabel{xpath('SectionLabel')};
    string1 sectiondeveloped{xpath('SectionDeveloped')};
   END;

t_narrativearecordreport := RECORD
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

t_generalmessagessectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(99)};
  END;

t_addressrecordreport := RECORD
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
    t_editsdate datefirstseen{xpath('DateFirstSeen')};
    t_editsdate datelastseen{xpath('DateLastSeen')};
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
    t_editsdate dataassodate{xpath('DataAssoDate')};
    string1 datasourceindicator{xpath('DataSourceIndicator')};
    string2 typecode{xpath('TypeCode')};
    string10 censustract{xpath('CensusTract')};
   END;

t_groupaddresssectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   t_addressrecordreport groupcurrentaddress{xpath('GroupCurrentAddress')};
   t_addressrecordreport groupriskaddress{xpath('GroupRiskAddress')};
   t_addressrecordreport groupprioraddress{xpath('GroupPriorAddress')};
   t_addressrecordreport groupmailingaddress{xpath('GroupMailingAddress')};
  END;

t_personrecordreport := RECORD
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
     t_editsdate dateofbirth{xpath('DateOfBirth')};
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
     t_editsdate dataassociationdate{xpath('DataAssociationDate')};
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
     t_editsdate dateofdeath{xpath('DateOfDeath')};
     string2 numberofdependents{xpath('NumberOfDependents')};
     string1 fraudalertind{xpath('FraudAlertInd')};
     string1 multipolicyind{xpath('MultiPolicyInd')};
     string10 dateofloss{xpath('DateOfLoss')};
    END;

t_requiredaddressinformationccstandaloneresultscust := RECORD
     t_addressrecordreport currentorriskaddress{xpath('CurrentOrRiskAddress')};
     t_addressrecordreport mailingaddress{xpath('MailingAddress')};
     t_addressrecordreport prioraddress{xpath('PriorAddress')};
    END;

t_driverlicenserecordreport := RECORD
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
     t_editsdate issuedate{xpath('IssueDate')};
     t_editsdate expdatev{xpath('ExpDatev')};
     t_editsdate dataassodatev{xpath('DataAssoDatev')};
     string1 datasourceindicator{xpath('DataSourceIndicator')};
     string1 typeindicator{xpath('TypeIndicator')};
     string3 unitnumber2{xpath('UnitNumber2')};
    END;

t_subjectidsetccstandaloneresultscust := RECORD
    t_personrecordreport subject{xpath('Subject')};
    t_requiredaddressinformationccstandaloneresultscust requiredaddressinformation{xpath('RequiredAddressInformation')};
    t_driverlicenserecordreport currentlicense{xpath('CurrentLicense')};
    t_driverlicenserecordreport priorlicense{xpath('PriorLicense')};
   END;

t_subjectsearchinformationsectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_subjectidsetccstandaloneresultscust) subjectidsets{xpath('SubjectIdSets/SubjectIdSet'), maxcount(50)};
  END;

t_disclaimsetandreportedpoliciessetcarrieronlyv2report := RECORD
    DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(10014)};
   END;

t_additionalinformationsectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   t_disclaimsetandreportedpoliciessetcarrieronlyv2report disclaimandpoliciesset{xpath('DisclaimAndPoliciesSet')};
  END;

t_personaldatasectionccstandaloneresultscust := RECORD
    t_personrecordreport personrecord{xpath('PersonRecord')};
    t_driverlicenserecordreport driverlicenserecord{xpath('DriverLicenseRecord')};
   END;

t_vehiclerecordreport := RECORD
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

t_vehicledatarelationshiprecordreport := RECORD
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

t_discoveredselectedvehicledataset := RECORD
    t_vehiclerecordreport vehicle{xpath('Vehicle')};
    t_vehicledatarelationshiprecordreport vehicledatarelationship{xpath('VehicleDataRelationship')};
    DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(3)};
   END;

t_attachmentsectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_personaldatasectionccstandaloneresultscust) personaldatasections{xpath('PersonalDataSections/PersonalDataSection'), maxcount(99)};
   DATASET(t_discoveredselectedvehicledataset) vehicledatasets{xpath('VehicleDataSets/VehicleDataSet'), maxcount(25)};
  END;

t_inquiryhistoryheaderrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    t_editsdate dateofinquiry{xpath('DateOfInquiry')};
    string50 inquirername{xpath('InquirerName')};
    string60 quoteback{xpath('Quoteback')};
    string10 inquirerid{xpath('InquirerId')};
    string1 infosrc{xpath('InfoSrc')};
    string2 unitclassification{xpath('UnitClassification')};
    string2 reportusage{xpath('ReportUsage')};
   END;

t_inquiryhistorysectionccstandaloneresultscust := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_inquiryhistoryheaderrecordreport) histories{xpath('Histories/InquiryHistoryHeader'), maxcount(99)};
  END;

CC_Auto_Response := RECORD
  t_insurancexmlinfo xmlinfo{xpath('XmlInfo')};
  t_reportidsectionccstandaloneresultscust reportidsection{xpath('ReportIdSection')};
  t_recapprocessingsectionccstandaloneresultscust recapprocessingsection{xpath('RecapProcessingSection')};
  t_generalmessagessectionccstandaloneresultscust generalmessagessection{xpath('GeneralMessagesSection')};
  t_groupaddresssectionccstandaloneresultscust groupaddresssection{xpath('GroupAddressSection')};
  t_subjectsearchinformationsectionccstandaloneresultscust subjectsearchinformationsection{xpath('SubjectSearchInformationSection')};
  t_additionalinformationsectionccstandaloneresultscust additionalinformationsection{xpath('AdditionalInformationSection')};
  t_attachmentsectionccstandaloneresultscust attachmentsection{xpath('AttachmentSection')};
  t_inquiryhistorysectionccstandaloneresultscust inquiryhistorysection{xpath('InquiryHistorySection')};
  string errorcode;
  integer8 transaction_time{xpath('_call_latency_ms')};
 END;

finalCCAuto := RECORD
	integer8 RecID;
	CC_Auto_Response;// - errorcode - transaction_time;
END;

// Run this file for a 1,000,000 record sample during development
EXPORT FileCurrentCarrierAuto := PROJECT(DATASET('~thor::sv::currentcarrierauto_poc::response::1mfile1', CC_Auto_Response, THOR), TRANSFORM(finalCCAuto, SELF.RecID := COUNTER; SELF := LEFT));

// For testing only
// ds:=DATASET('~thor::sg::CurrentCarrierAuto::Response::Sample50', finalCCAuto, THOR);
// EXPORT FileCurrentCarrierAuto := ds(Recid=1);