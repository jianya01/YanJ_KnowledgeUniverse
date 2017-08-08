IMPORT STD;
IMPORT KEL07 AS KEL;
IMPORT KELBlackBox;

EXPORT FileCLDPCleaned := MODULE
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
// --------------- Cleaned Layout Definitions - CD Property ---------------
	SHARED propertyt_reportrequestidrecordreport := RECORD
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
	
	SHARED propertyt_reportidsupplementarecordreport := RECORD
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
	
	SHARED propertyt_reportidentifierrecordreport := RECORD
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
	
	SHARED propertyt_unitquotebackrecordreport := RECORD
		string3 unitnumber{xpath('UnitNumber')};
		string3 groupsequencenumber{xpath('GroupSequenceNumber')};
		string4 recordcode{xpath('RecordCode')};
		string2 recordoccurra{xpath('RecordOccurrA')};
		string2 recordoccurrb{xpath('RecordOccurrB')};
		string2 classification{xpath('Classification')};
		string60 quoteback{xpath('Quoteback')};
	END;
	
	SHARED propertyt_requestorproducerrecordreport := RECORD
		string3 unitnumber{xpath('UnitNumber')};
		string3 groupsequencenumber{xpath('GroupSequenceNumber')};
		string4 recordcode{xpath('RecordCode')};
		string2 recordoccurra{xpath('RecordOccurrA')};
		string2 recordoccurrb{xpath('RecordOccurrB')};
		string50 requestorname{xpath('RequestorName')};
	END;
	
	SHARED propertyt_reportidsectioncdpropertyreport := RECORD
		propertyt_reportrequestidrecordreport reportrequestid{xpath('ReportRequestId')};
		propertyt_reportidsupplementarecordreport reportidsupplementa{xpath('ReportIdSupplementA')};
		propertyt_reportidentifierrecordreport reportidentifier{xpath('ReportIdentifier')};
		propertyt_unitquotebackrecordreport unitquoteback{xpath('UnitQuoteback')};
		propertyt_requestorproducerrecordreport requestorproducer{xpath('RequestorProducer')};
	END;
	
	SHARED propertyt_reportsectionheaderrecordreport := RECORD
		string3 unitnumber{xpath('UnitNumber')};
		string3 groupsequencenumber{xpath('GroupSequenceNumber')};
		string4 recordcode{xpath('RecordCode')};
		string2 recordoccurra{xpath('RecordOccurrA')};
		string2 recordoccurrb{xpath('RecordOccurrB')};
		string5 sectionidentifier{xpath('SectionIdentifier')};
		string79 sectionlabel{xpath('SectionLabel')};
		string1 sectiondeveloped{xpath('SectionDeveloped')};
	END;
	
	SHARED propertyt_personrecordreport := RECORD
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
		STRING8 dateofbirth;
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
		STRING8 dataassociationdate;
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
		STRING8 dateofdeath;
		string2 numberofdependents{xpath('NumberOfDependents')};
		string1 fraudalertind{xpath('FraudAlertInd')};
		string1 multipolicyind{xpath('MultiPolicyInd')};
		string10 dateofloss{xpath('DateOfLoss')};
	END;
	
	SHARED propertyt_telephonerecordreport := RECORD
		string3 unitnumber{xpath('UnitNumber')};
		string3 groupsequencenumber{xpath('GroupSequenceNumber')};
		string4 recordcode{xpath('RecordCode')};
		string2 recordoccurra{xpath('RecordOccurrA')};
		string2 recordoccurrb{xpath('RecordOccurrB')};
		string2 classification{xpath('Classification')};
		string1 groupusage{xpath('GroupUsage')};
		string3 areacode{xpath('AreaCode')};
		string3 exchange{xpath('Exchange')};
		string4 number{xpath('Number')};
		string4 extension{xpath('Extension')};
		string4 hourstocontactfrom{xpath('HoursToContactFrom')};
		string4 hourstocontactto{xpath('HoursToContactTo')};
		string1 fsiareacode{xpath('FsiAreaCode')};
		string1 fsiexchange{xpath('FsiExchange')};
		string1 fsinumber{xpath('FsiNumber')};
		string1 fsiextension{xpath('FsiExtension')};
		STRING8 dataassociationdate;
		string1 datasourceindicator{xpath('DataSourceIndicator')};
	END;
	
	SHARED propertyt_subjectidsetcdpropertyreport := RECORD
   	UNSIGNED8 RecordIdentifier;
		UNSIGNED8 SubjectIDRecordCounter;
		propertyt_personrecordreport subject{xpath('Subject')};
    propertyt_telephonerecordreport telephone{xpath('Telephone')};
   END;
	 
	 	SHARED propertyt_policyrecordreport := RECORD
		string3 unitnumber{xpath('UnitNumber')};
		string3 groupsequencenumber{xpath('GroupSequenceNumber')};
		string4 recordcode{xpath('RecordCode')};
		string2 recordoccurra{xpath('RecordOccurrA')};
		string2 recordoccurrb{xpath('RecordOccurrB')};
		string2 classification{xpath('Classification')};
		string1 groupusage{xpath('GroupUsage')};
		string2 type{xpath('Type')};
		string20 number{xpath('Number')};
		STRING8 fromdate;
		STRING8 todate;
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
		STRING8 inceptiondate;
		STRING8 cancellationdate;
		string7 premium{xpath('Premium')};
		string1 premiumpaymentplan{xpath('PremiumPaymentPlan')};
		string3 premiummethodofpayment{xpath('PremiumMethodOfPayment')};
		STRING8 lapseloaddate;
		string3 lapsecounter{xpath('LapseCounter')};
		STRING8 lapselastcanceldate;
		string12 holderpin{xpath('HolderPin')};
		string1 suppressionindicator{xpath('SuppressionIndicator')};
		string2 policystate{xpath('PolicyState')};
		string4 policycancell{xpath('PolicyCancell')};
	END;
	
	SHARED propertyt_addressrecordreport := RECORD
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
		STRING8 datefirstseen;
		STRING8 datelastseen;
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
		STRING8 dataassodate;
		string1 datasourceindicator{xpath('DataSourceIndicator')};
		string2 typecode{xpath('TypeCode')};
		string10 censustract{xpath('CensusTract')};
	END;
	
	SHARED propertyt_mortgagerecordreport := RECORD
		string3 unitnumber{xpath('UnitNumber')};
		string3 groupsequencenumber{xpath('GroupSequenceNumber')};
		string4 recordcode{xpath('RecordCode')};
		string2 recordoccurra{xpath('RecordOccurrA')};
		string2 recordoccurrb{xpath('RecordOccurrB')};
		string15 loannumber{xpath('LoanNumber')};
		string50 companyname{xpath('CompanyName')};
		string1 fsiloannumber{xpath('FsiLoanNumber')};
		string1 fsicompanyname{xpath('FsiCompanyName')};
		string2 classification{xpath('Classification')};
		string1 mortgagetype{xpath('MortgageType')};
		string15 loanamt{xpath('LoanAmt')};
		string5 loantypecode{xpath('LoanTypeCode')};
		string4 interestrate{xpath('InterestRate')};
		string3 interestratetypecode{xpath('InterestRateTypeCode')};
	END;
	
	SHARED propertyt_searchinformationsectioncdpropertyreport := RECORD
   DATASET(propertyt_subjectidsetcdpropertyreport) subjectidset{xpath('SubjectIdSet/SubjectId'), maxcount(2)};
   propertyt_policyrecordreport policy{xpath('Policy')};
   propertyt_addressrecordreport riskaddress{xpath('RiskAddress')};
   propertyt_addressrecordreport residenceaddress{xpath('ResidenceAddress')};
   propertyt_addressrecordreport mailingaddress{xpath('MailingAddress')};
   propertyt_addressrecordreport formeraddress{xpath('FormerAddress')};
   propertyt_mortgagerecordreport mortgage{xpath('Mortgage')};
  END;
	
	SHARED propertyt_claiminforecordreport := RECORD
		string3 unitnumber{xpath('UnitNumber')};
		string3 groupsequencenumber{xpath('GroupSequenceNumber')};
		string4 recordcode{xpath('RecordCode')};
		string2 recordoccurra{xpath('RecordOccurrA')};
		string2 recordoccurrb{xpath('RecordOccurrB')};
		string2 classification{xpath('Classification')};
		STRING8 claimdate;
		string2 claimageyears{xpath('ClaimAgeYears')};
		string2 claimagemonths{xpath('ClaimAgeMonths')};
		string2 claimtype{xpath('ClaimType')};
		string2 claimdisposition{xpath('ClaimDisposition')};
		string20 contributorclaimnumber{xpath('ContributorClaimNumber')};
		string16 claimfilenumber{xpath('ClaimFileNumber')};
		string1 scopeofclaim{xpath('ScopeOfClaim')};
		string1 atfaultindicator{xpath('AtFaultIndicator')};
		STRING8 firstclaimpaymentdate;
		STRING8 latestclaimpaymentdate;
		string1 locationofloss{xpath('LocationOfLoss')};
		string5 contributorambestnumber{xpath('ContributorAmbestNumber')};
		STRING8 disputeclearancedate;
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
	
	SHARED propertyt_claimpaymentrecordreport := RECORD
		UNSIGNED8 RecordIdentifier;
		UNSIGNED8 ClaimIDRecordCounter;
		UNSIGNED8 PaymentRecordCounter;
		STRING5 SectionIdentifier;
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
	
	SHARED propertyt_claimsetcdpropertyreport := RECORD
    UNSIGNED8 RecordIdentifier;
		UNSIGNED8 ClaimIDRecordCounter;
		STRING5 SectionIdentifier;
		propertyt_claiminforecordreport claiminfo{xpath('ClaimInfo')};
    DATASET(propertyt_claimpaymentrecordreport) payments{xpath('Payments/ClaimPayment'), maxcount(3)};
    propertyt_policyrecordreport policy{xpath('Policy')};
    propertyt_personrecordreport riskperson{xpath('RiskPerson')};
    propertyt_personrecordreport claimant{xpath('Claimant')};
    propertyt_personrecordreport additionalname1{xpath('AdditionalName1')};
    propertyt_personrecordreport additionalname2{xpath('AdditionalName2')};
    propertyt_personrecordreport additionalname3{xpath('AdditionalName3')};
    propertyt_addressrecordreport address{xpath('Address')};
    propertyt_telephonerecordreport telephone{xpath('Telephone')};
    propertyt_mortgagerecordreport mortgage{xpath('Mortgage')};
 END;
 
	SHARED propertyt_claimhistory_risksectioncdpropertyreport := RECORD
   propertyt_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(propertyt_claimsetcdpropertyreport) claimset{xpath('ClaimSet/ClaimSet'), maxcount(25)};
  END;
	
	SHARED propertyt_claimhistory_insuredsectioncdpropertyreport := RECORD
   propertyt_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(propertyt_claimsetcdpropertyreport) claimset{xpath('ClaimSet/Claim'), maxcount(25)};
  END;
	
	SHARED CD_Property_Response := RECORD
		UNSIGNED8 RecordIdentifier;
		propertyt_reportidsectioncdpropertyreport reportidsection{xpath('ReportIdSection')};
		propertyt_searchinformationsectioncdpropertyreport searchinformationsection{xpath('SearchInformationSection')};
		propertyt_claimhistory_risksectioncdpropertyreport claimhistoryrisksection{xpath('ClaimHistoryRiskSection')};
		propertyt_claimhistory_insuredsectioncdpropertyreport claimhistoryinsuredsection{xpath('ClaimHistoryInsuredSection')};
		// The following sections don't appear to be populated, and thus aren't utilized at the moment:
		// XmlInfo, GeneralMessagesSection, ClaimHistoryAgentSection, InquiryHistorySection, AdditionalInformationSection, AttachedProductsSections
	END;
	
