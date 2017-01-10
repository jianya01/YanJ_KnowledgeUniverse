﻿IMPORT STD;
IMPORT KEL07 AS KEL;
IMPORT KELBlackBox;

EXPORT FileCLDACleaned := MODULE
	// --------------- Cleaning functions ---------------
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

// --------------- Cleaned Layout Definitions - Claims Discovery Auto ---------------
SHARED cdautot_reportrequestidrecordreport := RECORD
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
    STRING8 dateoforder;
    STRING8 dateofreceipt;
    STRING8 dateofcompletion;
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

SHARED cdautot_reportidsupplementarecordreport := RECORD
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
    STRING8 relatedprocessingdate;
    string4 specialnumericfield1{xpath('SpecialNumericField1')};
   END;

SHARED cdautot_reportidentifierrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string4 ider1{xpath('Ider1')};
    string6 param1{xpath('Param1')};
    string1 status1{xpath('Status1')};
    string4 ider2{xpath('Ider2')};
    string6 param2{xpath('Param2')};
    string1 status2{xpath('Status2')};
    string4 ider3{xpath('Ider3')};
    string6 param3{xpath('Param3')};
    string1 status3{xpath('Status3')};
    string4 ider4{xpath('Ider4')};
    string6 param4{xpath('Param4')};
    string1 status4{xpath('Status4')};
    string4 ider5{xpath('Ider5')};
    string6 param5{xpath('Param5')};
    string1 status5{xpath('Status5')};
    string4 ider6{xpath('Ider6')};
    string6 param6{xpath('Param6')};
    string1 status6{xpath('Status6')};
    string4 ider7{xpath('Ider7')};
    string6 param7{xpath('Param7')};
    string1 status7{xpath('Status7')};
    string4 ider8{xpath('Ider8')};
    string6 param8{xpath('Param8')};
    string1 status8{xpath('Status8')};
    string4 ider9{xpath('Ider9')};
    string6 param9{xpath('Param9')};
    string1 status9{xpath('Status9')};
    string4 ider10{xpath('Ider10')};
    string6 param10{xpath('Param10')};
    string1 status10{xpath('Status10')};
   END;

SHARED cdautot_unitquotebackrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string60 quoteback{xpath('Quoteback')};
   END;

SHARED cdautot_requestorproducerrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string50 requestorname{xpath('RequestorName')};
   END;

SHARED cdautot_reportidsectionclaimsdiscoveryautoreport := RECORD
   cdautot_reportrequestidrecordreport reportrequestid{xpath('ReportRequestId')};
   cdautot_reportidsupplementarecordreport reportidsupplementa{xpath('ReportIdSupplementA')};
   cdautot_reportidentifierrecordreport reportidentifier{xpath('ReportIdentifier')};
   cdautot_unitquotebackrecordreport unitquoteback{xpath('UnitQuoteback')};
   cdautot_requestorproducerrecordreport requestorproducer{xpath('RequestorProducer')};
  END;

SHARED cdautot_recapprocessingrecordreport := RECORD
    UNSIGNED8 RecordIdentifier;
		UNSIGNED8 RecapRecordCounter;
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

SHARED cdautot_recapprocessingsectionclaimsdiscoveryautoreport := RECORD
   cdautot_recapprocessingrecordreport inquiryrecap{xpath('InquiryRecap')};
   DATASET(cdautot_recapprocessingrecordreport) unitrecap{xpath('UnitRecap/RecapProcessing'), maxcount(51)};
  END;

SHARED cdautot_reportsectionheaderrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string5 sectionidentifier{xpath('SectionIdentifier')};
    string79 sectionlabel{xpath('SectionLabel')};
    string1 sectiondeveloped{xpath('SectionDeveloped')};
   END;

SHARED cdautot_narrativearecordreport := RECORD
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
/*different than Clue auto*/
SHARED cdautot_generalmessagessectionclaimsdiscoveryautoreport := RECORD
   cdautot_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(cdautot_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(999)};
  END;
/*end difference */
SHARED cdautot_addressrecordreport := RECORD
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
    string8 datefirstseen;
    string8 datelastseen;
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
    string8 dataassodate;
    string1 datasourceindicator{xpath('DataSourceIndicator')};
    string2 typecode{xpath('TypeCode')};
    string10 censustract{xpath('CensusTract')};
   END;

