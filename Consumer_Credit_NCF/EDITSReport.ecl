export EDITSReport := MODULE
			
export t_AddressRecordReport := record //RecordCode[AL51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 GroupUsage {xpath('GroupUsage')}; //values['','Y','N','']
	string9 HouseNumber {xpath('HouseNumber')};
	string20 StreetName {xpath('StreetName')};
	string5 AptNumber {xpath('AptNumber')};
	string20 City {xpath('City')};
	string2 State {xpath('State')};
	string5 Zip {xpath('Zip')};
	string4 Zip4 {xpath('Zip4')};
	string2 YearsAtAddress {xpath('YearsAtAddress')};
	string2 MthsAtAddress {xpath('MthsAtAddress')};
	string8 DateFirstSeen {xpath('DateFirstSeen')};
	string8 DateLastSeen {xpath('DateLastSeen')};
	string1 FsiHouseNumber {xpath('FsiHouseNumber')};
	string1 FsiStreetName {xpath('FsiStreetName')};
	string1 FsiAptNumber {xpath('FsiAptNumber')};
	string1 FsiCity {xpath('FsiCity')};
	string1 FsiState {xpath('FsiState')};
	string1 FsiZip {xpath('FsiZip')};
	string1 FsiZip4 {xpath('FsiZip4')};
	string1 FsiYearsAtAddress {xpath('FsiYearsAtAddress')};
	string1 FsiMonthsAtAddress {xpath('FsiMonthsAtAddress')};
	string1 FsiDateFirstSeen {xpath('FsiDateFirstSeen')};
	string1 FsiDateLastSeen {xpath('FsiDateLastSeen')};
	string1 OwnrentIndicator {xpath('OwnrentIndicator')}; //values['R','O','B','']
	string15 CountyName {xpath('CountyName')};
	string8 DataAssoDate {xpath('DataAssoDate')};
	string1 DataSourceIndicator {xpath('DataSourceIndicator')};
	string2 TypeCode {xpath('TypeCode')};
	string10 CensusTract {xpath('CensusTract')};
end;
		
export t_BusinessAddressRecordReport := record //RecordCode[AL52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 GroupUsage {xpath('GroupUsage')}; //values['','Y','N','']
	string34 Line1 {xpath('Line1')};
	string34 Line2 {xpath('Line2')};
	string20 City {xpath('City')};
	string2 State {xpath('State')};
	string5 Zip {xpath('Zip')};
	string4 Zip4 {xpath('Zip4')};
	string20 County {xpath('County')};
end;
		
export t_ClaimInfoRecordReport := record //RecordCode[CL51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string8 ClaimDate {xpath('ClaimDate')};
	string2 ClaimAgeYears {xpath('ClaimAgeYears')};
	string2 ClaimAgeMonths {xpath('ClaimAgeMonths')};
	string2 ClaimType {xpath('ClaimType')};
	string2 ClaimDisposition {xpath('ClaimDisposition')};
	string20 ContributorClaimNumber {xpath('ContributorClaimNumber')};
	string16 ClaimFileNumber {xpath('ClaimFileNumber')};
	string1 ScopeOfClaim {xpath('ScopeOfClaim')};
	string1 AtFaultIndicator {xpath('AtFaultIndicator')};
	string8 FirstClaimPaymentDate {xpath('FirstClaimPaymentDate')};
	string8 LatestClaimPaymentDate {xpath('LatestClaimPaymentDate')};
	string1 LocationOfLoss {xpath('LocationOfLoss')};
	string5 ContributorAmbestNumber {xpath('ContributorAmbestNumber')};
	string8 DisputeClearanceDate {xpath('DisputeClearanceDate')};
	string1 VehicleOperatorIndicator {xpath('VehicleOperatorIndicator')}; //values['','Y','N','']
	string1 ClaimAssociationIndicator {xpath('ClaimAssociationIndicator')}; //values['P','V','']
	string1 PlcyhldrRelationshipIndicator {xpath('PlcyhldrRelationshipIndicator')}; //values['S','D','']
	string1 ClaimAddressMatchIndicator {xpath('ClaimAddressMatchIndicator')}; //values['Y','P','N','']
	string1 ClaimTelephoneMatchIndicator {xpath('ClaimTelephoneMatchIndicator')}; //values['','Y','N','']
	string1 ClaimSsnMatchIndicator {xpath('ClaimSsnMatchIndicator')}; //values['','Y','N','']
	string1 ClaimDlNumMatchIndicator {xpath('ClaimDlNumMatchIndicator')}; //values['','Y','N','']
	string5 ReservedClaimMatchIndicators {xpath('ReservedClaimMatchIndicators')};
	string1 PrcClaimMatchIndicator {xpath('PrcClaimMatchIndicator')};
