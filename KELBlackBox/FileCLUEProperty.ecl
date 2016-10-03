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

t_reportidsectioncluepropertyv2report := RECORD
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

t_generalmessagessectioncluepropertyv2report := RECORD
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

t_subjectidsetcluepropertyv2report := RECORD
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

t_searchinformationsectioncluepropertyv2report := RECORD
   DATASET(t_subjectidsetcluepropertyv2report) subjectidset{xpath('SubjectIdSet/SubjectId'), maxcount(2)};
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

t_consumernarrativesubsetcluepropertyv2report := RECORD
     t_consumernarrativerecordreport _header{xpath('Header')};
     DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(3)};
    END;

t_agentclaimsetcluepropertyv2report := RECORD
    t_claiminforecordreport claiminfo{xpath('ClaimInfo')};
    DATASET(t_claimpaymentrecordreport) payments{xpath('Payments/ClaimPaymen'), maxcount(6)};
    t_policyrecordreport policy{xpath('Policy')};
    DATASET(t_consumernarrativesubsetcluepropertyv2report) consumernarrativesets{xpath('ConsumerNarrativeSets/ConsumerNarrativeSet'), maxcount(2)};
   END;

t_claimhistory_agentsectioncluepropertyv2report := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_agentclaimsetcluepropertyv2report) claimsets{xpath('ClaimSets/ClaimSet'), maxcount(50)};
  END;

t_claimsetcluepropertyreport := RECORD
    t_claiminforecordreport claiminfo{xpath('ClaimInfo')};
    DATASET(t_claimpaymentrecordreport) payments{xpath('Payments/ClaimPayment'), maxcount(6)};
    t_policyrecordreport policy{xpath('Policy')};
    t_personrecordreport riskperson{xpath('RiskPerson')};
    t_personrecordreport claimant{xpath('Claimant')};
    t_personrecordreport additionalname1{xpath('AdditionalName1')};
    t_personrecordreport additionalname2{xpath('AdditionalName2')};
    t_personrecordreport additionalname3{xpath('AdditionalName3')};
    t_addressrecordreport address{xpath('Address')};
    t_telephonerecordreport telephone{xpath('Telephone')};
    t_mortgagerecordreport mortgage{xpath('Mortgage')};
    DATASET(t_consumernarrativesubsetcluepropertyv2report) consumernarrativesets{xpath('ConsumerNarrativeSets/ConsumerNarrativeSet'), maxcount(2)};
   END;

t_claimhistory_risksectioncluepropertyv2report := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_claimsetcluepropertyreport) claimset{xpath('ClaimSet/Claim'), maxcount(25)};
  END;

t_claimhistory_insuredsectioncluepropertyv2report := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_claimsetcluepropertyreport) claimsets{xpath('ClaimSets/ClaimSet'), maxcount(25)};
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

t_inquiryhistorysectioncluepropertyv2report := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_inquiryhistoryheaderrecordreport) histories{xpath('Histories/InquiryHistoryHeader'), maxcount(25)};
  END;

CLUE_Property_Response := RECORD
  t_insurancexmlinfo xmlinfo{xpath('XmlInfo')};
  t_reportidsectioncluepropertyv2report reportidsection{xpath('ReportIdSection')};
  t_generalmessagessectioncluepropertyv2report generalmessagessection{xpath('GeneralMessagesSection')};
  t_searchinformationsectioncluepropertyv2report searchinformationsection{xpath('SearchInformationSection')};
  t_claimhistory_agentsectioncluepropertyv2report claimhistoryagentsection{xpath('ClaimHistoryAgentSection')};
  t_claimhistory_risksectioncluepropertyv2report claimhistoryrisksection{xpath('ClaimHistoryRiskSection')};
  t_claimhistory_insuredsectioncluepropertyv2report claimhistoryinsuredsection{xpath('ClaimHistoryInsuredSection')};
  t_inquiryhistorysectioncluepropertyv2report inquiryhistorysection{xpath('InquiryHistorySection')};
  t_generalmessagessectioncluepropertyv2report additionalinformationsection{xpath('AdditionalInformationSection')};
  DATASET(t_generalmessagessectioncluepropertyv2report) attachedproductssections{xpath('AttachedProductsSections/AttachedProductsSection'), maxcount(10)};
  string errorcode;
  integer8 transaction_time{xpath('_call_latency_ms')};
 END;