SHARED cdautot_policyrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string1 groupusage{xpath('GroupUsage')};
    string2 type{xpath('Type')};
    string20 number{xpath('Number')};
    string8 fromdate;
    string8 todate;
    string5 issueridnumber{xpath('IssuerIdNumber')};
    string20 issuername{xpath('IssuerName')};
    string1 fsitype{xpath('FsiType')};
    string1 fsinumber{xpath('FsiNumber')};
    string1 fsifromdate{xpath('FsiFromDate')};
    string1 fsitodate{xpath('FsiToDate')};
    string1 fsiissueridnumber{xpath('FsiIssuerIdNumber')};
    string1 fsiissuername{xpath('FsiIssuerName')};
    string1 status{xpath('Status')};
    string1 lapseindicator{xpath('LapseIndicator')};
    string2 insurancetype{xpath('InsuranceType')};
    string5 naiccode{xpath('NaicCode')};
    string1 risktype{xpath('RiskType')};
    string1 consumerstatementindicator{xpath('ConsumerStatementIndicator')};
    string1 consumercontributionindicator{xpath('ConsumerContributionIndicator')};
    string8 inceptiondate;
    string8 cancellationdate;
    string7 premium{xpath('Premium')};
    string1 premiumpaymentplan{xpath('PremiumPaymentPlan')};
    string3 premiummethodofpayment{xpath('PremiumMethodOfPayment')};
    string8 lapseloaddate;
    string3 lapsecounter{xpath('LapseCounter')};
    string8 lapselastcanceldate;
    string12 holderpin{xpath('HolderPin')};
    string1 suppressionindicator{xpath('SuppressionIndicator')};
    string2 policystate{xpath('PolicyState')};
    string4 policycancell{xpath('PolicyCancell')};
   END;

SHARED cdautot_groupsearchidsectionclaimsdiscoveryautoreport := RECORD
   cdautot_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   cdautot_addressrecordreport groupcurrentaddress{xpath('GroupCurrentAddress')};
   cdautot_addressrecordreport groupprioraddress{xpath('GroupPriorAddress')};
   cdautot_policyrecordreport grouppriorpolicy{xpath('GroupPriorPolicy')};
  END;

SHARED cdautot_personrecordreport := RECORD
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
     string8 dateofbirth;
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
     string8 dataassociationdate;
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
     string8 dateofdeath;
     string2 numberofdependents{xpath('NumberOfDependents')};
     string1 fraudalertind{xpath('FraudAlertInd')};
     string1 multipolicyind{xpath('MultiPolicyInd')};
     string10 dateofloss{xpath('DateOfLoss')};
    END;

SHARED cdautot_driverlicenserecordreport := RECORD
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
     string8 issuedate;
     string8 expdatev;
     string8 dataassodatev;
     string1 datasourceindicator{xpath('DataSourceIndicator')};
     string1 typeindicator{xpath('TypeIndicator')};
     string3 unitnumber2{xpath('UnitNumber2')};
    END;

SHARED cdautot_subjectidsetclaimsdiscoveryautoreport := RECORD
    UNSIGNED8 RecordIdentifier;
		UNSIGNED8 SubjectIDRecordCounter;
		cdautot_personrecordreport subject{xpath('Subject')};
    cdautot_unitquotebackrecordreport unitquoteback{xpath('UnitQuoteback')};
    cdautot_addressrecordreport currentaddress{xpath('CurrentAddress')};
    cdautot_addressrecordreport prioraddress{xpath('PriorAddress')};
    cdautot_driverlicenserecordreport currentlicense{xpath('CurrentLicense')};
    cdautot_driverlicenserecordreport priorlicense{xpath('PriorLicense')};
    cdautot_policyrecordreport priorpolicy{xpath('PriorPolicy')};
   END;

SHARED cdautot_subjectidsectionclaimsdiscoveryautoreport := RECORD
   cdautot_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(cdautot_subjectidsetclaimsdiscoveryautoreport) subjectidset{xpath('SubjectIdSet/SubjectId'), maxcount(50)};
  END;

SHARED cdautot_vehiclerecordreport := RECORD
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
     string1 type{xpath('Type')};
     string1 brandedindicator{xpath('BrandedIndicator')};
     string1 leasedindicator{xpath('LeasedIndicator')};
     string10 dateofloss{xpath('DateOfLoss')};
    END;