end;
		
export t_ClaimPaymentRecordReport := record //RecordCode[CL55]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string5 ClaimCat1Type {xpath('ClaimCat1Type')}; //values['CO','BI','PD','PI','CP','MP','ME','UM','UN','TL','RR','OT','SP','QUAKE','FLOOD','MOVE','CONTA','FIRE','LIGHT','HAIL','WIND','WATER','FREEZ','THEFT','THFSC','VMM','SMOKE','PHYDA','SLIP','DOG','LIAB','MEDIC','MOLD','SINK','LAE','DAMAG','CRAFT','CREDT','EXTEN','DISAP','DISSC','WC','WEATH','APPL','ACCDL','COLL','FOROB','LIVES','GL','OTHER','IDTHF','']
	string9 ClaimCat1Amount {xpath('ClaimCat1Amount')};
	string2 ClaimCat1Disp {xpath('ClaimCat1Disp')};
	string5 ClaimCat2Type {xpath('ClaimCat2Type')}; //values['CO','BI','PD','PI','CP','MP','ME','UM','UN','TL','RR','OT','SP','QUAKE','FLOOD','MOVE','CONTA','FIRE','LIGHT','HAIL','WIND','WATER','FREEZ','THEFT','THFSC','VMM','SMOKE','PHYDA','SLIP','DOG','LIAB','MEDIC','MOLD','SINK','LAE','DAMAG','CRAFT','CREDT','EXTEN','DISAP','DISSC','WC','WEATH','APPL','ACCDL','COLL','FOROB','LIVES','GL','OTHER','IDTHF','']
	string9 ClaimCat2Amount {xpath('ClaimCat2Amount')};
	string2 ClaimCat2Disp {xpath('ClaimCat2Disp')};
	string5 ClaimCat3Type {xpath('ClaimCat3Type')}; //values['CO','BI','PD','PI','CP','MP','ME','UM','UN','TL','RR','OT','SP','QUAKE','FLOOD','MOVE','CONTA','FIRE','LIGHT','HAIL','WIND','WATER','FREEZ','THEFT','THFSC','VMM','SMOKE','PHYDA','SLIP','DOG','LIAB','MEDIC','MOLD','SINK','LAE','DAMAG','CRAFT','CREDT','EXTEN','DISAP','DISSC','WC','WEATH','APPL','ACCDL','COLL','FOROB','LIVES','GL','OTHER','IDTHF','']
	string9 ClaimCat3Amount {xpath('ClaimCat3Amount')};
	string2 ClaimCat3Disp {xpath('ClaimCat3Disp')};
	string5 ClaimCat4Type {xpath('ClaimCat4Type')}; //values['CO','BI','PD','PI','CP','MP','ME','UM','UN','TL','RR','OT','SP','QUAKE','FLOOD','MOVE','CONTA','FIRE','LIGHT','HAIL','WIND','WATER','FREEZ','THEFT','THFSC','VMM','SMOKE','PHYDA','SLIP','DOG','LIAB','MEDIC','MOLD','SINK','LAE','DAMAG','CRAFT','CREDT','EXTEN','DISAP','DISSC','WC','WEATH','APPL','ACCDL','COLL','FOROB','LIVES','GL','OTHER','IDTHF','']
	string9 ClaimCat4Amount {xpath('ClaimCat4Amount')};
	string2 ClaimCate4Disp {xpath('ClaimCate4Disp')};
	string5 ClaimCat5Type {xpath('ClaimCat5Type')}; //values['CO','BI','PD','PI','CP','MP','ME','UM','UN','TL','RR','OT','SP','QUAKE','FLOOD','MOVE','CONTA','FIRE','LIGHT','HAIL','WIND','WATER','FREEZ','THEFT','THFSC','VMM','SMOKE','PHYDA','SLIP','DOG','LIAB','MEDIC','MOLD','SINK','LAE','DAMAG','CRAFT','CREDT','EXTEN','DISAP','DISSC','WC','WEATH','APPL','ACCDL','COLL','FOROB','LIVES','GL','OTHER','IDTHF','']
	string9 ClaimCat5Amount {xpath('ClaimCat5Amount')};
	string2 ClaimCat5Disp {xpath('ClaimCat5Disp')};
end;
		
export t_ConsumerNarrativeRecordReport := record //RecordCode[CN51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string8 DateStmtFiled {xpath('DateStmtFiled')};
	string8 StmtPurgeDate {xpath('StmtPurgeDate')};
	string50 NameOfIndFiling {xpath('NameOfIndFiling')};
	string12 RelationshipToClaimant {xpath('RelationshipToClaimant')};
end;
		
