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

t_reportidsectionclaimsdiscoveryautoreport := RECORD
   t_reportrequestidrecordreport reportrequestid{xpath('ReportRequestId')};
   t_reportidsupplementarecordreport reportidsupplementa{xpath('ReportIdSupplementA')};
   t_reportidentifierrecordreport reportidentifier{xpath('ReportIdentifier')};
   t_unitquotebackrecordreport unitquoteback{xpath('UnitQuoteback')};
   t_requestorproducerrecordreport requestorproducer{xpath('RequestorProducer')};
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

t_recapprocessingsectionclaimsdiscoveryautoreport := RECORD
   t_recapprocessingrecordreport inquiryrecap{xpath('InquiryRecap')};
   DATASET(t_recapprocessingrecordreport) unitrecap{xpath('UnitRecap/RecapProcessing'), maxcount(51)};
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

t_generalmessagessectionclaimsdiscoveryautoreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(999)};
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

t_groupsearchidsectionclaimsdiscoveryautoreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   t_addressrecordreport groupcurrentaddress{xpath('GroupCurrentAddress')};
   t_addressrecordreport groupprioraddress{xpath('GroupPriorAddress')};
   t_policyrecordreport grouppriorpolicy{xpath('GroupPriorPolicy')};
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

t_subjectidsetclaimsdiscoveryautoreport := RECORD
    t_personrecordreport subject{xpath('Subject')};
    t_unitquotebackrecordreport unitquoteback{xpath('UnitQuoteback')};
    t_addressrecordreport currentaddress{xpath('CurrentAddress')};
    t_addressrecordreport prioraddress{xpath('PriorAddress')};
    t_driverlicenserecordreport currentlicense{xpath('CurrentLicense')};
    t_driverlicenserecordreport priorlicense{xpath('PriorLicense')};
    t_policyrecordreport priorpolicy{xpath('PriorPolicy')};
   END;

t_subjectidsectionclaimsdiscoveryautoreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_subjectidsetclaimsdiscoveryautoreport) subjectidset{xpath('SubjectIdSet/SubjectId'), maxcount(50)};
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

t_vehicleidsetclaimsdiscoveryautoreport := RECORD
    t_vehiclerecordreport vehicle{xpath('Vehicle')};
    t_unitquotebackrecordreport unitquoteback{xpath('UnitQuoteback')};
   END;

t_vehicleidsectionclaimsdiscoveryautoreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_vehicleidsetclaimsdiscoveryautoreport) vehicleidset{xpath('VehicleIdSet/VehicleId'), maxcount(50)};
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

t_consumernarrativesubsetclaimsdiscoveryautoreport := RECORD
     t_consumernarrativerecordreport _header{xpath('Header')};
     DATASET(t_narrativearecordreport) messages{xpath('Messages/NarrativeA'), maxcount(3)};
    END;

t_claimsetclaimsdiscoveryautoreport := RECORD
    t_claiminforecordreport claiminfo{xpath('ClaimInfo')};
    t_policyrecordreport policy{xpath('Policy')};
    t_personrecordreport policyholder{xpath('PolicyHolder')};
    t_addressrecordreport address{xpath('Address')};
    t_driverlicenserecordreport driverslicense{xpath('DriversLicense')};
    t_personrecordreport vehicleoperator{xpath('VehicleOperator')};
    t_personrecordreport additionalname1{xpath('AdditionalName1')};
    t_personrecordreport additionalname2{xpath('AdditionalName2')};
    t_personrecordreport additionalname3{xpath('AdditionalName3')};
    t_vehiclerecordreport vehicle{xpath('Vehicle')};
    DATASET(t_claimpaymentrecordreport) payments{xpath('Payments/ClaimPayment'), maxcount(3)};
    DATASET(t_consumernarrativesubsetclaimsdiscoveryautoreport) consumernarrativesubset{xpath('ConsumerNarrativeSubset/ConsumerNarrative'), maxcount(2)};
   END;

t_claimhistory_subjectsectionclaimsdiscoveryautoreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_claimsetclaimsdiscoveryautoreport) claimset{xpath('ClaimSet/Claim'), maxcount(1250)};
  END;

t_additionaldriverdiscoverysetclaimsdiscoveryautoreport := RECORD
    t_personrecordreport driver{xpath('Driver')};
    t_driverlicenserecordreport driverslicense{xpath('DriversLicense')};
   END;

t_additionaldriverdiscoverysectionclaimsdiscoveryautoreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_additionaldriverdiscoverysetclaimsdiscoveryautoreport) additionaldriverdiscoveryset{xpath('AdditionalDriverDiscoverySet/AdditionalDriverDiscovery'), maxcount(10)};
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