// --------------- Cleaning TRANSFORM Definitions - CD Property ---------------
	propertyt_subjectidsetcdpropertyreport cleanSubjectIDSectionProperty(RECORDOF(KELBlackBox.FileCDProperty.searchinformationsection.subjectidset) le, UNSIGNED8 recIdentifier, UNSIGNED8 cntr) := TRANSFORM
		SELF.RecordIdentifier := recIdentifier;
		SELF.SubjectIDRecordCounter := cntr;
		SELF.subject.dateofbirth := CleanDate(iESP2Date(le.subject.dateofbirth.Year, le.subject.dateofbirth.Month, le.subject.dateofbirth.Day));
		SELF.subject.dataassociationdate := CleanDate(iESP2Date(le.subject.dataassociationdate.Year, le.subject.dataassociationdate.Month, le.subject.dataassociationdate.Day));
		SELF.subject.dateofdeath := CleanDate(iESP2Date(le.subject.dateofdeath.Year, le.subject.dateofdeath.Month, le.subject.dateofdeath.Day));
		SELF.telephone.dataassociationdate := CleanDate(iESP2Date(le.telephone.dataassociationdate.Year, le.telephone.dataassociationdate.Month, le.telephone.dataassociationdate.Day));
		
		SELF := le;
	END;
	
	propertyt_claimsetcdpropertyreport cleanClaimSetProperty(RECORDOF(KELBlackBox.FileCDProperty.claimhistoryrisksection.claimset) le, UNSIGNED8 recIdentifier, UNSIGNED8 cntr, STRING5 secIdentifier) := TRANSFORM
		SELF.RecordIdentifier := recIdentifier;
		SELF.ClaimIDRecordCounter := cntr;
		SELF.SectionIdentifier := secIdentifier;
		SELF.claiminfo.claimdate := CleanDate(iESP2Date(le.claiminfo.claimdate.Year, le.claiminfo.claimdate.Month, le.claiminfo.claimdate.Day));
		SELF.claiminfo.firstclaimpaymentdate := CleanDate(iESP2Date(le.claiminfo.firstclaimpaymentdate.Year, le.claiminfo.firstclaimpaymentdate.Month, le.claiminfo.firstclaimpaymentdate.Day));
		SELF.claiminfo.latestclaimpaymentdate := CleanDate(iESP2Date(le.claiminfo.latestclaimpaymentdate.Year, le.claiminfo.latestclaimpaymentdate.Month, le.claiminfo.latestclaimpaymentdate.Day));
		SELF.claiminfo.disputeclearancedate := CleanDate(iESP2Date(le.claiminfo.disputeclearancedate.Year, le.claiminfo.disputeclearancedate.Month, le.claiminfo.disputeclearancedate.Day));
		SELF.policy.fromdate := CleanDate(iESP2Date(le.policy.fromdate.Year, le.policy.fromdate.Month, le.policy.fromdate.Day));
		SELF.policy.todate := CleanDate(iESP2Date(le.policy.todate.Year, le.policy.todate.Month, le.policy.todate.Day));
		SELF.policy.inceptiondate := CleanDate(iESP2Date(le.policy.inceptiondate.Year, le.policy.inceptiondate.Month, le.policy.inceptiondate.Day));
		SELF.policy.cancellationdate := CleanDate(iESP2Date(le.policy.cancellationdate.Year, le.policy.cancellationdate.Month, le.policy.cancellationdate.Day));
		SELF.policy.lapseloaddate := CleanDate(iESP2Date(le.policy.lapseloaddate.Year, le.policy.lapseloaddate.Month, le.policy.lapseloaddate.Day));
		SELF.policy.lapselastcanceldate := CleanDate(iESP2Date(le.policy.lapselastcanceldate.Year, le.policy.lapselastcanceldate.Month, le.policy.lapselastcanceldate.Day));
		SELF.policy.type := le.policy._type;
		SELF.riskperson.dateofbirth := CleanDate(iESP2Date(le.riskperson.dateofbirth.Year, le.riskperson.dateofbirth.Month, le.riskperson.dateofbirth.Day));
		SELF.riskperson.dataassociationdate := CleanDate(iESP2Date(le.riskperson.dataassociationdate.Year, le.riskperson.dataassociationdate.Month, le.riskperson.dataassociationdate.Day));
		SELF.riskperson.dateofdeath := CleanDate(iESP2Date(le.riskperson.dateofdeath.Year, le.riskperson.dateofdeath.Month, le.riskperson.dateofdeath.Day));
		SELF.claimant.dateofbirth := CleanDate(iESP2Date(le.claimant.dateofbirth.Year, le.claimant.dateofbirth.Month, le.claimant.dateofbirth.Day));
		SELF.claimant.dataassociationdate := CleanDate(iESP2Date(le.claimant.dataassociationdate.Year, le.claimant.dataassociationdate.Month, le.claimant.dataassociationdate.Day));
		SELF.claimant.dateofdeath := CleanDate(iESP2Date(le.claimant.dateofdeath.Year, le.claimant.dateofdeath.Month, le.claimant.dateofdeath.Day));
		SELF.additionalname1.dateofbirth := CleanDate(iESP2Date(le.additionalname1.dateofbirth.Year, le.additionalname1.dateofbirth.Month, le.additionalname1.dateofbirth.Day));
		SELF.additionalname1.dataassociationdate := CleanDate(iESP2Date(le.additionalname1.dataassociationdate.Year, le.additionalname1.dataassociationdate.Month, le.additionalname1.dataassociationdate.Day));
		SELF.additionalname1.dateofdeath := CleanDate(iESP2Date(le.additionalname1.dateofdeath.Year, le.additionalname1.dateofdeath.Month, le.additionalname1.dateofdeath.Day));
		SELF.additionalname2.dateofbirth := CleanDate(iESP2Date(le.additionalname2.dateofbirth.Year, le.additionalname2.dateofbirth.Month, le.additionalname2.dateofbirth.Day));
		SELF.additionalname2.dataassociationdate := CleanDate(iESP2Date(le.additionalname2.dataassociationdate.Year, le.additionalname2.dataassociationdate.Month, le.additionalname2.dataassociationdate.Day));
		SELF.additionalname2.dateofdeath := CleanDate(iESP2Date(le.additionalname2.dateofdeath.Year, le.additionalname2.dateofdeath.Month, le.additionalname2.dateofdeath.Day));
		SELF.additionalname3.dateofbirth := CleanDate(iESP2Date(le.additionalname3.dateofbirth.Year, le.additionalname3.dateofbirth.Month, le.additionalname3.dateofbirth.Day));
		SELF.additionalname3.dataassociationdate := CleanDate(iESP2Date(le.additionalname3.dataassociationdate.Year, le.additionalname3.dataassociationdate.Month, le.additionalname3.dataassociationdate.Day));
		SELF.additionalname3.dateofdeath := CleanDate(iESP2Date(le.additionalname3.dateofdeath.Year, le.additionalname3.dateofdeath.Month, le.additionalname3.dateofdeath.Day));
		SELF.address.datefirstseen := CleanDate(iESP2Date(le.address.datefirstseen.Year, le.address.datefirstseen.Month, le.address.datefirstseen.Day));
		SELF.address.datelastseen := CleanDate(iESP2Date(le.address.datelastseen.Year, le.address.datelastseen.Month, le.address.datelastseen.Day));
		SELF.address.dataassodate := CleanDate(iESP2Date(le.address.dataassodate.Year, le.address.dataassodate.Month, le.address.dataassodate.Day));
		SELF.telephone.dataassociationdate := CleanDate(iESP2Date(le.telephone.dataassociationdate.Year, le.telephone.dataassociationdate.Month, le.telephone.dataassociationdate.Day));
		SELF.Payments := PROJECT(le.Payments, TRANSFORM(propertyt_claimpaymentrecordreport, SELF.RecordIdentifier := recIdentifier; SELF.ClaimIDRecordCounter := cntr; SELF.PaymentRecordCounter := COUNTER; SELF.SectionIdentifier := secIdentifier; SELF := LEFT));
		
		SELF := le;
	END;
	
	CD_Property_Response cleanCDProperty(KELBlackBox.FileCDProperty le) := TRANSFORM
		SELF.RecordIdentifier := le.RecID;
		SELF.ReportIdSection.reportrequestid.dateoforder := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateoforder.Year, le.ReportIdSection.reportrequestid.dateoforder.Month, le.ReportIdSection.reportrequestid.dateoforder.Day));
		SELF.ReportIdSection.reportrequestid.dateofreceipt := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateofreceipt.Year, le.ReportIdSection.reportrequestid.dateofreceipt.Month, le.ReportIdSection.reportrequestid.dateofreceipt.Day));
		SELF.ReportIdSection.reportrequestid.dateofcompletion := CleanDate(iESP2Date(le.ReportIdSection.reportrequestid.dateofcompletion.Year, le.ReportIdSection.reportrequestid.dateofcompletion.Month, le.ReportIdSection.reportrequestid.dateofcompletion.Day));
		SELF.ReportIdSection.reportidsupplementa.relatedprocessingdate := CleanDate(iESP2Date(le.ReportIdSection.reportidsupplementa.relatedprocessingdate.Year, le.ReportIdSection.reportidsupplementa.relatedprocessingdate.Month, le.ReportIdSection.reportidsupplementa.relatedprocessingdate.Day));
		SELF.searchinformationsection.subjectidset := PROJECT(le.searchinformationsection.subjectidset, cleanSubjectIDSectionProperty(LEFT, le.RecID, COUNTER));
		SELF.searchinformationsection.policy.fromdate := CleanDate(iESP2Date(le.searchinformationsection.policy.fromdate.Year, le.searchinformationsection.policy.fromdate.Month, le.searchinformationsection.policy.fromdate.Day));
		SELF.searchinformationsection.policy.todate := CleanDate(iESP2Date(le.searchinformationsection.policy.todate.Year, le.searchinformationsection.policy.todate.Month, le.searchinformationsection.policy.todate.Day));
		SELF.searchinformationsection.policy.inceptiondate := CleanDate(iESP2Date(le.searchinformationsection.policy.inceptiondate.Year, le.searchinformationsection.policy.inceptiondate.Month, le.searchinformationsection.policy.inceptiondate.Day));
		SELF.searchinformationsection.policy.cancellationdate := CleanDate(iESP2Date(le.searchinformationsection.policy.cancellationdate.Year, le.searchinformationsection.policy.cancellationdate.Month, le.searchinformationsection.policy.cancellationdate.Day));
		SELF.searchinformationsection.policy.lapseloaddate := CleanDate(iESP2Date(le.searchinformationsection.policy.lapseloaddate.Year, le.searchinformationsection.policy.lapseloaddate.Month, le.searchinformationsection.policy.lapseloaddate.Day));
		SELF.searchinformationsection.policy.lapselastcanceldate := CleanDate(iESP2Date(le.searchinformationsection.policy.lapselastcanceldate.Year, le.searchinformationsection.policy.lapselastcanceldate.Month, le.searchinformationsection.policy.lapselastcanceldate.Day));
		SELF.searchinformationsection.policy.type := le.searchinformationsection.policy._type;
		SELF.searchinformationsection.riskaddress.datefirstseen := CleanDate(iESP2Date(le.searchinformationsection.riskaddress.datefirstseen.Year, le.searchinformationsection.riskaddress.datefirstseen.Month, le.searchinformationsection.riskaddress.datefirstseen.Day));
		SELF.searchinformationsection.riskaddress.datelastseen := CleanDate(iESP2Date(le.searchinformationsection.riskaddress.datelastseen.Year, le.searchinformationsection.riskaddress.datelastseen.Month, le.searchinformationsection.riskaddress.datelastseen.Day));
		SELF.searchinformationsection.riskaddress.dataassodate := CleanDate(iESP2Date(le.searchinformationsection.riskaddress.dataassodate.Year, le.searchinformationsection.riskaddress.dataassodate.Month, le.searchinformationsection.riskaddress.dataassodate.Day));
		SELF.searchinformationsection.residenceaddress.datefirstseen := CleanDate(iESP2Date(le.searchinformationsection.residenceaddress.datefirstseen.Year, le.searchinformationsection.residenceaddress.datefirstseen.Month, le.searchinformationsection.residenceaddress.datefirstseen.Day));
		SELF.searchinformationsection.residenceaddress.datelastseen := CleanDate(iESP2Date(le.searchinformationsection.residenceaddress.datelastseen.Year, le.searchinformationsection.residenceaddress.datelastseen.Month, le.searchinformationsection.residenceaddress.datelastseen.Day));
		SELF.searchinformationsection.residenceaddress.dataassodate := CleanDate(iESP2Date(le.searchinformationsection.residenceaddress.dataassodate.Year, le.searchinformationsection.residenceaddress.dataassodate.Month, le.searchinformationsection.residenceaddress.dataassodate.Day));
		SELF.searchinformationsection.mailingaddress.datefirstseen := CleanDate(iESP2Date(le.searchinformationsection.mailingaddress.datefirstseen.Year, le.searchinformationsection.mailingaddress.datefirstseen.Month, le.searchinformationsection.mailingaddress.datefirstseen.Day));
		SELF.searchinformationsection.mailingaddress.datelastseen := CleanDate(iESP2Date(le.searchinformationsection.mailingaddress.datelastseen.Year, le.searchinformationsection.mailingaddress.datelastseen.Month, le.searchinformationsection.mailingaddress.datelastseen.Day));
		SELF.searchinformationsection.mailingaddress.dataassodate := CleanDate(iESP2Date(le.searchinformationsection.mailingaddress.dataassodate.Year, le.searchinformationsection.mailingaddress.dataassodate.Month, le.searchinformationsection.mailingaddress.dataassodate.Day));
		SELF.searchinformationsection.formeraddress.datefirstseen := CleanDate(iESP2Date(le.searchinformationsection.formeraddress.datefirstseen.Year, le.searchinformationsection.formeraddress.datefirstseen.Month, le.searchinformationsection.formeraddress.datefirstseen.Day));
		SELF.searchinformationsection.formeraddress.datelastseen := CleanDate(iESP2Date(le.searchinformationsection.formeraddress.datelastseen.Year, le.searchinformationsection.formeraddress.datelastseen.Month, le.searchinformationsection.formeraddress.datelastseen.Day));
		SELF.searchinformationsection.formeraddress.dataassodate := CleanDate(iESP2Date(le.searchinformationsection.formeraddress.dataassodate.Year, le.searchinformationsection.formeraddress.dataassodate.Month, le.searchinformationsection.formeraddress.dataassodate.Day));
		SELF.claimhistoryrisksection.claimset := PROJECT(le.claimhistoryrisksection.claimset, cleanClaimSetProperty(LEFT, le.RecID, COUNTER, le.claimhistoryrisksection.reportsectionheader.sectionidentifier));
		SELF.claimhistoryinsuredsection.claimset := PROJECT(le.claimhistoryinsuredsection.claimset, cleanClaimSetProperty(LEFT, le.RecID, COUNTER, le.claimhistoryinsuredsection.reportsectionheader.sectionidentifier));
		
		SELF := le;
	END;