export t_CreditReportSummaryRecordReport := record //RecordCode[CR51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string8 DateCreditFileEstbed {xpath('DateCreditFileEstbed')};
	string8 OldestOpeningDateOfTrade {xpath('OldestOpeningDateOfTrade')};
	string8 LatestReportingDateOfTrade {xpath('LatestReportingDateOfTrade')};
	string8 DateOfLatestFileActivity {xpath('DateOfLatestFileActivity')};
	string1 ReportIncludesBankruptcies {xpath('ReportIncludesBankruptcies')};
	string8 DateOfLatestBankruptcyv1 {xpath('DateOfLatestBankruptcyv1')};
	string1 ReportIncludesPublicRecords {xpath('ReportIncludesPublicRecords')};
	string1 ReportIncldsCollectionItems {xpath('ReportIncldsCollectionItems')};
	string1 RptIncludesConsumerStmnts {xpath('RptIncludesConsumerStmnts')};
	string7 HighCreditRangeLowAmount {xpath('HighCreditRangeLowAmount')};
	string7 HighCreditRangeHighAmount {xpath('HighCreditRangeHighAmount')};
	string3 TotalNumberOfTradeLines {xpath('TotalNumberOfTradeLines')};
	string2 NoOfAcctsWcurrentStatus0 {xpath('NoOfAcctsWcurrentStatus0')};
	string2 NoOfAcctsWcurrentStatus1 {xpath('NoOfAcctsWcurrentStatus1')};
	string2 NoOfAcctsWcurrentStatus2 {xpath('NoOfAcctsWcurrentStatus2')};
	string2 NoOfAcctsWcurrentStatus3 {xpath('NoOfAcctsWcurrentStatus3')};
	string2 NoOfAcctsWcurrentStatus4 {xpath('NoOfAcctsWcurrentStatus4')};
	string2 NoOfAcctsWcurrentStatus5 {xpath('NoOfAcctsWcurrentStatus5')};
	string2 NoOfAcctsWcurrentStatus7 {xpath('NoOfAcctsWcurrentStatus7')};
	string2 NoOfAcctsWcurrentStatus8 {xpath('NoOfAcctsWcurrentStatus8')};
	string2 NoOfAcctsWcurrentStatus9 {xpath('NoOfAcctsWcurrentStatus9')};
	string2 NoOfAcctsWcurrStatusBlank {xpath('NoOfAcctsWcurrStatusBlank')};
	string2 NoOfAcctsWhistStatus1 {xpath('NoOfAcctsWhistStatus1')};
	string2 NoOfAcctsWhistStatus2 {xpath('NoOfAcctsWhistStatus2')};
	string2 NoOfAcctsWhistStatus3 {xpath('NoOfAcctsWhistStatus3')};
	string2 NoOfAcctsWhistStatus4 {xpath('NoOfAcctsWhistStatus4')};
	string2 NoOfAcctsWhistStatus5 {xpath('NoOfAcctsWhistStatus5')};
	string2 NoOfAcctsWhistStatus7 {xpath('NoOfAcctsWhistStatus7')};
	string2 NoOfAcctsWhistStatus8 {xpath('NoOfAcctsWhistStatus8')};
	string2 NoOfAcctsWhistStatus9 {xpath('NoOfAcctsWhistStatus9')};
	string7 HighCreditTotalRevolving {xpath('HighCreditTotalRevolving')};
	string7 HighCreditOpenended {xpath('HighCreditOpenended')};
	string7 HighCreditInstallment {xpath('HighCreditInstallment')};
	string7 AmountOwedTotalRevolving {xpath('AmountOwedTotalRevolving')};
	string7 AmountOwedTotalOpenended {xpath('AmountOwedTotalOpenended')};
	string7 AmountOwedTotalInstallment {xpath('AmountOwedTotalInstallment')};
	string7 PastDueTotalRevolving {xpath('PastDueTotalRevolving')};
	string7 PastDueTotalOpenended {xpath('PastDueTotalOpenended')};
	string7 PastDueTotalInstallment {xpath('PastDueTotalInstallment')};
	string2 NinetydayInquiryHistoryCount {xpath('NinetydayInquiryHistoryCount')};
	string8 NinetydayInquiryHistoryDate {xpath('NinetydayInquiryHistoryDate')};
	string2 NumberOfRevolvingAccounts {xpath('NumberOfRevolvingAccounts')};
	string2 NumberOfOpenendedAccounts {xpath('NumberOfOpenendedAccounts')};
	string2 NumberOfInstallmentAccounts {xpath('NumberOfInstallmentAccounts')};
end;
		