SHARED cdautot_vehicleidsetclaimsdiscoveryautoreport := RECORD
    cdautot_vehiclerecordreport vehicle{xpath('Vehicle')};
    cdautot_unitquotebackrecordreport unitquoteback{xpath('UnitQuoteback')};
   END;

SHARED cdautot_vehicleidsectionclaimsdiscoveryautoreport := RECORD
   cdautot_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(cdautot_vehicleidsetclaimsdiscoveryautoreport) vehicleidset{xpath('VehicleIdSet/VehicleId'), maxcount(50)};
  END;

SHARED cdautot_claiminforecordreport := RECORD
     string3 unitnumber{xpath('UnitNumber')};
     string3 groupsequencenumber{xpath('GroupSequenceNumber')};
     string4 recordcode{xpath('RecordCode')};
     string2 recordoccurra{xpath('RecordOccurrA')};
     string2 recordoccurrb{xpath('RecordOccurrB')};
     string2 classification{xpath('Classification')};
     string8 claimdate;
     string2 claimageyears{xpath('ClaimAgeYears')};
     string2 claimagemonths{xpath('ClaimAgeMonths')};
     string2 claimtype{xpath('ClaimType')};
     string2 claimdisposition{xpath('ClaimDisposition')};
     string20 contributorclaimnumber{xpath('ContributorClaimNumber')};
     string16 claimfilenumber{xpath('ClaimFileNumber')};
     string1 scopeofclaim{xpath('ScopeOfClaim')};
     string1 atfaultindicator{xpath('AtFaultIndicator')};
     string8 firstclaimpaymentdate;
     string8 latestclaimpaymentdate;
     string1 locationofloss{xpath('LocationOfLoss')};
     string5 contributorambestnumber{xpath('ContributorAmbestNumber')};
     string8 disputeclearancedate;
     string1 vehicleoperatorindicator{xpath('VehicleOperatorIndicator')};
     string1 claimassociationindicator{xpath('ClaimAssociationIndicator')};
     string1 plcyhldrrelationshipindicator{xpath('PlcyhldrRelationshipIndicator')};
     string1 claimaddressmatchindicator{xpath('ClaimAddressMatchIndicator')};
     string1 claimtelephonematchindicator{xpath('ClaimTelephoneMatchIndicator')};
     string1 claimssnmatchindicator{xpath('ClaimSsnMatchIndicator')};
     string1 claimdlnummatchindicator{xpath('ClaimDlNumMatchIndicator')};
     string5 reservedclaimmatchindicators{xpath('ReservedClaimMatchIndicators')};
     string1 prcclaimmatchindicator{xpath('PrcClaimMatchIndicator')};
    END;

SHARED cdautot_claimpaymentrecordreport := RECORD
     UNSIGNED8 RecordIdentifier;
		 UNSIGNED8 ClaimIDRecordCounter;
		 UNSIGNED8 PaymentRecordCounter;
		 string3 unitnumber{xpath('UnitNumber')};
     string3 groupsequencenumber{xpath('GroupSequenceNumber')};
     string4 recordcode{xpath('RecordCode')};
     string2 recordoccurra{xpath('RecordOccurrA')};
     string2 recordoccurrb{xpath('RecordOccurrB')};
     string5 claimcat1type{xpath('ClaimCat1Type')};
     string9 claimcat1amount{xpath('ClaimCat1Amount')};
     string2 claimcat1disp{xpath('ClaimCat1Disp')};
     string5 claimcat2type{xpath('ClaimCat2Type')};
     string9 claimcat2amount{xpath('ClaimCat2Amount')};
     string2 claimcat2disp{xpath('ClaimCat2Disp')};
     string5 claimcat3type{xpath('ClaimCat3Type')};
     string9 claimcat3amount{xpath('ClaimCat3Amount')};
     string2 claimcat3disp{xpath('ClaimCat3Disp')};
     string5 claimcat4type{xpath('ClaimCat4Type')};
     string9 claimcat4amount{xpath('ClaimCat4Amount')};
     string2 claimcate4disp{xpath('ClaimCate4Disp')};
     string5 claimcat5type{xpath('ClaimCat5Type')};
     string9 claimcat5amount{xpath('ClaimCat5Amount')};
     string2 claimcat5disp{xpath('ClaimCat5Disp')};
    END;
		