// Run this file for a 1,000,000 record sample during development
EXPORT FileCLUEProperty := DATASET('~thor::sv::clueproperty_poc::response::file1', CLUE_Property_Response, THOR);

// TEMP: Remove this part once the Superfile is ready
// EXPORT FileCLUEProperty := DATASET('~thor::sv::clueproperty_poc::response::file1', CLUE_Property_Response, THOR)       +
// DATASET('~thor::sv::clueproperty_poc::response::file2', CLUE_Property_Response, THOR)       +
// DATASET('~thor::sv::clueproperty_poc::response::file3', CLUE_Property_Response, THOR)       +
// DATASET('~thor::sv::clueproperty_poc::response::file4', CLUE_Property_Response, THOR)       +
// DATASET('~thor::sv::clueproperty_poc::response::file5', CLUE_Property_Response, THOR)       +
// DATASET('~thor::sv::clueproperty_poc::response::file6', CLUE_Property_Response, THOR)       +
// DATASET('~thor::sv::clueproperty_poc::response::file7', CLUE_Property_Response, THOR)       +
// DATASET('~thor::sv::clueproperty_poc::response::file8', CLUE_Property_Response, THOR)       +
// DATASET('~thor::sv::clueproperty_poc::response::file9', CLUE_Property_Response, THOR)       +
// DATASET('~thor::sv::clueproperty_poc::response::file10', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file11', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file12', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file13', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file14', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file15', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file16', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file17', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file18', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file19', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file20', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file21', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file22', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file23', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file24', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file25', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file26', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file27', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file28', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file29', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file30', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file31', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file32', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file33', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file34', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file35', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file36', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file37', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file38', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file39', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file40', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file41', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file42', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file43', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file44', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file45', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file46', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file47', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file48', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file49', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file50', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file51', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file52', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file53', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file54', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file55', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file56', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file57', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file58', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file59', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file60', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file61', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file62', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file63', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file64', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file65', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file66', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file67', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file68', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file69', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file70', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file71', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file72', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file73', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file74', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file75', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file76', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file77', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file78', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file79', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file80', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file81', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file82', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file83', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file84', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file85', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file86', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file87', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file88', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file89', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file90', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file91', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file92', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file93', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file94', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file95', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file96', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file97', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file98', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file99', CLUE_Property_Response, THOR)      +
// DATASET('~thor::sv::clueproperty_poc::response::file100', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file101', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file102', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file103', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file104', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file105', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file106', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file107', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file108', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file109', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file110', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file111', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file112', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file113', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file114', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file115', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file116', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file117', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file118', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file119', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file120', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file121', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file122', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file123', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file124', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file125', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file126', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file127', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file128', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file129', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file130', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file131', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file132', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file133', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file134', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file135', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file136', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file137', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file138', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file139', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file140', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file141', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file142', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file143', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file144', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file145', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file146', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file147', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file148', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file149', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file150', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file151', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file152', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file153', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file154', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file155', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file156', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file157', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file158', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file159', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file160', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file161', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file162', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file163', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file164', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file165', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file166', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file167', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file168', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file169', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file170', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file171', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file172', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file173', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file174', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file175', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file176', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file177', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file178', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file179', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file180', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file181', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file182', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file183', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file184', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file185', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file186', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file187', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file188', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file189', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file190', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file191', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file192', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file193', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file194', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file195', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file196', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file197', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file198', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file199', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file200', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file201', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file202', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file203', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file204', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file205', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file206', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file207', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file208', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file209', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file210', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file211', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file212', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file213', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file214', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file215', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file216', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file217', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file218', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file219', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file220', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file221', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file222', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file223', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file224', CLUE_Property_Response, THOR)     +
// DATASET('~thor::sv::clueproperty_poc::response::file225', CLUE_Property_Response, THOR);

// Run this for the full file (Roughly 280 logical files in this superfile for ~280,000,000 records)
// EXPORT FileCLUEProperty := DATASET('~thor::sv::clueproperty_poc::response::final', CLUE_Auto_Response, THOR);