export t_ContactInfoRecordReport := record //RecordCode[CT51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string50 NameOfContact {xpath('NameOfContact')};
	string1 OkToContact {xpath('OkToContact')}; //values['','Y','N','']
	string50 AddnlInfo {xpath('AddnlInfo')};
end;
		
export t_DriverLicenseRecordReport := record //RecordCode[DL51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['','CC','CL','CP','PC','PP','UK','']
	string25 LicenseNumber {xpath('LicenseNumber')};
	string2 State {xpath('State')};
	string1 FsiLicenseClass {xpath('FsiLicenseClass')};
	string1 FsiLicenseNumber {xpath('FsiLicenseNumber')};
	string1 FsiLicenseState {xpath('FsiLicenseState')};
	string10 _Type {xpath('Type')};
	string15 Restriction {xpath('Restriction')};
	string8 IssueDate {xpath('IssueDate')};
	string8 ExpDatev {xpath('ExpDatev')};
	string8 DataAssoDatev {xpath('DataAssoDatev')};
	string1 DataSourceIndicator {xpath('DataSourceIndicator')};
	string1 TypeIndicator {xpath('TypeIndicator')};
	string3 UnitNumber2 {xpath('UnitNumber2')};
end;
		
export t_BankruptcyRecordReport := record //RecordCode[FI61]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	// EDITS_Share.t_EDITSDate DateFiled {xpath('DateFiled')};
	string8 DateFiled {xpath('DateFiled')};
	string1 BankruptcyStatus {xpath('BankruptcyStatus')};
	string9 AssetsReported {xpath('AssetsReported')};
	string9 LiabilitiesReported {xpath('LiabilitiesReported')};
	// EDITS_Share.t_EDITSDate SatisfieddischargeDate {xpath('SatisfieddischargeDate')};
	string8 SatisfieddischargeDate {xpath('SatisfieddischargeDate')};
	string1 InfoSrc {xpath('InfoSrc')};
	string10 CourtNumber {xpath('CourtNumber')};
	string42 CaseNumber {xpath('CaseNumber')};
	string1 BankruptcyType {xpath('BankruptcyType')};
	string1 FilingType {xpath('FilingType')};
	string9 ExemptAmount {xpath('ExemptAmount')};
	string1 ConsumerDisputeFlag {xpath('ConsumerDisputeFlag')};
	string2 BankStatusCode {xpath('BankStatusCode')};
end;
		
export t_OtherIncomeRecordReport := record //RecordCode[FI71]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string8 DateReported {xpath('DateReported')};
	string8 DateVerified {xpath('DateVerified')};
	string7 Amount {xpath('Amount')};
	string40 IncomeSource {xpath('IncomeSource')};
	string1 InfoIndirectlyVerified {xpath('InfoIndirectlyVerified')};
end;
		
export t_FinancingRecordReport := record //RecordCode[FI72]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 InfoSrc {xpath('InfoSrc')};
	string8 DateFiled {xpath('DateFiled')};
	string10 ReportingCourtNumber {xpath('ReportingCourtNumber')};
	string42 CaseNumber {xpath('CaseNumber')};
	string2 IndustryCode {xpath('IndustryCode')};
	string8 MaturityDate {xpath('MaturityDate')};
end;
		
export t_PublicItemRecordReport := record //RecordCode[FI73]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['JI','MI','']
	string1 InfoSrc {xpath('InfoSrc')};
	// EDITS_Share.t_EDITSDate DateFiled {xpath('DateFiled')};
	string8 DateFiled {xpath('DateFiled')};
	string10 ReportingCourtNumber {xpath('ReportingCourtNumber')};
	string42 CaseNumber {xpath('CaseNumber')};
	string5 AmountInvolved {xpath('AmountInvolved')};
	string1 TypeOfRecorditem {xpath('TypeOfRecorditem')}; //values['A','B','F','I','M','X','S','J','']
	string8 DateSatisfied {xpath('DateSatisfied')};
	string1 StatusOfRecorditem {xpath('StatusOfRecorditem')}; //values['A','D','P','S','T','']
	// EDITS_Share.t_EDITSDate DateVerified {xpath('DateVerified')};
	string8 DateVerified {xpath('DateVerified')};
	string40 Defendant {xpath('Defendant')};
	string40 Plaintiff {xpath('Plaintiff')};
	// EDITS_Share.t_EDITSDate StatusDate {xpath('StatusDate')};
	string8 StatusDate {xpath('StatusDate')};
	string1 ConsumerDisputeFlag {xpath('ConsumerDisputeFlag')};
	string2 JudgementType {xpath('JudgementType')};
	string9 AmountInvolvedEnhanced {xpath('AmountInvolvedEnhanced')};
end;
		
