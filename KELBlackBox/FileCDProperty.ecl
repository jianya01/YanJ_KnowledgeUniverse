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

t_reportidsupplementarecordreport := RECORD
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
    t_editsdate relatedprocessingdate{xpath('RelatedProcessingDate')};
    string4 specialnumericfield1{xpath('SpecialNumericField1')};
   END;

t_reportidentifierrecordreport := RECORD
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

t_unitquotebackrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string60 quoteback{xpath('Quoteback')};
   END;

t_requestorproducerrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string50 requestorname{xpath('RequestorName')};
   END;

t_reportidsectioncdpropertyreport := RECORD
   t_reportrequestidrecordreport reportrequestid{xpath('ReportRequestId')};
   t_reportidsupplementarecordreport reportidsupplementa{xpath('ReportIdSupplementA')};
   t_reportidentifierrecordreport reportidentifier{xpath('ReportIdentifier')};
   t_unitquotebackrecordreport unitquoteback{xpath('UnitQuoteback')};
   t_requestorproducerrecordreport requestorproducer{xpath('RequestorProducer')};
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

t_generalmessagessectioncdpropertyreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(999)};
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

t_telephonerecordreport := RECORD
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
     t_editsdate dataassociationdate{xpath('DataAssociationDate')};
     string1 datasourceindicator{xpath('DataSourceIndicator')};
    END;

t_subjectidsetcdpropertyreport := RECORD
    t_personrecordreport subject{xpath('Subject')};
    t_telephonerecordreport telephone{xpath('Telephone')};
   END;

t_policyrecordreport := RECORD
    string3 unitnumber{xpath('UnitNumber')};
    string3 groupsequencenumber{xpath('GroupSequenceNumber')};
    string4 recordcode{xpath('RecordCode')};
    string2 recordoccurra{xpath('RecordOccurrA')};
    string2 recordoccurrb{xpath('RecordOccurrB')};
    string2 classification{xpath('Classification')};
    string1 groupusage{xpath('GroupUsage')};
    string2 _type{xpath('Type')};
    string20 number{xpath('Number')};
    t_editsdate fromdate{xpath('FromDate')};
    t_editsdate todate{xpath('ToDate')};
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
    t_editsdate inceptiondate{xpath('InceptionDate')};
    t_editsdate cancellationdate{xpath('CancellationDate')};
    string7 premium{xpath('Premium')};
    string1 premiumpaymentplan{xpath('PremiumPaymentPlan')};
    string3 premiummethodofpayment{xpath('PremiumMethodOfPayment')};
    t_editsdate lapseloaddate{xpath('LapseLoadDate')};
    string3 lapsecounter{xpath('LapseCounter')};
    t_editsdate lapselastcanceldate{xpath('LapseLastCancelDate')};
    string12 holderpin{xpath('HolderPin')};
    string1 suppressionindicator{xpath('SuppressionIndicator')};
    string2 policystate{xpath('PolicyState')};
    string4 policycancell{xpath('PolicyCancell')};
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

t_mortgagerecordreport := RECORD
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

t_searchinformationsectioncdpropertyreport := RECORD
   DATASET(t_subjectidsetcdpropertyreport) subjectidset{xpath('SubjectIdSet/SubjectId'), maxcount(2)};
   t_policyrecordreport policy{xpath('Policy')};
   t_addressrecordreport riskaddress{xpath('RiskAddress')};
   t_addressrecordreport residenceaddress{xpath('ResidenceAddress')};
   t_addressrecordreport mailingaddress{xpath('MailingAddress')};
   t_addressrecordreport formeraddress{xpath('FormerAddress')};
   t_mortgagerecordreport mortgage{xpath('Mortgage')};
  END;

t_claiminforecordreport := RECORD
     string3 unitnumber{xpath('UnitNumber')};
     string3 groupsequencenumber{xpath('GroupSequenceNumber')};
     string4 recordcode{xpath('RecordCode')};
     string2 recordoccurra{xpath('RecordOccurrA')};
     string2 recordoccurrb{xpath('RecordOccurrB')};
     string2 classification{xpath('Classification')};
     t_editsdate claimdate{xpath('ClaimDate')};
     string2 claimageyears{xpath('ClaimAgeYears')};
     string2 claimagemonths{xpath('ClaimAgeMonths')};
     string2 claimtype{xpath('ClaimType')};
     string2 claimdisposition{xpath('ClaimDisposition')};
     string20 contributorclaimnumber{xpath('ContributorClaimNumber')};
     string16 claimfilenumber{xpath('ClaimFileNumber')};
     string1 scopeofclaim{xpath('ScopeOfClaim')};
     string1 atfaultindicator{xpath('AtFaultIndicator')};
     t_editsdate firstclaimpaymentdate{xpath('FirstClaimPaymentDate')};
     t_editsdate latestclaimpaymentdate{xpath('LatestClaimPaymentDate')};
     string1 locationofloss{xpath('LocationOfLoss')};
     string5 contributorambestnumber{xpath('ContributorAmbestNumber')};
     t_editsdate disputeclearancedate{xpath('DisputeClearanceDate')};
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