SHARED cdautot_claimsetclaimsdiscoveryautoreport := RECORD
    UNSIGNED8 RecordIdentifier;
		UNSIGNED8 ClaimIDRecordCounter;
		cdautot_claiminforecordreport claiminfo{xpath('ClaimInfo')};
    cdautot_policyrecordreport policy{xpath('Policy')};
    cdautot_personrecordreport policyholder{xpath('PolicyHolder')};
    cdautot_addressrecordreport address{xpath('Address')};
    cdautot_driverlicenserecordreport driverslicense{xpath('DriversLicense')};
    cdautot_personrecordreport vehicleoperator{xpath('VehicleOperator')};
    // cdautot_personrecordreport additionalname1{xpath('AdditionalName1')};
    // cdautot_personrecordreport additionalname2{xpath('AdditionalName2')};
    // cdautot_personrecordreport additionalname3{xpath('AdditionalName3')};
    cdautot_vehiclerecordreport vehicle{xpath('Vehicle')};
    DATASET(cdautot_claimpaymentrecordreport) payments{xpath('Payments/ClaimPayment'), maxcount(3)};
    // DATASET(t_consumernarrativesubsetclaimsdiscoveryautoreport) consumernarrativesubset{xpath('ConsumerNarrativeSubset/ConsumerNarrative'), maxcount(2)};
   END;