export t_ForeclosureRecordReport := record //RecordCode[FI74]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 InfoSrc {xpath('InfoSrc')};
	string8 DateReported {xpath('DateReported')};
	string8 DateChecked {xpath('DateChecked')};
	string40 ReportingMemberNumbername {xpath('ReportingMemberNumbername')};
end;
		
export t_NonResponsibilityRecordReport := record //RecordCode[FI75]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 InfoSrc {xpath('InfoSrc')};
	string8 DateReported {xpath('DateReported')};
	string1 TypeOfPersonFiling {xpath('TypeOfPersonFiling')}; //values['S','O','B','']
end;
		
export t_TaxLienRecordReport := record //RecordCode[FI76]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 InfoSrc {xpath('InfoSrc')};
	// EDITS_Share.t_EDITSDate DateFiled {xpath('DateFiled')};
	string8 DateFiled {xpath('DateFiled')};
	string10 ReportingCourtNumber {xpath('ReportingCourtNumber')};
	string42 CaseNumber {xpath('CaseNumber')};
	string5 AmountOfLien {xpath('AmountOfLien')};
	string2 AcbCreditorClass {xpath('AcbCreditorClass')}; //values['VF','VS','VC','VZ','AS','BK','CA','CC','CH','CI','CL','CN','CO','CP','CR','CT','CY','DC','DO','DS','FE','GS','IC','JU','MA','MU','PC','PR','RD','SC','ST','SU','']
	// EDITS_Share.t_EDITSDate DateReleased {xpath('DateReleased')};.
	string8 DateReleased {xpath('DateReleased')};
	// EDITS_Share.t_EDITSDate DateVerified {xpath('DateVerified')};
	string8 DateVerified {xpath('DateVerified')};
	string1 ConsumerDisputeFlag {xpath('ConsumerDisputeFlag')};
	string9 LienEnhancedAmount {xpath('LienEnhancedAmount')};
end;
		
export t_FinancialCounselorRecordReport := record //RecordCode[FI77]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 InfoSrc {xpath('InfoSrc')};
	string8 DateReported {xpath('DateReported')};
	string10 ReportingMemberNumber {xpath('ReportingMemberNumber')};
	string5 AmountInvolved {xpath('AmountInvolved')};
	string8 DateChecked {xpath('DateChecked')};
	string8 DateSettled {xpath('DateSettled')};
	string1 CounselingStatusCode {xpath('CounselingStatusCode')}; //values['S','T','I','V','']
end;
		
export t_GarnishmentARecordReport := record //RecordCode[FI78]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['SJ','VI','']
	string1 InfoSrc {xpath('InfoSrc')};
	string8 DateReported {xpath('DateReported')};
	string8 DateSatisfied {xpath('DateSatisfied')};
	string8 DateChecked {xpath('DateChecked')};
	string10 ReportingCourtNumber {xpath('ReportingCourtNumber')};
	string42 CaseNumber {xpath('CaseNumber')};
	string5 AmountOfGarnishment {xpath('AmountOfGarnishment')};
end;
		
export t_GarnishmentBRecordReport := record //RecordCode[FI79]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string40 Plaintiff {xpath('Plaintiff')};
	string40 Garnishee {xpath('Garnishee')};
	string40 Defendant {xpath('Defendant')};
end;
		
export t_CheckingSavingsAccountRecordReport := record //RecordCode[FI80]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 InfoSrc {xpath('InfoSrc')};
	string8 DateReported {xpath('DateReported')};
	string1 AccountType {xpath('AccountType')};
	string10 ReportingMemberNumber {xpath('ReportingMemberNumber')};
	string7 Amount {xpath('Amount')};
	string8 DateOpened {xpath('DateOpened')};
	string1 ReasonCode {xpath('ReasonCode')};
end;
		