t_claimpaymentrecordreport := RECORD
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

t_consumernarrativerecordreport := RECORD
      string3 unitnumber{xpath('UnitNumber')};
      string3 groupsequencenumber{xpath('GroupSequenceNumber')};
      string4 recordcode{xpath('RecordCode')};
      string2 recordoccurra{xpath('RecordOccurrA')};
      string2 recordoccurrb{xpath('RecordOccurrB')};
      string2 classification{xpath('Classification')};
      t_editsdate datestmtfiled{xpath('DateStmtFiled')};
      t_editsdate stmtpurgedate{xpath('StmtPurgeDate')};
      string50 nameofindfiling{xpath('NameOfIndFiling')};
      string12 relationshiptoclaimant{xpath('RelationshipToClaimant')};
     END;

t_consumernarrativesubsetcdpropertyreport := RECORD
     t_consumernarrativerecordreport _header{xpath('Header')};
     DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(3)};
    END;

t_claimsetcdpropertyreport := RECORD
    t_claiminforecordreport claiminfo{xpath('ClaimInfo')};
    DATASET(t_claimpaymentrecordreport) payments{xpath('Payments/ClaimPayment'), maxcount(3)};
    t_policyrecordreport policy{xpath('Policy')};
    t_personrecordreport riskperson{xpath('RiskPerson')};
    t_personrecordreport claimant{xpath('Claimant')};
    t_personrecordreport additionalname1{xpath('AdditionalName1')};
    t_personrecordreport additionalname2{xpath('AdditionalName2')};
    t_personrecordreport additionalname3{xpath('AdditionalName3')};
    t_addressrecordreport address{xpath('Address')};
    t_telephonerecordreport telephone{xpath('Telephone')};
    t_mortgagerecordreport mortgage{xpath('Mortgage')};
    DATASET(t_consumernarrativesubsetcdpropertyreport) consumernarrativesubset{xpath('ConsumerNarrativeSubset/ConsumerNarrative'), maxcount(2)};
   END;

t_claimhistory_risksectioncdpropertyreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_claimsetcdpropertyreport) claimset{xpath('ClaimSet/ClaimSet'), maxcount(25)};
  END;

t_claimhistory_insuredsectioncdpropertyreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_claimsetcdpropertyreport) claimset{xpath('ClaimSet/Claim'), maxcount(25)};
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

t_inquiryhistorysectioncdpropertyreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_inquiryhistoryheaderrecordreport) history{xpath('History/InquiryHistory'), maxcount(25)};
  END;

t_additionalinformationsectioncdpropertyreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(1)};
  END;


CD_Property_Response := RECORD
  t_insurancexmlinfo xmlinfo{xpath('XmlInfo')};
  t_reportidsectioncdpropertyreport reportidsection{xpath('ReportIdSection')};
  t_generalmessagessectioncdpropertyreport generalmessagessection{xpath('GeneralMessagesSection')};
  t_searchinformationsectioncdpropertyreport searchinformationsection{xpath('SearchInformationSection')};
  t_claimhistory_risksectioncdpropertyreport claimhistoryrisksection{xpath('ClaimHistoryRiskSection')};
  t_claimhistory_insuredsectioncdpropertyreport claimhistoryinsuredsection{xpath('ClaimHistoryInsuredSection')};
  t_inquiryhistorysectioncdpropertyreport inquiryhistorysection{xpath('InquiryHistorySection')};
  t_additionalinformationsectioncdpropertyreport additionalinformationsection{xpath('AdditionalInformationSection')};
  DATASET(t_generalmessagessectioncdpropertyreport) attachedproductssections{xpath('AttachedProductsSections/AttachedProductsSection'), maxcount(10)};
  string errorcode;
  integer8 transaction_time{xpath('_call_latency_ms')};
 END;

finalCLDP := RECORD
	integer8 RecID;
	CD_Property_Response - errorcode - transaction_time;
END;

// Run this file for a 1,000,000 record sample during development
EXPORT FileCDProperty := PROJECT(DATASET('~thor::sv::cdscprop_poc::response::file1', CD_Property_Response, THOR), TRANSFORM(finalCLDP, SELF.RecID := COUNTER; SELF := LEFT));
// EXPORT FileCDProperty := PROJECT(DATASET('~thor::sv::cdscprop_poc::response::file_500sample1', CD_Property_Response, THOR), TRANSFORM(finalCLDP, SELF.RecID := COUNTER; SELF := LEFT));

// Run this for the full file (Roughly 280 logical files in this superfile for ~280,000,000 records)

// EXPORT FileCDProperty := DATASET('~thor::sv::cdscprop_poc::response::final_recid', finalCLDP, THOR);