t_inquiryhistorysectionclaimsdiscoveryautoreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   DATASET(t_inquiryhistoryheaderrecordreport) histories{xpath('Histories/InquiryHistoryHeader'), maxcount(1250)};
  END;

t_vehiclereportidsectionclaimsdiscoveryautoreport := RECORD
    t_reportrequestidrecordreport reportrequestid{xpath('ReportRequestId')};
    t_reportidsupplementarecordreport reportidsupplementa{xpath('ReportIdSupplementA')};
   END;

t_vehiclerecapprocessingsectionclaimsdiscoveryautoreport := RECORD
    t_recapprocessingrecordreport inquiryrecap{xpath('InquiryRecap')};
   END;

t_vehiclegeneralmessagessectionclaimsdiscoveryautoreport := RECORD
    t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
    DATASET(t_narrativearecordreport) message{xpath('Message/NarrativeA'), maxcount(99)};
   END;

t_vehicleinquiryownersectionclaimsdiscoveryautoreport := RECORD
    t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
    t_personrecordreport subject{xpath('Subject')};
    t_addressrecordreport currentaddress{xpath('CurrentAddress')};
   END;

t_vehiclesupplementarecordreport := RECORD
      string3 unitnumber{xpath('UnitNumber')};
      string3 groupsequencenumber{xpath('GroupSequenceNumber')};
      string4 recordcode{xpath('RecordCode')};
      string2 recordoccurra{xpath('RecordOccurrA')};
      string2 recordoccurrb{xpath('RecordOccurrB')};
      string2 classification{xpath('Classification')};
      t_editsdate registrationdate{xpath('RegistrationDate')};
      t_editsdate registrationexpirationdate{xpath('RegistrationExpirationDate')};
      t_editsdate purchasedate{xpath('PurchaseDate')};
      t_editsdate solddate{xpath('SoldDate')};
      t_editsdate titleissuedate{xpath('TitleIssueDate')};
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

t_vehiclesizecostrecordreport := RECORD
      string3 unitnumber{xpath('UnitNumber')};
      string3 groupsequencenumber{xpath('GroupSequenceNumber')};
      string4 recordcode{xpath('RecordCode')};
      string2 recordoccurra{xpath('RecordOccurrA')};
      string2 recordoccurrb{xpath('RecordOccurrB')};
      string5 baseprice{xpath('BasePrice')};
      string4 pricevariance{xpath('PriceVariance')};
      string5 shippingweight{xpath('ShippingWeight')};
      string2 weightvariance{xpath('WeightVariance')};
      string6 tires{xpath('Tires')};
      string14 carburetion{xpath('Carburetion')};
      string8 wheelbase{xpath('WheelBase')};
      string4 cidcc{xpath('CidCc')};
      string2 cylinders{xpath('Cylinders')};
      string11 cntryoforigin{xpath('CntryOfOrigin')};
      string11 fuel{xpath('Fuel')};
      string15 gvw{xpath('Gvw')};
      string4 tonrating1{xpath('TonRating1')};
      string4 tonrating2{xpath('TonRating2')};
      string1 wheels{xpath('Wheels')};
      string1 drivewheels{xpath('DriveWheels')};
      string1 cycles{xpath('Cycles')};
     END;

t_vehicleoriginalequipmentrecordreport := RECORD
      string3 unitnumber{xpath('UnitNumber')};
      string3 groupsequencenumber{xpath('GroupSequenceNumber')};
      string4 recordcode{xpath('RecordCode')};
      string2 recordoccurra{xpath('RecordOccurrA')};
      string2 recordoccurrb{xpath('RecordOccurrB')};
      string13 abs{xpath('Abs')};
      string8 airconditioning{xpath('AirConditioning')};
      string8 powersteering{xpath('PowerSteering')};
      string8 powerbrakes{xpath('PowerBrakes')};
      string8 powerwindows{xpath('PowerWindows')};
      string8 tiltwheel{xpath('TiltWheel')};
      string5 frontwheeldr{xpath('FrontWheelDr')};
      string5 fourwheeldrive{xpath('FourWheelDrive')};
      string8 security{xpath('Security')};
      string6 restraintsairbags{xpath('RestraintsAirBags')};
      string7 restraintsbelts{xpath('RestraintsBelts')};
     END;