export t_CollectionRecordReport := record //RecordCode[FI81]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 InfoSrc {xpath('InfoSrc')};
	// EDITS_Share.t_EDITSDate DateReported {xpath('DateReported')};
	string8 DateReported {xpath('DateReported')};
	// EDITS_Share.t_EDITSDate DateAssigned {xpath('DateAssigned')};
	string8 DateAssigned {xpath('DateAssigned')};
	string10 ReportingMemberAgencyNumber {xpath('ReportingMemberAgencyNumber')};
	string15 ClientNameOrNumber {xpath('ClientNameOrNumber')};
	string20 AccountSerialNumber {xpath('AccountSerialNumber')};
	string1 EcoaCode {xpath('EcoaCode')};
	// EDITS_Share.t_EDITSDate DateOfLastActivity {xpath('DateOfLastActivity')};
	string8 DateOfLastActivity {xpath('DateOfLastActivity')};
	string5 OriginalAmount {xpath('OriginalAmount')};
	// EDITS_Share.t_EDITSDate DateOfBalance {xpath('DateOfBalance')};
	string8 DateOfBalance {xpath('DateOfBalance')};
	string5 BalanceAmount {xpath('BalanceAmount')};
	// EDITS_Share.t_EDITSDate StatusDate {xpath('StatusDate')};
	string8 StatusDate {xpath('StatusDate')};
	string1 CollectionItemStatus {xpath('CollectionItemStatus')}; //values['D','F','J','M','N','P','S','T','U','X','Z','']
	string20 CollectionItemStatusText {xpath('CollectionItemStatusText')};
	string2 KOB {xpath('KOB')};
	string30 MemberName {xpath('MemberName')};
	string9 PastDueAmount {xpath('PastDueAmount')};
	string2 OriginalCreditorClassificationCode {xpath('OriginalCreditorClassificationCode')};
	string1 ConsumerDisputeFlag {xpath('ConsumerDisputeFlag')};
	string2 AccountPurposeType {xpath('AccountPurposeType')};
	string2 ConsumerInformationIndicator {xpath('ConsumerInformationIndicator')};
	EDITS_Share.t_EDITSDate LastPaymentDate {xpath('LastPaymentDate')};
	EDITS_Share.t_EDITSDate FirstDelinquencyDate {xpath('FirstDelinquencyDate')};
	string9 OriginalAmountEnhanced {xpath('OriginalAmountEnhanced')};
	string9 BalanceAmountEnhanced {xpath('BalanceAmountEnhanced')};
end;
		
export t_CreditTradeHistoryRecordReport := record //RecordCode[FI90]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string10 ReportingMemberNumber {xpath('ReportingMemberNumber')};
	string50 MemberName {xpath('MemberName')};
	string1 TapeSupplierIndicator {xpath('TapeSupplierIndicator')}; //values['*',' ','']
	string8 TRDateReported {xpath('DateReported')};
	string8 DateAccountOpened {xpath('DateAccountOpened')};
	string7 HighestCreditAmount {xpath('HighestCreditAmount')};
	string4 Terms {xpath('Terms')};
	string7 AccountBalance {xpath('AccountBalance')};
	string6 PastDueAmount {xpath('PastDueAmount')};
	string1 AccountTypeCode {xpath('AccountTypeCode')};
	string1 CurrentRateCode {xpath('CurrentRateCode')};
	string2 MonthsReviewed {xpath('MonthsReviewed')};
	string1 AccountDesignatorCode {xpath('AccountDesignatorCode')};
	string20 AccountNumber {xpath('AccountNumber')};
	string2 ThirtydayCounter {xpath('ThirtydayCounter')};
	string2 SixtydayCounter {xpath('SixtydayCounter')};
	string2 NinetydayCounter {xpath('NinetydayCounter')};
	string1 PrevRateCode1 {xpath('PrevRateCode1')};
	string8 PrevRateDate1 {xpath('PrevRateDate1')};
	string1 PrevRateCode2 {xpath('PrevRateCode2')};
	string8 PrevRateDate2 {xpath('PrevRateDate2')};
	string1 PrevRateCode3 {xpath('PrevRateCode3')};
	string8 PrevRateDate3 {xpath('PrevRateDate3')};
	string8 DateOfLastActivity {xpath('DateOfLastActivity')};
	string3 ReservedForInternalScoringUse {xpath('ReservedForInternalScoringUse')};
	string25 PaymentHistory24Month {xpath('PaymentHistory24Month')};
end;
		
export t_NonMemberRecordReport := record //RecordCode[FI95]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string8 DateReported {xpath('DateReported')};
	string1 AccountTypeCode {xpath('AccountTypeCode')};
	string1 CurrentRateCode {xpath('CurrentRateCode')};
	string8 DateAccountOpened {xpath('DateAccountOpened')};
	string40 CustomerNarrative {xpath('CustomerNarrative')};
	string7 HighestCreditAmount {xpath('HighestCreditAmount')};
	string7 AccountBalance {xpath('AccountBalance')};
	string6 PastDueAmount {xpath('PastDueAmount')};
	string1 RateLessThanZero {xpath('RateLessThanZero')};
end;
		
export t_InquiryHistoryHeaderRecordReport := record //RecordCode[IH51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	// EDITS_Share.t_EDITSDate DateOfInquiry {xpath('DateOfInquiry')};
	string8 DateOfInquiry {xpath('DateOfInquiry')};
	string50 InquirerName {xpath('InquirerName')};
	string60 Quoteback {xpath('Quoteback')};
	string10 InquirerId {xpath('InquirerId')};
	string1 InfoSrc {xpath('InfoSrc')};
	string2 UnitClassification {xpath('UnitClassification')};
	string2 ReportUsage {xpath('ReportUsage')};
	string2 KOB {xpath('KOB')};
	string9 Amount {xpath('Amount')};
	string2 _Type {xpath('Type')};
	string8 Abbreviation {xpath('Abbreviation')};
	string4 Terms {xpath('Terms')};