SHARED cdautot_claimhistory_subjectsectionclaimsdiscoveryautoreport := RECORD
   cdautot_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(cdautot_claimsetclaimsdiscoveryautoreport) claimset{xpath('ClaimSet/Claim'), maxcount(1250)};
  END;
	
	SHARED CD_Auto_Response := RECORD
		UNSIGNED8 RecordIdentifier;
		cdautot_reportidsectionclaimsdiscoveryautoreport reportidsection{xpath('ReportIdSection')};
		cdautot_recapprocessingsectionclaimsdiscoveryautoreport recapprocessingsection{xpath('RecapProcessingSection')};
		cdautot_groupsearchidsectionclaimsdiscoveryautoreport groupsearchidsection{xpath('GroupSearchIdSection')};
		cdautot_subjectidsectionclaimsdiscoveryautoreport subjectidsection{xpath('SubjectIdSection')};
		cdautot_claimhistory_subjectsectionclaimsdiscoveryautoreport claimhistorysubjectsection{xpath('ClaimHistorySubjectSection')};
		// The following sections don't appear to be populated, and thus aren't utilized at the moment:
		// XmlInfo, VehicleIdSection, GeneralMessagesSection, ClaimHistoryVehicleSection, ClaimHistoryPossibleRelatedSection, ClaimHistoryAgentSummarySection, AdditionalDriverDiscoverySection, 
		// InquiryHistorySection, AdditionalInformationSection, AttachedProductsSections, CCAttachSection, VehicleInformationSection
 	END;
	
	
	// --------------- Cleaning TRANSFORM Definitions - CLUE Auto ---------------
	cdautot_recapprocessingrecordreport cleanRecapProcessingSection(RECORDOF(KELBlackBox.FileCDAuto.recapprocessingsection.unitrecap) le, UNSIGNED8 recIdentifier, UNSIGNED8 cntr) := TRANSFORM
		SELF.RecordIdentifier := recIdentifier;
		SELF.RecapRecordCounter := cntr;
		
		SELF := le;
	END;
	
	cdautot_subjectidsetclaimsdiscoveryautoreport cleanSubjectIDSection(RECORDOF(KELBlackBox.FileCLUEAuto.subjectidsection.subjectidset) le, UNSIGNED8 recIdentifier, UNSIGNED8 cntr) := TRANSFORM
		SELF.RecordIdentifier := recIdentifier;
		SELF.SubjectIDRecordCounter := cntr;
		SELF.subject.dateofbirth := CleanDate(iESP2Date(le.subject.dateofbirth.Year, le.subject.dateofbirth.Month, le.subject.dateofbirth.Day));
		SELF.subject.dataassociationdate := CleanDate(iESP2Date(le.subject.dataassociationdate.Year, le.subject.dataassociationdate.Month, le.subject.dataassociationdate.Day));
		SELF.subject.dateofdeath := CleanDate(iESP2Date(le.subject.dateofdeath.Year, le.subject.dateofdeath.Month, le.subject.dateofdeath.Day));
		SELF.currentlicense.issuedate := CleanDate(iESP2Date(le.currentlicense.issuedate.Year, le.currentlicense.issuedate.Month, le.currentlicense.issuedate.Day));
		SELF.currentlicense.expdatev := CleanDate(iESP2Date(le.currentlicense.expdatev.Year, le.currentlicense.expdatev.Month, le.currentlicense.expdatev.Day));
		SELF.currentlicense.dataassodatev := CleanDate(iESP2Date(le.currentlicense.dataassodatev.Year, le.currentlicense.dataassodatev.Month, le.currentlicense.dataassodatev.Day));
		SELF.currentlicense._type := le.currentlicense._type;
		SELF.priorlicense.issuedate := CleanDate(iESP2Date(le.priorlicense.issuedate.Year, le.priorlicense.issuedate.Month, le.priorlicense.issuedate.Day));
		SELF.priorlicense.expdatev := CleanDate(iESP2Date(le.priorlicense.expdatev.Year, le.priorlicense.expdatev.Month, le.priorlicense.expdatev.Day));
		SELF.priorlicense.dataassodatev := CleanDate(iESP2Date(le.priorlicense.dataassodatev.Year, le.priorlicense.dataassodatev.Month, le.priorlicense.dataassodatev.Day));
		SELF.priorlicense._type := le.priorlicense._type;
		SELF.currentaddress.datefirstseen := CleanDate(iESP2Date(le.currentaddress.datefirstseen.Year, le.currentaddress.datefirstseen.Month, le.currentaddress.datefirstseen.Day));
		SELF.currentaddress.datelastseen := CleanDate(iESP2Date(le.currentaddress.datelastseen.Year, le.currentaddress.datelastseen.Month, le.currentaddress.datelastseen.Day));
		SELF.currentaddress.dataassodate := CleanDate(iESP2Date(le.currentaddress.dataassodate.Year, le.currentaddress.dataassodate.Month, le.currentaddress.dataassodate.Day));
		SELF.prioraddress.datefirstseen := CleanDate(iESP2Date(le.prioraddress.datefirstseen.Year, le.prioraddress.datefirstseen.Month, le.prioraddress.datefirstseen.Day));
		SELF.prioraddress.datelastseen := CleanDate(iESP2Date(le.prioraddress.datelastseen.Year, le.prioraddress.datelastseen.Month, le.prioraddress.datelastseen.Day));
		SELF.prioraddress.dataassodate := CleanDate(iESP2Date(le.prioraddress.dataassodate.Year, le.prioraddress.dataassodate.Month, le.prioraddress.dataassodate.Day));
		SELF.priorpolicy.fromdate := CleanDate(iESP2Date(le.priorpolicy.fromdate.Year, le.priorpolicy.fromdate.Month, le.priorpolicy.fromdate.Day));
		SELF.priorpolicy.todate := CleanDate(iESP2Date(le.priorpolicy.todate.Year, le.priorpolicy.todate.Month, le.priorpolicy.todate.Day));
		SELF.priorpolicy.inceptiondate := CleanDate(iESP2Date(le.priorpolicy.inceptiondate.Year, le.priorpolicy.inceptiondate.Month, le.priorpolicy.inceptiondate.Day));
		SELF.priorpolicy.cancellationdate := CleanDate(iESP2Date(le.priorpolicy.cancellationdate.Year, le.priorpolicy.cancellationdate.Month, le.priorpolicy.cancellationdate.Day));
		SELF.priorpolicy.lapseloaddate := CleanDate(iESP2Date(le.priorpolicy.lapseloaddate.Year, le.priorpolicy.lapseloaddate.Month, le.priorpolicy.lapseloaddate.Day));
		SELF.priorpolicy.lapselastcanceldate := CleanDate(iESP2Date(le.priorpolicy.lapselastcanceldate.Year, le.priorpolicy.lapselastcanceldate.Month, le.priorpolicy.lapselastcanceldate.Day));
		SELF.priorpolicy.type := le.priorpolicy._type;
		
		SELF := le;
	END;
	
	cdautot_claimsetclaimsdiscoveryautoreport cleanClaimHistorySection(RECORDOF(KELBlackBox.FileCDAuto.claimhistorysubjectsection.claimset) le, UNSIGNED8 recIdentifier, UNSIGNED8 cntr) := TRANSFORM
		SELF.RecordIdentifier := recIdentifier;
		SELF.ClaimIDRecordCounter := cntr;
		SELF.claiminfo.claimdate := CleanDate(iESP2Date(le.claiminfo.claimdate.Year, le.claiminfo.claimdate.Month, le.claiminfo.claimdate.Day));
		SELF.claiminfo.firstclaimpaymentdate := CleanDate(iESP2Date(le.claiminfo.firstclaimpaymentdate.Year, le.claiminfo.firstclaimpaymentdate.Month, le.claiminfo.firstclaimpaymentdate.Day));
		SELF.claiminfo.latestclaimpaymentdate := CleanDate(iESP2Date(le.claiminfo.latestclaimpaymentdate.Year, le.claiminfo.latestclaimpaymentdate.Month, le.claiminfo.latestclaimpaymentdate.Day));
		SELF.claiminfo.disputeclearancedate := CleanDate(iESP2Date(le.claiminfo.disputeclearancedate.Year, le.claiminfo.disputeclearancedate.Month, le.claiminfo.disputeclearancedate.Day));
		SELF.policyholder.dateofbirth := CleanDate(iESP2Date(le.policyholder.dateofbirth.Year, le.policyholder.dateofbirth.Month, le.policyholder.dateofbirth.Day));
		SELF.policyholder.dataassociationdate := CleanDate(iESP2Date(le.policyholder.dataassociationdate.Year, le.policyholder.dataassociationdate.Month, le.policyholder.dataassociationdate.Day));
		SELF.policyholder.dateofdeath := CleanDate(iESP2Date(le.policyholder.dateofdeath.Year, le.policyholder.dateofdeath.Month, le.policyholder.dateofdeath.Day));
		SELF.vehicleoperator.dateofbirth := CleanDate(iESP2Date(le.vehicleoperator.dateofbirth.Year, le.vehicleoperator.dateofbirth.Month, le.vehicleoperator.dateofbirth.Day));
		SELF.vehicleoperator.dataassociationdate := CleanDate(iESP2Date(le.vehicleoperator.dataassociationdate.Year, le.vehicleoperator.dataassociationdate.Month, le.vehicleoperator.dataassociationdate.Day));
		SELF.vehicleoperator.dateofdeath := CleanDate(iESP2Date(le.vehicleoperator.dateofdeath.Year, le.vehicleoperator.dateofdeath.Month, le.vehicleoperator.dateofdeath.Day));
		SELF.policy.fromdate := CleanDate(iESP2Date(le.policy.fromdate.Year, le.policy.fromdate.Month, le.policy.fromdate.Day));
		SELF.policy.todate := CleanDate(iESP2Date(le.policy.todate.Year, le.policy.todate.Month, le.policy.todate.Day));
		SELF.policy.inceptiondate := CleanDate(iESP2Date(le.policy.inceptiondate.Year, le.policy.inceptiondate.Month, le.policy.inceptiondate.Day));
		SELF.policy.cancellationdate := CleanDate(iESP2Date(le.policy.cancellationdate.Year, le.policy.cancellationdate.Month, le.policy.cancellationdate.Day));
		SELF.policy.lapseloaddate := CleanDate(iESP2Date(le.policy.lapseloaddate.Year, le.policy.lapseloaddate.Month, le.policy.lapseloaddate.Day));
		SELF.policy.lapselastcanceldate := CleanDate(iESP2Date(le.policy.lapselastcanceldate.Year, le.policy.lapselastcanceldate.Month, le.policy.lapselastcanceldate.Day));
		SELF.policy.type := le.policy._type;
		SELF.address.datefirstseen := CleanDate(iESP2Date(le.address.datefirstseen.Year, le.address.datefirstseen.Month, le.address.datefirstseen.Day));
		SELF.address.datelastseen := CleanDate(iESP2Date(le.address.datelastseen.Year, le.address.datelastseen.Month, le.address.datelastseen.Day));
		SELF.address.dataassodate := CleanDate(iESP2Date(le.address.dataassodate.Year, le.address.dataassodate.Month, le.address.dataassodate.Day));
		SELF.driverslicense.issuedate := CleanDate(iESP2Date(le.driverslicense.issuedate.Year, le.driverslicense.issuedate.Month, le.driverslicense.issuedate.Day));
		SELF.driverslicense.expdatev := CleanDate(iESP2Date(le.driverslicense.expdatev.Year, le.driverslicense.expdatev.Month, le.driverslicense.expdatev.Day));
		SELF.driverslicense.dataassodatev := CleanDate(iESP2Date(le.driverslicense.dataassodatev.Year, le.driverslicense.dataassodatev.Month, le.driverslicense.dataassodatev.Day));
		SELF.driverslicense._type := le.driverslicense._type;
		SELF.vehicle.type := le.vehicle._type;
		SELF.Payments := PROJECT(le.Payments, TRANSFORM(cdautot_claimpaymentrecordreport, SELF.RecordIdentifier := recIdentifier; SELF.ClaimIDRecordCounter := cntr; SELF.PaymentRecordCounter := COUNTER; SELF := LEFT));
		
		SELF := le;
	END;
	
	CD_Auto_Response cleanCDAuto(KELBlackBox.FileCDAuto le) := TRANSFORM
		SELF.RecordIdentifier := le.RecID;
		SELF.ReportIdSection.reportrequestid.dateoforder := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateoforder.Year, le.ReportIdSection.reportrequestid.dateoforder.Month, le.ReportIdSection.reportrequestid.dateoforder.Day));
		SELF.ReportIdSection.reportrequestid.dateofreceipt := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateofreceipt.Year, le.ReportIdSection.reportrequestid.dateofreceipt.Month, le.ReportIdSection.reportrequestid.dateofreceipt.Day));
		SELF.ReportIdSection.reportrequestid.dateofcompletion := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateofcompletion.Year, le.ReportIdSection.reportrequestid.dateofcompletion.Month, le.ReportIdSection.reportrequestid.dateofcompletion.Day));
		SELF.ReportIdSection.reportidsupplementa.relatedprocessingdate := CleanDate(iESP2Date(le.ReportIdSection.reportidsupplementa.relatedprocessingdate.Year, le.ReportIdSection.reportidsupplementa.relatedprocessingdate.Month, le.ReportIdSection.reportidsupplementa.relatedprocessingdate.Day));
		SELF.subjectidsection.subjectidset := PROJECT(le.subjectidsection.subjectidset, cleanSubjectIDSection(LEFT, le.RecID, COUNTER));
		SELF.recapprocessingsection.unitrecap := PROJECT(le.recapprocessingsection.unitrecap, cleanRecapProcessingSection(LEFT, le.RecID, COUNTER));
		SELF.recapprocessingsection.inquiryrecap.RecordIdentifier := le.RecID;
		SELF.recapprocessingsection.inquiryrecap.RecapRecordCounter := 1;
		SELF.claimhistorysubjectsection.claimset := PROJECT(le.claimhistorysubjectsection.claimset, cleanClaimHistorySection(LEFT, le.RecID, COUNTER));
		SELF.groupsearchidsection.groupcurrentaddress.datefirstseen := CleanDate(iESP2Date(le.groupsearchidsection.groupcurrentaddress.datefirstseen.Year, le.groupsearchidsection.groupcurrentaddress.datefirstseen.Month, le.groupsearchidsection.groupcurrentaddress.datefirstseen.Day));
		SELF.groupsearchidsection.groupcurrentaddress.datelastseen := CleanDate(iESP2Date(le.groupsearchidsection.groupcurrentaddress.datelastseen.Year, le.groupsearchidsection.groupcurrentaddress.datelastseen.Month, le.groupsearchidsection.groupcurrentaddress.datelastseen.Day));
		SELF.groupsearchidsection.groupcurrentaddress.dataassodate := CleanDate(iESP2Date(le.groupsearchidsection.groupcurrentaddress.dataassodate.Year, le.groupsearchidsection.groupcurrentaddress.dataassodate.Month, le.groupsearchidsection.groupcurrentaddress.dataassodate.Day));
		SELF.groupsearchidsection.groupprioraddress.datefirstseen := CleanDate(iESP2Date(le.groupsearchidsection.groupprioraddress.datefirstseen.Year, le.groupsearchidsection.groupprioraddress.datefirstseen.Month, le.groupsearchidsection.groupprioraddress.datefirstseen.Day));
		SELF.groupsearchidsection.groupprioraddress.datelastseen := CleanDate(iESP2Date(le.groupsearchidsection.groupprioraddress.datelastseen.Year, le.groupsearchidsection.groupprioraddress.datelastseen.Month, le.groupsearchidsection.groupprioraddress.datelastseen.Day));
		SELF.groupsearchidsection.groupprioraddress.dataassodate := CleanDate(iESP2Date(le.groupsearchidsection.groupprioraddress.dataassodate.Year, le.groupsearchidsection.groupprioraddress.dataassodate.Month, le.groupsearchidsection.groupprioraddress.dataassodate.Day));
		SELF.groupsearchidsection.grouppriorpolicy.fromdate := CleanDate(iESP2Date(le.groupsearchidsection.grouppriorpolicy.fromdate.Year, le.groupsearchidsection.grouppriorpolicy.fromdate.Month, le.groupsearchidsection.grouppriorpolicy.fromdate.Day));
		SELF.groupsearchidsection.grouppriorpolicy.todate := CleanDate(iESP2Date(le.groupsearchidsection.grouppriorpolicy.todate.Year, le.groupsearchidsection.grouppriorpolicy.todate.Month, le.groupsearchidsection.grouppriorpolicy.todate.Day));
		SELF.groupsearchidsection.grouppriorpolicy.inceptiondate := CleanDate(iESP2Date(le.groupsearchidsection.grouppriorpolicy.inceptiondate.Year, le.groupsearchidsection.grouppriorpolicy.inceptiondate.Month, le.groupsearchidsection.grouppriorpolicy.inceptiondate.Day));
		SELF.groupsearchidsection.grouppriorpolicy.cancellationdate := CleanDate(iESP2Date(le.groupsearchidsection.grouppriorpolicy.cancellationdate.Year, le.groupsearchidsection.grouppriorpolicy.cancellationdate.Month, le.groupsearchidsection.grouppriorpolicy.cancellationdate.Day));
		SELF.groupsearchidsection.grouppriorpolicy.lapseloaddate := CleanDate(iESP2Date(le.groupsearchidsection.grouppriorpolicy.lapseloaddate.Year, le.groupsearchidsection.grouppriorpolicy.lapseloaddate.Month, le.groupsearchidsection.grouppriorpolicy.lapseloaddate.Day));
		SELF.groupsearchidsection.grouppriorpolicy.lapselastcanceldate := CleanDate(iESP2Date(le.groupsearchidsection.grouppriorpolicy.lapselastcanceldate.Year, le.groupsearchidsection.grouppriorpolicy.lapselastcanceldate.Month, le.groupsearchidsection.grouppriorpolicy.lapselastcanceldate.Day));
		SELF.groupsearchidsection.grouppriorpolicy.type := le.groupsearchidsection.grouppriorpolicy._type;
		
		SELF := le;
	END;

	// --------------- Clean - CLUE Auto ---------------
	EXPORT FileCDAutoCleaned := PROJECT(KELBlackBox.FileCDAuto, cleanCDAuto(LEFT));
	
	// --------------- Normalize - CLUE Auto ---------------
	EXPORT FileCDAutoSubjectID := NORMALIZE(FileCDAutoCleaned, LEFT.subjectidsection.subjectidset, TRANSFORM(cdautot_subjectidsetclaimsdiscoveryautoreport, SELF := RIGHT));
	
	EXPORT FileCDAutoClaim := NORMALIZE(FileCDAutoCleaned, LEFT.claimhistorysubjectsection.claimset, TRANSFORM(cdautot_claimsetclaimsdiscoveryautoreport, SELF := RIGHT));
	EXPORT FileCDAutoPayments := NORMALIZE(FileCDAutoClaim, LEFT.Payments, TRANSFORM(cdautot_claimpaymentrecordreport, SELF := RIGHT));
	
	EXPORT FileCDAutoUnitRecap := NORMALIZE(FileCDAutoCleaned, LEFT.recapprocessingsection.unitrecap, TRANSFORM(cdautot_recapprocessingrecordreport, SELF := RIGHT));

END;