t_vehicledevelopeddatasetclaimsdiscoveryautoreport := RECORD
     t_vehiclerecordreport vehiclerecord{xpath('VehicleRecord')};
     t_vehiclesupplementarecordreport vehiclesupplementa{xpath('VehicleSupplementA')};
     t_vehicledatarelationshiprecordreport vehicledatarelationship{xpath('VehicleDataRelationship')};
     t_vehiclesizecostrecordreport vehiclesizecost{xpath('VehicleSizeCost')};
     t_vehicleoriginalequipmentrecordreport vehicleoriginalequipment{xpath('VehicleOriginalEquipment')};
     DATASET(t_narrativearecordreport) message{xpath('Message/NarrativeA'), maxcount(5)};
    END;

t_vehicledevelopedsectionclaimsdiscoveryautoreport := RECORD
    t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
    DATASET(t_narrativearecordreport) message{xpath('Message/NarrativeA'), maxcount(99)};
    DATASET(t_vehicledevelopeddatasetclaimsdiscoveryautoreport) vehicledevelopeddataset{xpath('VehicleDevelopedDataSet/VehicleDevelopedData'), maxcount(25)};
   END;

t_vehicleinformationsectionclaimsdiscoveryautoreport := RECORD
   t_reportsectionheaderrecordreport reportsectionheader{xpath('ReportSectionHeader')};
   t_vehiclereportidsectionclaimsdiscoveryautoreport vehiclereportidsection{xpath('VehicleReportIdSection')};
   t_vehiclerecapprocessingsectionclaimsdiscoveryautoreport vehiclerecapprocessingsection{xpath('VehicleRecapProcessingSection')};
   t_vehiclegeneralmessagessectionclaimsdiscoveryautoreport vehiclegeneralmessagessection{xpath('VehicleGeneralMessagesSection')};
   t_vehicleinquiryownersectionclaimsdiscoveryautoreport vehicleinquiryownersection{xpath('VehicleInquiryOwnerSection')};
   t_vehicledevelopedsectionclaimsdiscoveryautoreport vehicledevelopedsection{xpath('VehicleDevelopedSection')};
  END;

CD_Auto_Response := RECORD
  t_insurancexmlinfo xmlinfo{xpath('XmlInfo')};
  t_reportidsectionclaimsdiscoveryautoreport reportidsection{xpath('ReportIdSection')};
  t_recapprocessingsectionclaimsdiscoveryautoreport recapprocessingsection{xpath('RecapProcessingSection')};
  t_generalmessagessectionclaimsdiscoveryautoreport generalmessagessection{xpath('GeneralMessagesSection')};
  t_groupsearchidsectionclaimsdiscoveryautoreport groupsearchidsection{xpath('GroupSearchIdSection')};
  t_subjectidsectionclaimsdiscoveryautoreport subjectidsection{xpath('SubjectIdSection')};
  t_vehicleidsectionclaimsdiscoveryautoreport vehicleidsection{xpath('VehicleIdSection')};
  t_claimhistory_subjectsectionclaimsdiscoveryautoreport claimhistorysubjectsection{xpath('ClaimHistorySubjectSection')};
  t_claimhistory_subjectsectionclaimsdiscoveryautoreport claimhistoryvehiclesection{xpath('ClaimHistoryVehicleSection')};
  t_claimhistory_subjectsectionclaimsdiscoveryautoreport claimhistorypossiblerelatedsection{xpath('ClaimHistoryPossibleRelatedSection')};
  t_additionaldriverdiscoverysectionclaimsdiscoveryautoreport additionaldriverdiscoverysection{xpath('AdditionalDriverDiscoverySection')};
  t_inquiryhistorysectionclaimsdiscoveryautoreport inquiryhistorysection{xpath('InquiryHistorySection')};
  t_generalmessagessectionclaimsdiscoveryautoreport additionalinformationsection{xpath('AdditionalInformationSection')};
  DATASET(t_generalmessagessectionclaimsdiscoveryautoreport) attachedproductssections{xpath('AttachedProductsSections/AttachedProductsSection'), maxcount(10)};
  t_vehicleinformationsectionclaimsdiscoveryautoreport vehicleinformationsection{xpath('VehicleInformationSection')};
  string errorcode;
  integer8 transaction_time{xpath('_call_latency_ms')};
 END;

finalCLDA := RECORD
	integer8 RecID;
	CD_Auto_Response - errorcode - transaction_time;
END;

// Run this file for a 1,000,000 record sample during development
EXPORT FileCDAuto := DATASET('~thor::sv::cdscauto_poc::response::file1_new', finalCLDA, THOR);

// Run this for the full file (Roughly 280 logical files in this superfile for ~280,000,000 records)
// EXPORT FileCDAuto := DATASET('~thor::sv::cdscauto_poc::response::final_recid', finalCLUE, THOR);