end;
		
export t_ForeignBureauRecordReport := record //RecordCode[IS51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string8 DateReported {xpath('DateReported')};
	string2 Classification {xpath('Classification')}; //values['BP','CO','CS','FC','FM','FO','GN','LI','NR','TL','']
	string1 BureauCode {xpath('BureauCode')};
	string18 CityAndNarrative {xpath('CityAndNarrative')};
	string40 StateAndNarrative {xpath('StateAndNarrative')};
end;
		
export t_PersonalRecordReport := record //RecordCode[PE51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string30 PersonalRecordType {xpath('PersonalRecordType')};
	string1 PersonalRecordStatusInd {xpath('PersonalRecordStatusInd')};
	string15 PersonalRecord {xpath('PersonalRecord')};
	string8 PersonalRecordDate {xpath('PersonalRecordDate')};
	string25 PersonalRecordDescription {xpath('PersonalRecordDescription')};
	string10 SupplierId {xpath('SupplierId')};
	string8 DataContributedFromDate {xpath('DataContributedFromDate')};
	string8 DataContributedToDate {xpath('DataContributedToDate')};
end;

export t_CreditReportSummaryEnhancedInformationRecordReport := record //RecordCode[CR52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 BankruptcyPresence {xpath('BankruptcyPresence')};
	string1 PublicRecordPresence {xpath('PublicRecordPresence')};
	string1 CollectionPresence {xpath('CollectionPresence')};
	string1 MortgagePresence {xpath('MortgagePresence')};
	string7 MinCreditLimit {xpath('MinCreditLimit')};
	string7 MaxCreditLimit {xpath('MaxCreditLimit')};
	string7 MaxCreditAmount {xpath('MaxCreditAmount')};
	// EDITS_Share.t_EDITSDate LastDateReported {xpath('LastDateReported')};
	string8 LastDateReported {xpath('LastDateReported')};
	string3 InquiryNumber {xpath('InquiryNumber')};
	// EDITS_Share.t_EDITSDate MostRecentInquiryDate {xpath('MostRecentInquiryDate')};
	string8 MostRecentInquiryDate {xpath('MostRecentInquiryDate')};
	string3 CreditUtilization {xpath('CreditUtilization')};
	string3 OpenTradesNumber {xpath('OpenTradesNumber')};
	string7 TotalOpenTradeBalance {xpath('TotalOpenTradeBalance')};
	// EDITS_Share.t_EDITSDate MostRecentTradeDate {xpath('MostRecentTradeDate')};
	string8 MostRecentTradeDate {xpath('MostRecentTradeDate')};
	string4 OldestOpenTradeAge {xpath('OldestOpenTradeAge')};
end;		

export t_EnhancedCreditTradeHistoryRecordReport := record //RecordCode[FI91]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string2 KOB {xpath('KOB')};
	string2 AccountPurposeType {xpath('AccountPurposeType')};
	string10 CreditLimit {xpath('CreditLimit')};
	string9 ScheduledPaymentAmount {xpath('ScheduledPaymentAmount')};
	string1 MonthlyPaymentType {xpath('MonthlyPaymentType')};
	string9 ActualPaymentAmount {xpath('ActualPaymentAmount')};
	string2 DerogCounter {xpath('DerogCounter')};
	string2 OldHistoricalWorstRatingCode {xpath('OldHistoricalWorstRatingCode')};
	// EDITS_Share.t_EDITSDate OldHistoricalWorstRatingDate {xpath('OldHistoricalWorstRatingDate')};
	string8 OldHistoricalWorstRatingDate {xpath('OldHistoricalWorstRatingDate')};
	// EDITS_Share.t_EDITSDate StatusDate {xpath('StatusDate')};
	string8 StatusDate {xpath('StatusDate')};
	// EDITS_Share.t_EDITSDate LastPaymentDate {xpath('LastPaymentDate')};
	string8 LastPaymentDate {xpath('LastPaymentDate')};
	string1 ConsumerDisputeFlag {xpath('ConsumerDisputeFlag')};
	string1 PaymentFrequency {xpath('PaymentFrequency')};
	string2 ActivityDesignatorCode {xpath('ActivityDesignatorCode')};
	// EDITS_Share.t_EDITSDate ClosedDate {xpath('ClosedDate')};
	string8 ClosedDate {xpath('ClosedDate')};
	string10 ChargeOffAmount {xpath('ChargeOffAmount')};
	string2 StatusCode {xpath('StatusCode')};
	string2 AccountConditionCode {xpath('AccountConditionCode')};
	string2 ConsumerInformationIndicator {xpath('ConsumerInformationIndicator')};
	string18 MortgageID {xpath('MortgageID')};
	// EDITS_Share.t_EDITSDate DeferredPaymentStartDate {xpath('DeferredPaymentStartDate')};
	string8 DeferredPaymentStartDate {xpath('DeferredPaymentStartDate')};
	string9 DeferredPaymentAmount {xpath('DeferredPaymentAmount')};
	string9 BalloonPaymentAmount {xpath('BalloonPaymentAmount')};
	// EDITS_Share.t_EDITSDate BalloonPaymentDueDate {xpath('BalloonPaymentDueDate')};
	string8 BalloonPaymentDueDate {xpath('BalloonPaymentDueDate')};
	string2 CurrentRateCodeEnhanced {xpath('CurrentRateCodeEnhanced')};
	// EDITS_Share.t_EDITSDate LastActivityOrFirstDelinquencyDate {xpath('LastActivityOrFirstDelinquencyDate')};
	string8 LastActivityOrFirstDelinquencyDate {xpath('LastActivityOrFirstDelinquencyDate')};
	string1 MaximumDelinquencyCode {xpath('MaximumDelinquencyCode')};
	// EDITS_Share.t_EDITSDate MaximumDelinquencyDate {xpath('MaximumDelinquencyDate')};
	string8 MaximumDelinquencyDate {xpath('MaximumDelinquencyDate')};