// --------------- Clean - CD Property ---------------
EXPORT FileCDPropertyCleaned := PROJECT(SORT(KELBlackBox.FileCDProperty, RECORD), cleanCDProperty(left));
	
// --------------- Normalize - CD Property ---------------
EXPORT FileCDPropertySubjectID := NORMALIZE(FileCDPropertyCleaned, LEFT.searchinformationsection.subjectidset, TRANSFORM(propertyt_subjectidsetcdpropertyreport, SELF := RIGHT));
	
	EXPORT FileCDPropertyRiskClaim := NORMALIZE(FileCDPropertyCleaned, LEFT.claimhistoryrisksection.claimset, TRANSFORM(propertyt_claimsetcdpropertyreport, SELF := RIGHT));
	EXPORT FileCDPropertyRiskClaimPayments := NORMALIZE(FileCDPropertyRiskClaim, LEFT.Payments, TRANSFORM(propertyt_claimpaymentrecordreport, SELF := RIGHT));
	EXPORT FileCDPropertyRiskClaimPaymentsFlat := NORMALIZE(FileCDPropertyRiskClaimPayments, 5, TRANSFORM({UNSIGNED8 RecordIdentifier, UNSIGNED8 ClaimIDRecordCounter, STRING5 SectionIdentifier, STRING4 RecordCode, STRING2 RecordOccurrA, STRING2 RecordOccurrB, STRING5 ClaimCatType, STRING9 ClaimCatAmount, STRING2 ClaimCatDisp},
              SELF.ClaimCatType := CASE(COUNTER,
                     1 => LEFT.ClaimCat1Type,
                     2 => LEFT.ClaimCat2Type,
                     3 => LEFT.ClaimCat3Type,
                     4 => LEFT.ClaimCat4Type,
                     5 => LEFT.ClaimCat5Type, '');
              SELF.ClaimCatAmount := CASE(COUNTER,
                     1 => LEFT.ClaimCat1Amount,
                     2 => LEFT.ClaimCat2Amount,
                     3 => LEFT.ClaimCat3Amount,
                     4 => LEFT.ClaimCat4Amount,
                     5 => LEFT.ClaimCat5Amount, '');
              SELF.ClaimCatDisp := CASE(COUNTER,
                     1 => LEFT.ClaimCat1Disp,
                     2 => LEFT.ClaimCat2Disp,
                     3 => LEFT.ClaimCat3Disp,
                     4 => LEFT.ClaimCate4Disp,
                     5 => LEFT.ClaimCat5Disp, '');
              SELF := LEFT))(ClaimCatType != '');
	
	EXPORT FileCDPropertyInsuredClaim := NORMALIZE(FileCDPropertyCleaned, LEFT.claimhistoryinsuredsection.claimset, TRANSFORM(propertyt_claimsetcdpropertyreport, SELF := RIGHT));
	EXPORT FileCDPropertyInsuredClaimPayments := NORMALIZE(FileCDPropertyInsuredClaim, LEFT.Payments, TRANSFORM(propertyt_claimpaymentrecordreport, SELF := RIGHT));
	EXPORT FileCDPropertyInsuredClaimPaymentsFlat := NORMALIZE(FileCDPropertyInsuredClaimPayments, 5, TRANSFORM({UNSIGNED8 RecordIdentifier, UNSIGNED8 ClaimIDRecordCounter, STRING5 SectionIdentifier, STRING4 RecordCode, STRING2 RecordOccurrA, STRING2 RecordOccurrB, STRING5 ClaimCatType, STRING9 ClaimCatAmount, STRING2 ClaimCatDisp},
              SELF.ClaimCatType := CASE(COUNTER,
                     1 => LEFT.ClaimCat1Type,
                     2 => LEFT.ClaimCat2Type,
                     3 => LEFT.ClaimCat3Type,
                     4 => LEFT.ClaimCat4Type,
                     5 => LEFT.ClaimCat5Type, '');
              SELF.ClaimCatAmount := CASE(COUNTER,
                     1 => LEFT.ClaimCat1Amount,
                     2 => LEFT.ClaimCat2Amount,
                     3 => LEFT.ClaimCat3Amount,
                     4 => LEFT.ClaimCat4Amount,
                     5 => LEFT.ClaimCat5Amount, '');
              SELF.ClaimCatDisp := CASE(COUNTER,
                     1 => LEFT.ClaimCat1Disp,
                     2 => LEFT.ClaimCat2Disp,
                     3 => LEFT.ClaimCat3Disp,
                     4 => LEFT.ClaimCate4Disp,
                     5 => LEFT.ClaimCat5Disp, '');
              SELF := LEFT))(ClaimCatType != '');
END;