end;

export t_FinancialPaymentPatternGridRecordReport := record //RecordCode[FI92]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	// EDITS_Share.t_EDITSDate PaymentPatternStartDate {xpath('PaymentPatternStartDate')};
	string8 PaymentPatternStartDate {xpath('PaymentPatternStartDate')};
	string48 FortyEightMonthPaymentHistory {xpath('FortyEightMonthPaymentHistory')};
	string36 AdditionalPaymentHistory {xpath('AdditionalPaymentHistory')};
end;

export t_FinancialTrendedDataRecordReport := record //RecordCode[FI93]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string6 TrendedDataDate1 {xpath('TrendedDataDate1')};
	string9 BalanceAmount1 {xpath('BalanceAmount1')};
	string9 LoanAmountOrCreditLimit1 {xpath('LoanAmountOrCreditLimit1')};
	string9 ScheduledPaymentAmount1 {xpath('ScheduledPaymentAmount1')};
	string9 ActualPaymentAmount1 {xpath('ActualPaymentAmount1')};
	// EDITS_Share.t_EDITSDate LastPaymentDate1 {xpath('LastPaymentDate1')};
	string8 LastPaymentDate1 {xpath('LastPaymentDate1')};
	string6 TrendedDataDate2 {xpath('TrendedDataDate2')};
	string9 BalanceAmount2 {xpath('BalanceAmount2')};
	string9 LoanAmountOrCreditLimit2 {xpath('LoanAmountOrCreditLimit2')};
	string9 ScheduledPaymentAmount2 {xpath('ScheduledPaymentAmount2')};
	string9 ActualPaymentAmount2 {xpath('ActualPaymentAmount2')};
	// EDITS_Share.t_EDITSDate LastPaymentDate2 {xpath('LastPaymentDate2')};
	string8 LastPaymentDate2 {xpath('LastPaymentDate2')};
	string6 TrendedDataDate3 {xpath('TrendedDataDate3')};
	string9 BalanceAmount3 {xpath('BalanceAmount3')};
	string9 LoanAmountOrCreditLimit3 {xpath('LoanAmountOrCreditLimit3')};
	string9 ScheduledPaymentAmount3 {xpath('ScheduledPaymentAmount3')};
	string9 ActualPaymentAmount3 {xpath('ActualPaymentAmount3')};
	// EDITS_Share.t_EDITSDate LastPaymentDate3 {xpath('LastPaymentDate3')};
	string8 LastPaymentDate3 {xpath('LastPaymentDate3')};
	string6 TrendedDataDate4 {xpath('TrendedDataDate4')};
	string9 BalanceAmount4 {xpath('BalanceAmount4')};
	string9 LoanAmountOrCreditLimit4 {xpath('LoanAmountOrCreditLimit4')};
	string9 ScheduledPaymentAmount4 {xpath('ScheduledPaymentAmount4')};
	string9 ActualPaymentAmount4 {xpath('ActualPaymentAmount4')};
	// EDITS_Share.t_EDITSDate LastPaymentDate4 {xpath('LastPaymentDate4')};
	string8 LastPaymentDate4 {xpath('LastPaymentDate4')};
end;
	
end;