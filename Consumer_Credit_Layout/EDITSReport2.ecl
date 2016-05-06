export EDITSReport2 := MODULE
			
export t_MortgageRecordReport := record //RecordCode[ML51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string15 LoanNumber {xpath('LoanNumber')};
	string50 CompanyName {xpath('CompanyName')};
	string1 FsiLoanNumber {xpath('FsiLoanNumber')};
	string1 FsiCompanyName {xpath('FsiCompanyName')};
	string2 Classification {xpath('Classification')}; //values['TP','TC','DC','DP','']
	string1 MortgageType {xpath('MortgageType')}; //values['1','2','']
	string15 LoanAmt {xpath('LoanAmt')};
	string5 LoanTypeCode {xpath('LoanTypeCode')};
	string4 InterestRate {xpath('InterestRate')};
	string3 InterestRateTypeCode {xpath('InterestRateTypeCode')};
end;
		
export t_NarrativeARecordReport := record //RecordCode[NR51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['AR','DI','FD','GR','LH','LO','RO','SF','SI','SS','UP','AT','']
	string2 TypeRemarks {xpath('TypeRemarks')}; //values['A7','A8','AD','CC','CD','CH','CI','IH','MC','MD','MI','MT','NA','OE','PP','RC','RM','SC','SD','VR','Z8','Z7','Z6','Z5','A','TC','']
	string79 Remarks1 {xpath('Remarks1')};
	string79 Remarks2 {xpath('Remarks2')};
	string2 RemarksCode1 {xpath('RemarksCode1')};
	string2 RemarksCode2 {xpath('RemarksCode2')};
end;
		
export t_NarrativeBRecordReport := record //RecordCode[NR52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string5 NarrativeMessageCode {xpath('NarrativeMessageCode')};
	string79 RemarksLine1 {xpath('RemarksLine1')};
	string79 RemarksLine2 {xpath('RemarksLine2')};
end;
		
export t_OccupationCRecordReport := record //RecordCode[OE53]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['CE','E2','EF','ES','EW','PE','RS','WF','']
	string34 TypeOfPositionDesc {xpath('TypeOfPositionDesc')};
	string34 EmployerName {xpath('EmployerName')};
	string2 StateOfEmployment {xpath('StateOfEmployment')};
	string8 CityOfEmployment {xpath('CityOfEmployment')};
	string8 DateEmployed {xpath('DateEmployed')};
	string8 DateEmploymentVerified {xpath('DateEmploymentVerified')};
	string8 DateLeft {xpath('DateLeft')};
	string1 EmploymentIndirectlyVerified {xpath('EmploymentIndirectlyVerified')}; //values['','Y','N','']
	string7 MonthlySalary {xpath('MonthlySalary')};
end;
		
export t_PersonRecordReport := record //RecordCode[PI51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['','AL','AP','CD','CI','CO','CP','CS','CT','CV','DP','EM','FN','PO','RF','RS','SP','XX','']
	string4 Prefix {xpath('Prefix')};
	string28 Last {xpath('Last')};
	string20 First {xpath('First')};
	string15 Middle {xpath('Middle')};
	string3 Suffix {xpath('Suffix')};
	string8 DateOfBirth {xpath('DateOfBirth')};
	string3 Age {xpath('Age')};
	string1 Sex {xpath('Sex')}; //values['','M','F','U','']
	string9 SSN {xpath('SSN')};
	string1 HeightFeet {xpath('HeightFeet')};
	string2 HeightInches {xpath('HeightInches')};
	string3 Weight {xpath('Weight')};
	string1 Relationship {xpath('Relationship')}; //values['A','B','C','D','E','F','O','S','']
	string20 RelationshipDesc {xpath('RelationshipDesc')};
	string1 IndividualAddressAssociationInd {xpath('IndividualAddressAssociationInd')};
	string1 NameAssociationIndicator {xpath('NameAssociationIndicator')}; //values['P','V','']
	string8 DataAssociationDate {xpath('DataAssociationDate')};
	string1 MaritalStatus {xpath('MaritalStatus')}; //values['','D','M','S','U','W','X','']
	string1 FsiPrefix {xpath('FsiPrefix')};
	string1 FsiLast {xpath('FsiLast')};
	string1 FsiFirst {xpath('FsiFirst')};
	string1 FsiMiddle {xpath('FsiMiddle')};
	string1 FsiSuffix {xpath('FsiSuffix')};
	string1 FsiDateOfBirth {xpath('FsiDateOfBirth')};
	string1 FsiAge {xpath('FsiAge')};
	string1 FsiSex {xpath('FsiSex')};
	string1 FsiSSN {xpath('FsiSSN')};
	string1 FsiHeightFeet {xpath('FsiHeightFeet')};
	string1 FsiHeightInches {xpath('FsiHeightInches')};
	string1 FsiWeight {xpath('FsiWeight')};
	string1 FsiRelationship {xpath('FsiRelationship')};
	string1 FsiMaritalStatus {xpath('FsiMaritalStatus')};
	string1 FsiEyeColor {xpath('FsiEyeColor')};
	string1 FsiHairColor {xpath('FsiHairColor')};
	string1 SsnVerified {xpath('SsnVerified')}; //values['','Y','N','']
	string1 RaceCode {xpath('RaceCode')};
	string1 DataSourceIndicator {xpath('DataSourceIndicator')};
	string3 EyeColor {xpath('EyeColor')}; //values['','BLK','BLU','BRO','GRN','GRY','HAZ','MAR','MUL','PNK','XXX','']
	string3 HairColor {xpath('HairColor')}; //values['','BLK','BLN','BRO','GRY','RED','SDY','WHI','XXX','']
	string8 DateOfDeath {xpath('DateOfDeath')};
	string2 NumberOfDependents {xpath('NumberOfDependents')};
	string1 FraudAlertInd {xpath('FraudAlertInd')};
	string1 MultiPolicyInd {xpath('MultiPolicyInd')};
	string10 DateOfLoss {xpath('DateOfLoss')};
end;
		
export t_PersonalIdenitificationRecordReport := record //RecordCode[PI52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string30 Quoteback {xpath('Quoteback')};
	string2 SSNStateOfIssue {xpath('SSNStateOfIssue')};
	string4 SSNYearOfIssue {xpath('SSNYearOfIssue')};
	string4 SSNYearOfDeath {xpath('SSNYearOfDeath')};
	string2 SSNResidentStateOfDeath {xpath('SSNResidentStateOfDeath')};
end;
		
export t_PolicyRecordReport := record //RecordCode[PL51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['','CP','PP','AP','']
	string1 GroupUsage {xpath('GroupUsage')};
	string2 _Type {xpath('Type')};
	string20 Number {xpath('Number')};
	string8 FromDate {xpath('FromDate')};
	string8 ToDate {xpath('ToDate')};
	string5 IssuerIdNumber {xpath('IssuerIdNumber')};
	string20 IssuerName {xpath('IssuerName')};
	string1 FsiType {xpath('FsiType')};
	string1 FsiNumber {xpath('FsiNumber')};
	string1 FsiFromDate {xpath('FsiFromDate')};
	string1 FsiToDate {xpath('FsiToDate')};
	string1 FsiIssuerIdNumber {xpath('FsiIssuerIdNumber')};
	string1 FsiIssuerName {xpath('FsiIssuerName')};
	string1 Status {xpath('Status')};
	string1 LapseIndicator {xpath('LapseIndicator')}; //values['','Y','N','']
	string2 InsuranceType {xpath('InsuranceType')}; //values['PA','PP','CA','CP','']
	string5 NaicCode {xpath('NaicCode')};
	string1 RiskType {xpath('RiskType')}; //values['S','N','P','A','']
	string1 ConsumerStatementIndicator {xpath('ConsumerStatementIndicator')}; //values['','Y','N','']
	string1 ConsumerContributionIndicator {xpath('ConsumerContributionIndicator')}; //values['','Y','N','']
	string8 InceptionDate {xpath('InceptionDate')};
	string8 CancellationDate {xpath('CancellationDate')};
	string7 Premium {xpath('Premium')};
	string1 PremiumPaymentPlan {xpath('PremiumPaymentPlan')}; //values['A','B','C','D','E','F','Q','X','']
	string3 PremiumMethodOfPayment {xpath('PremiumMethodOfPayment')}; //values['CHK','ACH','CSH','CRC','XXX','']
	string8 LapseLoadDate {xpath('LapseLoadDate')};
	string3 LapseCounter {xpath('LapseCounter')};
	string8 LapseLastCancelDate {xpath('LapseLastCancelDate')};
	string12 HolderPin {xpath('HolderPin')};
	string1 SuppressionIndicator {xpath('SuppressionIndicator')};
	string2 PolicyState {xpath('PolicyState')};
	string4 PolicyCancell {xpath('PolicyCancell')};
end;
		
export t_RecapProcessingRecordReport := record //RecordCode[RC51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string2 SpecialField1Type {xpath('SpecialField1Type')};
	string1 SpecialField1Status {xpath('SpecialField1Status')};
	string7 SpecialField1Count {xpath('SpecialField1Count')};
	string2 SpecialField2Type {xpath('SpecialField2Type')};
	string1 SpecialField2Status {xpath('SpecialField2Status')};
	string7 SpecialField2Count {xpath('SpecialField2Count')};
	string2 SpecialField3Type {xpath('SpecialField3Type')};
	string1 SpecialField3Status {xpath('SpecialField3Status')};
	string7 SpecialField3Count {xpath('SpecialField3Count')};
	string2 SpecialField4Type {xpath('SpecialField4Type')};
	string1 SpecialField4Status {xpath('SpecialField4Status')};
	string7 SpecialField4Count {xpath('SpecialField4Count')};
	string2 SpecialField5Type {xpath('SpecialField5Type')};
	string1 SpecialField5Status {xpath('SpecialField5Status')};
	string7 SpecialField5Count {xpath('SpecialField5Count')};
	string2 SpecialField6Type {xpath('SpecialField6Type')};
	string1 SpecialField6Status {xpath('SpecialField6Status')};
	string7 SpecialField6Count {xpath('SpecialField6Count')};
	string2 SpecialField7Type {xpath('SpecialField7Type')};
	string1 SpecialField7Status {xpath('SpecialField7Status')};
	string7 SpecialField7Count {xpath('SpecialField7Count')};
	string2 SpecialField8Type {xpath('SpecialField8Type')};
	string1 SpecialField8Status {xpath('SpecialField8Status')};
	string7 SpecialField8Count {xpath('SpecialField8Count')};
	string2 SpecialField9Type {xpath('SpecialField9Type')};
	string1 SpecialField9Status {xpath('SpecialField9Status')};
	string7 SpecialField9Count {xpath('SpecialField9Count')};
	string2 SpecialField10Type {xpath('SpecialField10Type')};
	string1 SpecialField10Status {xpath('SpecialField10Status')};
	string7 SpecialField10Count {xpath('SpecialField10Count')};
	string2 SpecialField11Type {xpath('SpecialField11Type')};
	string1 SpecialField11Status {xpath('SpecialField11Status')};
	string7 SpecialField11Count {xpath('SpecialField11Count')};
	string2 SpecialField12Type {xpath('SpecialField12Type')};
	string1 SpecialField12Status {xpath('SpecialField12Status')};
	string7 SpecialField12Count {xpath('SpecialField12Count')};
	string2 SpecialField13Type {xpath('SpecialField13Type')};
	string1 SpecialField13Status {xpath('SpecialField13Status')};
	string7 SpecialField13Count {xpath('SpecialField13Count')};
	string2 SpecialField14Type {xpath('SpecialField14Type')};
	string1 SpecialField14Status {xpath('SpecialField14Status')};
	string7 SpecialField14Count {xpath('SpecialField14Count')};
end;
		
export t_ReportRequestIdRecordReport := record //RecordCode[RI51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string60 Quoteback {xpath('Quoteback')};
	string4 ReportCode {xpath('ReportCode')};
	string15 ReportCodeDesc {xpath('ReportCodeDesc')};
	string1 ReportType {xpath('ReportType')};
	string6 AccountNumber {xpath('AccountNumber')};
	string3 AccountSuffix {xpath('AccountSuffix')};
	string15 SpecialBillId {xpath('SpecialBillId')};
	string8 DateOfOrder {xpath('DateOfOrder')};
	string8 DateOfReceipt {xpath('DateOfReceipt')};
	string8 DateOfCompletion {xpath('DateOfCompletion')};
	string1 ProcessingcompletionStatus {xpath('ProcessingcompletionStatus')};
	string2 ReportUsage {xpath('ReportUsage')};
	string14 ReferenceNumber {xpath('ReferenceNumber')};
	string4 TimeOfReport {xpath('TimeOfReport')};
	string4 ProductGroup {xpath('ProductGroup')};
	string1 Attach1ProcessStatus {xpath('Attach1ProcessStatus')};
	string1 Attach2ProcessStatus {xpath('Attach2ProcessStatus')};
	string1 Attach3ProcessStatus {xpath('Attach3ProcessStatus')};
	string1 Attach4ProcessStatus {xpath('Attach4ProcessStatus')};
	string1 Attach5ProcessStatus {xpath('Attach5ProcessStatus')};
	string1 Attach6ProcessStatus {xpath('Attach6ProcessStatus')};
	string1 Attach7ProcessStatus {xpath('Attach7ProcessStatus')};
	string1 Attach8ProcessStatus {xpath('Attach8ProcessStatus')};
	string1 Attach9ProcessStatus {xpath('Attach9ProcessStatus')};
	string1 Attach10ProcesStatus {xpath('Attach10ProcesStatus')};
	string2 RecordVersion {xpath('RecordVersion')}; //values['02','01','  ','']
	string3 ProcessingStatusCode {xpath('ProcessingStatusCode')};
end;
		
export t_ReportIdSupplementARecordReport := record //RecordCode[RI52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string40 AccountName {xpath('AccountName')};
	string10 CustOrgCodeLevel1 {xpath('CustOrgCodeLevel1')};
	string10 CustOrgCodeLevel2 {xpath('CustOrgCodeLevel2')};
	string10 CustOrgCodeLevel3 {xpath('CustOrgCodeLevel3')};
	string10 CustOrgCodeLevel4 {xpath('CustOrgCodeLevel4')};
	string10 SpecialField1 {xpath('SpecialField1')};
	string10 SpecialField2 {xpath('SpecialField2')};
	string10 SpecialField3 {xpath('SpecialField3')};
	string10 SpecialFieldA {xpath('SpecialFieldA')};
	string10 SpecialFieldB {xpath('SpecialFieldB')};
	string10 SpecialFieldC {xpath('SpecialFieldC')};
	string14 RelatedReferenceNumber {xpath('RelatedReferenceNumber')};
	string8 RelatedProcessingDate {xpath('RelatedProcessingDate')};
	string4 SpecialNumericField1 {xpath('SpecialNumericField1')};
end;
		
export t_ReportIdentifierRecordReport := record //RecordCode[RI54]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['PA','PP','NC','RP','IN','YD','']
	string4 Ider1 {xpath('Ider1')};
	string6 Param1 {xpath('Param1')};
	string1 Status1 {xpath('Status1')};
	string4 Ider2 {xpath('Ider2')};
	string6 Param2 {xpath('Param2')};
	string1 Status2 {xpath('Status2')};
	string4 Ider3 {xpath('Ider3')};
	string6 Param3 {xpath('Param3')};
	string1 Status3 {xpath('Status3')};
	string4 Ider4 {xpath('Ider4')};
	string6 Param4 {xpath('Param4')};
	string1 Status4 {xpath('Status4')};
	string4 Ider5 {xpath('Ider5')};
	string6 Param5 {xpath('Param5')};
	string1 Status5 {xpath('Status5')};
	string4 Ider6 {xpath('Ider6')};
	string6 Param6 {xpath('Param6')};
	string1 Status6 {xpath('Status6')};
	string4 Ider7 {xpath('Ider7')};
	string6 Param7 {xpath('Param7')};
	string1 Status7 {xpath('Status7')};
	string4 Ider8 {xpath('Ider8')};
	string6 Param8 {xpath('Param8')};
	string1 Status8 {xpath('Status8')};
	string4 Ider9 {xpath('Ider9')};
	string6 Param9 {xpath('Param9')};
	string1 Status9 {xpath('Status9')};
	string4 Ider10 {xpath('Ider10')};
	string6 Param10 {xpath('Param10')};
	string1 Status10 {xpath('Status10')};
end;
		
export t_RequestorProducerRecordReport := record //RecordCode[RP51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string50 RequestorName {xpath('RequestorName')};
end;
		
export t_ReportSectionHeaderRecordReport := record //RecordCode[SH51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string5 SectionIdentifier {xpath('SectionIdentifier')};
	string79 SectionLabel {xpath('SectionLabel')};
	string1 SectionDeveloped {xpath('SectionDeveloped')}; //values['Y','N','E','']
end;
		
export t_ReportSubSectionHeaderRecordReport := record //RecordCode[SH52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string5 SubsectionIdentifier {xpath('SubsectionIdentifier')};
	string79 SubsectionLabel {xpath('SubsectionLabel')};
	string1 SubsectionDeveloped {xpath('SubsectionDeveloped')}; //values['Y','N','E','']
end;
		
export t_TelephoneRecordReport := record //RecordCode[TL51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['','CE','CF','CT','ED','FT','PE','PO','PT','RF','RT','WF','WT','']
	string1 GroupUsage {xpath('GroupUsage')}; //values['','Y','N','']
	string3 AreaCode {xpath('AreaCode')};
	string3 Exchange {xpath('Exchange')};
	string4 Number {xpath('Number')};
	string4 Extension {xpath('Extension')};
	string4 HoursToContactFrom {xpath('HoursToContactFrom')};
	string4 HoursToContactTo {xpath('HoursToContactTo')};
	string1 FsiAreaCode {xpath('FsiAreaCode')};
	string1 FsiExchange {xpath('FsiExchange')};
	string1 FsiNumber {xpath('FsiNumber')};
	string1 FsiExtension {xpath('FsiExtension')};
	string8 DataAssociationDate {xpath('DataAssociationDate')};
	string1 DataSourceIndicator {xpath('DataSourceIndicator')};
end;
		
export t_UnitSectionSubHeaderRecordReport := record //RecordCode[UH51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string5 SectionIdentifier {xpath('SectionIdentifier')};
	string79 SectionLabel {xpath('SectionLabel')};
	string1 SectionDeveloped {xpath('SectionDeveloped')}; //values['Y','N','E','']
end;
		
export t_UnitQuotebackRecordReport := record //RecordCode[UQ51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['','SJ','VI','RL','RF','I2','RN','']
	string60 Quoteback {xpath('Quoteback')};
end;
		
export t_VestedEntityRecordReport := record //RecordCode[VE51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['LH','LN','LO','LS','']
	string50 Entity {xpath('Entity')};
	string1 FsiEntity {xpath('FsiEntity')};
end;
		
export t_VehicleRecordReport := record //RecordCode[VI51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['PA','PT','MH','VI','']
	string2 ModelYearv1 {xpath('ModelYearv1')};
	string4 ModelYear {xpath('ModelYear')};
	string40 MakeAndModel {xpath('MakeAndModel')};
	string25 Vin {xpath('Vin')};
	string10 PlateNumber {xpath('PlateNumber')};
	string2 LicenseState {xpath('LicenseState')};
	string6 VehicleClass {xpath('VehicleClass')};
	string6 OdometerReading {xpath('OdometerReading')};
	string1 VehicleDisposition {xpath('VehicleDisposition')}; //values['N','D','R','S','T','O','X','']
	string15 TitleNumber {xpath('TitleNumber')};
	string1 MakemodelFormat {xpath('MakemodelFormat')}; //values['P','B','']
	string1 FsiLicensePlateNumber {xpath('FsiLicensePlateNumber')};
	string1 FsiLicenseState {xpath('FsiLicenseState')};
	string1 FsiVin {xpath('FsiVin')};
	string1 FsiMakeOrModel {xpath('FsiMakeOrModel')};
	string1 FsiModelYear {xpath('FsiModelYear')};
	string1 _Type {xpath('Type')};
	string1 BrandedIndicator {xpath('BrandedIndicator')};
	string1 LeasedIndicator {xpath('LeasedIndicator')};
	string10 DateOfLoss {xpath('DateOfLoss')};
end;
		
export t_VehicleSupplementARecordReport := record //RecordCode[VI52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string8 RegistrationDate {xpath('RegistrationDate')};
	string8 RegistrationExpirationDate {xpath('RegistrationExpirationDate')};
	string8 PurchaseDate {xpath('PurchaseDate')};
	string8 SoldDate {xpath('SoldDate')};
	string8 TitleIssueDate {xpath('TitleIssueDate')};
end;
		
export t_VehicleDataRelationshipRecordReport := record //RecordCode[VI60]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string1 VindDecodeIndicator {xpath('VindDecodeIndicator')}; //values['P','F','E','X','']
	string20 VinStatus {xpath('VinStatus')};
	string1 VindVehicleIndicator {xpath('VindVehicleIndicator')}; //values['P','M','T','U','']
	string4 VindVehicleYear {xpath('VindVehicleYear')};
	string4 VindMake {xpath('VindMake')};
	string3 VindSeries {xpath('VindSeries')};
	string3 VindSubSeries {xpath('VindSubSeries')};
	string18 MakeDesc {xpath('MakeDesc')};
	string17 SeriesDesc {xpath('SeriesDesc')};
	string18 SubSeriesDesc {xpath('SubSeriesDesc')};
	string2 BodyStyle {xpath('BodyStyle')};
	string20 BodyStyleDesc {xpath('BodyStyleDesc')};
end;
		
export t_VehicleSizeCostRecordReport := record //RecordCode[VI61]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string5 BasePrice {xpath('BasePrice')};
	string4 PriceVariance {xpath('PriceVariance')};
	string5 ShippingWeight {xpath('ShippingWeight')};
	string2 WeightVariance {xpath('WeightVariance')};
	string6 Tires {xpath('Tires')};
	string14 Carburetion {xpath('Carburetion')};
	string8 WheelBase {xpath('WheelBase')};
	string4 CidCc {xpath('CidCc')};
	string2 Cylinders {xpath('Cylinders')};
	string11 CntryOfOrigin {xpath('CntryOfOrigin')};
	string11 Fuel {xpath('Fuel')};
	string15 Gvw {xpath('Gvw')};
	string4 TonRating1 {xpath('TonRating1')};
	string4 TonRating2 {xpath('TonRating2')};
	string1 Wheels {xpath('Wheels')};
	string1 DriveWheels {xpath('DriveWheels')};
	string1 Cycles {xpath('Cycles')};
end;
		
export t_VehicleOriginalEquipmentRecordReport := record //RecordCode[VI62]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string13 Abs {xpath('Abs')};
	string8 AirConditioning {xpath('AirConditioning')};
	string8 PowerSteering {xpath('PowerSteering')};
	string8 PowerBrakes {xpath('PowerBrakes')};
	string8 PowerWindows {xpath('PowerWindows')};
	string8 TiltWheel {xpath('TiltWheel')};
	string5 FrontWheelDr {xpath('FrontWheelDr')};
	string5 FourWheelDrive {xpath('FourWheelDrive')};
	string8 Security {xpath('Security')};
	string6 RestraintsAirBags {xpath('RestraintsAirBags')};
	string7 RestraintsBelts {xpath('RestraintsBelts')};
end;
		
export t_VehicleSupplementBRecordReport := record //RecordCode[VI53]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string8 InspectionDate {xpath('InspectionDate')};
	string3 ReasonCode {xpath('ReasonCode')};
	string38 ReasonCodeDesc {xpath('ReasonCodeDesc')};
	string3 OverallInspectResult {xpath('OverallInspectResult')};
	string20 OverallInspectResultDesc {xpath('OverallInspectResultDesc')};
	string3 UnusualActivityFlag {xpath('UnusualActivityFlag')};
	string6 EstimatedAnnualMileage {xpath('EstimatedAnnualMileage')};
	string2 InquiryState {xpath('InquiryState')};
	string6 ActualMileage {xpath('ActualMileage')};
end;
		
export t_PropertyTaxInfoPartDRecordReport := record //RecordCode[PT54]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string15 TotalAssessedValue {xpath('TotalAssessedValue')};
	string15 TotalCalculatedValue {xpath('TotalCalculatedValue')};
	string15 TotalMarketValue {xpath('TotalMarketValue')};
	string15 TotalLandValue {xpath('TotalLandValue')};
	string15 MarketLandValue {xpath('MarketLandValue')};
	string15 AssessedLandValue {xpath('AssessedLandValue')};
	string15 ImprovementValue {xpath('ImprovementValue')};
	string4 AssessedYear {xpath('AssessedYear')};
	string20 TaxCodeArea {xpath('TaxCodeArea')};
	string4 TaxBillingYear {xpath('TaxBillingYear')};
	string1 HomeSteadExemption {xpath('HomeSteadExemption')}; //values['','Y','N','']
	string15 TaxAmount {xpath('TaxAmount')};
	string5 PercentImproved {xpath('PercentImproved')};
end;
		
export t_PropertyTaxInfoPartCRecordReport := record //RecordCode[PT53]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string80 MunicipalityName {xpath('MunicipalityName')};
	string3 Range {xpath('Range')};
	string7 Section {xpath('Section')};
	string25 ZoningDesc {xpath('ZoningDesc')};
	string3 LocationOfInfluenceCode {xpath('LocationOfInfluenceCode')};
	string10 LandUseCode {xpath('LandUseCode')};
	string3 PropertyTypeCode {xpath('PropertyTypeCode')};
	string10 Latitude {xpath('Latitude')};
	string11 Longitude {xpath('Longitude')};
	string15 LotSize {xpath('LotSize')};
	string10 LotFrontFootage {xpath('LotFrontFootage')};
	string10 LotDepthFootage {xpath('LotDepthFootage')};
	string15 Acres {xpath('Acres')};
end;
		
export t_PropertyTaxInfoPartBRecordReport := record //RecordCode[PT52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string5 FipsCode {xpath('FipsCode')};
	string80 ApnNumber {xpath('ApnNumber')};
	string7 BlockNumber {xpath('BlockNumber')};
	string10 LotNumber {xpath('LotNumber')};
	string80 SubdivisionName {xpath('SubdivisionName')};
	string30 TownshipName {xpath('TownshipName')};
end;
		
export t_PropertyTaxInfoPartARecordReport := record //RecordCode[PT51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string100 LegalDesc {xpath('LegalDesc')};
	string80 County {xpath('County')};
	string20 ParcelNumber {xpath('ParcelNumber')};
end;
		
export t_PropertySalesInfoRecordReport := record //RecordCode[PS51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')}; //values['TP','TC','DC','DP','']
	string8 RecordingDate {xpath('RecordingDate')};
	string8 SalesDate {xpath('SalesDate')};
	string20 DocumentNumber {xpath('DocumentNumber')};
	string15 SalesAmount {xpath('SalesAmount')};
	string3 SalesTypeCode {xpath('SalesTypeCode')};
end;
		
export t_PolicyCoverageRecordReport := record //RecordCode[PL52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string1 BusinessUseIndicator {xpath('BusinessUseIndicator')}; //values['Y','N','U','']
	string5 Deduct1 {xpath('Deduct1')};
	string5 Deduct2 {xpath('Deduct2')};
	string4 Cover1Type {xpath('Cover1Type')};
	string8 Cover1AmountA {xpath('Cover1AmountA')};
	string8 Cover1AmountB {xpath('Cover1AmountB')};
	string8 Cover1AmountC {xpath('Cover1AmountC')};
	string4 Cover2Type {xpath('Cover2Type')};
	string8 Cover2AmountA {xpath('Cover2AmountA')};
	string8 Cover2AmountB {xpath('Cover2AmountB')};
	string8 Cover2AmountC {xpath('Cover2AmountC')};
	string4 Cover3Type {xpath('Cover3Type')};
	string8 Cover3AmountA {xpath('Cover3AmountA')};
	string8 Cover3AmountB {xpath('Cover3AmountB')};
	string8 Cover3AmountC {xpath('Cover3AmountC')};
	string4 Cover4Type {xpath('Cover4Type')};
	string8 Cover4AmountA {xpath('Cover4AmountA')};
	string8 Cover4AmountB {xpath('Cover4AmountB')};
	string8 Cover4AmountC {xpath('Cover4AmountC')};
	string4 Cover5Type {xpath('Cover5Type')};
	string8 Cover5AmountA {xpath('Cover5AmountA')};
	string8 Cover5AmountB {xpath('Cover5AmountB')};
	string8 Cover5AmountC {xpath('Cover5AmountC')};
	string4 Cover6Type {xpath('Cover6Type')};
	string8 Cover6AmountA {xpath('Cover6AmountA')};
	string8 Cover6AmountB {xpath('Cover6AmountB')};
	string8 Cover6AmountC {xpath('Cover6AmountC')};
	string4 Cover7Type {xpath('Cover7Type')};
	string8 Cover7AmountA {xpath('Cover7AmountA')};
	string8 Cover7AmountB {xpath('Cover7AmountB')};
	string8 Cover7AmountC {xpath('Cover7AmountC')};
end;
		
export t_PropertyDescriptionRecordReport := record //RecordCode[PD51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string50 PropertyDesc1 {xpath('PropertyDesc1')};
	string6 PropertyAdditionValue1 {xpath('PropertyAdditionValue1')};
	string1 PropertyAdditionQuality1 {xpath('PropertyAdditionQuality1')};
	string1 PropertyAdditionCondition1 {xpath('PropertyAdditionCondition1')};
	string1 LivingAreaIndicator1 {xpath('LivingAreaIndicator1')}; //values['','Y','N','']
	string6 ErcValue1 {xpath('ErcValue1')};
	string6 ErcLowValue1 {xpath('ErcLowValue1')};
	string6 ErcHighValue1 {xpath('ErcHighValue1')};
	string50 PropertyDesc2 {xpath('PropertyDesc2')};
	string6 PropertyAdditionValue2 {xpath('PropertyAdditionValue2')};
	string1 PropertyAdditionQuality2 {xpath('PropertyAdditionQuality2')};
	string1 PropertyAdditionCondition2 {xpath('PropertyAdditionCondition2')};
	string1 LivingAreaIndicator2 {xpath('LivingAreaIndicator2')}; //values['','Y','N','']
	string6 ErcValue2 {xpath('ErcValue2')};
	string6 ErcLowValue2 {xpath('ErcLowValue2')};
	string6 ErcHighValue2 {xpath('ErcHighValue2')};
end;
		
export t_PropertyCharacteristicsRecordReport := record //RecordCode[PC51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string3 Pc1Category {xpath('Pc1Category')}; //values['','001','002','Flooring','004','005','006','007','008','009','010','011','012','013','014','015','016','']
	string3 Pc1Material {xpath('Pc1Material')};
	string3 Pc1Value {xpath('Pc1Value')};
	string1 Pc1Quality {xpath('Pc1Quality')};
	string1 Pc1Condition {xpath('Pc1Condition')};
	string3 Pc1Age {xpath('Pc1Age')};
	string6 Pc1ErcValue {xpath('Pc1ErcValue')};
	string1 Pc1LivingAreaInd {xpath('Pc1LivingAreaInd')};
	string6 Pc1ErcLowValue {xpath('Pc1ErcLowValue')};
	string6 Pc1ErcHighValue {xpath('Pc1ErcHighValue')};
	string3 Pc2Category {xpath('Pc2Category')}; //values['','001','002','Flooring','004','005','006','007','008','009','010','011','012','013','014','015','016','']
	string3 Pc2Material {xpath('Pc2Material')};
	string3 Pc2Value {xpath('Pc2Value')};
	string1 Pc2Quality {xpath('Pc2Quality')};
	string1 Pc2Condition {xpath('Pc2Condition')};
	string3 Pc2Age {xpath('Pc2Age')};
	string6 Pc2ErcValue {xpath('Pc2ErcValue')};
	string1 Pc2LivingAreaInd {xpath('Pc2LivingAreaInd')};
	string6 Pc2ErcLowValue {xpath('Pc2ErcLowValue')};
	string6 Pc2ErcHighValue {xpath('Pc2ErcHighValue')};
	string3 Pc3Category {xpath('Pc3Category')}; //values['','001','002','Flooring','004','005','006','007','008','009','010','011','012','013','014','015','016','']
	string3 Pc3Material {xpath('Pc3Material')};
	string3 Pc3Value {xpath('Pc3Value')};
	string1 Pc3Quality {xpath('Pc3Quality')};
	string1 Pc3Condition {xpath('Pc3Condition')};
	string3 Pc3Age {xpath('Pc3Age')};
	string6 Pc3ErcValue {xpath('Pc3ErcValue')};
	string1 Pc3LivingAreaInd {xpath('Pc3LivingAreaInd')};
	string6 Pc3ErcLowValue {xpath('Pc3ErcLowValue')};
	string6 Pc3ErcHighValue {xpath('Pc3ErcHighValue')};
	string3 Pc4Category {xpath('Pc4Category')}; //values['','001','002','Flooring','004','005','006','007','008','009','010','011','012','013','014','015','016','']
	string3 Pc4Material {xpath('Pc4Material')};
	string3 Pc4Value {xpath('Pc4Value')};
	string1 Pc4Quality {xpath('Pc4Quality')};
	string1 Pc4Condition {xpath('Pc4Condition')};
	string3 Pc4Age {xpath('Pc4Age')};
	string6 Pc4ErcValue {xpath('Pc4ErcValue')};
	string1 Pc4LivingAreaInd {xpath('Pc4LivingAreaInd')};
	string6 Pc4ErcLowValue {xpath('Pc4ErcLowValue')};
	string6 Pc4ErcHighValue {xpath('Pc4ErcHighValue')};
	string3 Pc5Category {xpath('Pc5Category')}; //values['','001','002','Flooring','004','005','006','007','008','009','010','011','012','013','014','015','016','']
	string3 Pc5Material {xpath('Pc5Material')};
	string3 Pc5Value {xpath('Pc5Value')};
	string1 Pc5Quality {xpath('Pc5Quality')};
	string1 Pc5Condition {xpath('Pc5Condition')};
	string3 Pc5Age {xpath('Pc5Age')};
	string6 Pc5ErcValue {xpath('Pc5ErcValue')};
	string1 Pc5LivingAreaInd {xpath('Pc5LivingAreaInd')};
	string6 Pc5ErcLowValue {xpath('Pc5ErcLowValue')};
	string6 Pc5ErcHighValue {xpath('Pc5ErcHighValue')};
	string3 Pc6Category {xpath('Pc6Category')}; //values['','001','002','Flooring','004','005','006','007','008','009','010','011','012','013','014','015','016','']
	string3 Pc6Material {xpath('Pc6Material')};
	string3 Pc6Value {xpath('Pc6Value')};
	string1 Pc6Quality {xpath('Pc6Quality')};
	string1 Pc6Condition {xpath('Pc6Condition')};
	string3 Pc6Age {xpath('Pc6Age')};
	string6 Pc6ErcValue {xpath('Pc6ErcValue')};
	string1 Pc6LivingAreaInd {xpath('Pc6LivingAreaInd')};
	string6 Pc6ErcLowValue {xpath('Pc6ErcLowValue')};
	string6 Pc6ErcHighValue {xpath('Pc6ErcHighValue')};
end;
		
export t_PropertyAttributesPartBRecordReport := record //RecordCode[PA52]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string100 TypeOfResidence {xpath('TypeOfResidence')};
end;
		
export t_PropertyAttributesPartARecordReport := record //RecordCode[PA51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string10 LivingAreaSFootage {xpath('LivingAreaSFootage')};
	string3 NumberOfStories {xpath('NumberOfStories')};
	string5 NumberOfBedrooms {xpath('NumberOfBedrooms')};
	string7 NumberOfBaths {xpath('NumberOfBaths')};
	string1 FireplaceIndicator {xpath('FireplaceIndicator')}; //values['','Y','N','']
	string5 NumberOfFireplaces {xpath('NumberOfFireplaces')};
	string5 NumberOfUnits {xpath('NumberOfUnits')};
	string5 NumberOfRooms {xpath('NumberOfRooms')};
	string5 NumberOfFullBaths {xpath('NumberOfFullBaths')};
	string5 NumberOfHalfBaths {xpath('NumberOfHalfBaths')};
	string5 NumberOfBathFixtures {xpath('NumberOfBathFixtures')};
	string4 YearBuilt {xpath('YearBuilt')};
	string4 EffectiveYearBuilt {xpath('EffectiveYearBuilt')};
	string3 ConditionOfStructureCode {xpath('ConditionOfStructureCode')};
	string1 Pool {xpath('Pool')}; //values['','Y','N','']
	string1 Ac {xpath('Ac')}; //values['','Y','N','']
	string1 SlopeCode {xpath('SlopeCode')}; //values['0','2','3','']
	string3 QualityOfStructureCode {xpath('QualityOfStructureCode')}; //values['1','2','3','4','']
	string25 ReplacementCostReportId {xpath('ReplacementCostReportId')};
	string9 PolicyCoverageValue {xpath('PolicyCoverageValue')};
	string15 BuildingSquareFootage {xpath('BuildingSquareFootage')};
	string10 GroundFloorSFootage {xpath('GroundFloorSFootage')};
	string10 BasementSFootage {xpath('BasementSFootage')};
	string10 GarageSFootage {xpath('GarageSFootage')};
end;
		
export t_CostSummaryRecordReport := record //RecordCode[IC51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string3 InsuranceToValue {xpath('InsuranceToValue')};
	string9 EstimatedReplacementCost {xpath('EstimatedReplacementCost')};
	string3 ErcScore {xpath('ErcScore')};
	string9 Profit {xpath('Profit')};
	string6 ArchitectAmount {xpath('ArchitectAmount')};
	string1 SalesTaxIncluded {xpath('SalesTaxIncluded')};
	string6 DebrisAmount {xpath('DebrisAmount')};
	string9 ActualCashValue {xpath('ActualCashValue')};
	string3 AcvScore {xpath('AcvScore')};
	string6 OverheadAmount {xpath('OverheadAmount')};
end;
		
export t_MeasurementInfoRecordReport := record //RecordCode[ME51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string2 ConfidenceLevel {xpath('ConfidenceLevel')};
	string2 UnitMeasure1 {xpath('UnitMeasure1')};
	string10 Ammount1 {xpath('Ammount1')};
	string2 UnitMeasure2 {xpath('UnitMeasure2')};
	string10 Ammount2 {xpath('Ammount2')};
	string2 UnitMeasure3 {xpath('UnitMeasure3')};
	string10 Ammount3 {xpath('Ammount3')};
	string2 UnitMeasure4 {xpath('UnitMeasure4')};
	string10 Ammount4 {xpath('Ammount4')};
	string2 UnitMeasure5 {xpath('UnitMeasure5')};
	string10 Ammount5 {xpath('Ammount5')};
	string1 FSIUnitMeasure1 {xpath('FSIUnitMeasure1')};
	string1 FSIAmmount1 {xpath('FSIAmmount1')};
	string1 FSIUnitMeasure2 {xpath('FSIUnitMeasure2')};
	string1 FSIAmmount2 {xpath('FSIAmmount2')};
	string1 FSIUnitMeasure3 {xpath('FSIUnitMeasure3')};
	string1 FSIAmmount3 {xpath('FSIAmmount3')};
	string1 FSIUnitMeasure4 {xpath('FSIUnitMeasure4')};
	string1 FSIAmmount4 {xpath('FSIAmmount4')};
	string1 FSIUnitMeasure5 {xpath('FSIUnitMeasure5')};
	string1 FSIAmmount5 {xpath('FSIAmmount5')};
end;
		
export t_DataSourceInfoRecordReport := record //RecordCode[SC51]
	string3 UnitNumber {xpath('UnitNumber')};
	string3 GroupSequenceNumber {xpath('GroupSequenceNumber')};
	string4 RecordCode {xpath('RecordCode')};//hidden[flrec_details]
	string2 RecordOccurrA {xpath('RecordOccurrA')};
	string2 RecordOccurrB {xpath('RecordOccurrB')};
	string2 Classification {xpath('Classification')};
	string8 Item1OrigDate {xpath('Item1OrigDate')};
	string8 Item1LastUpdate {xpath('Item1LastUpdate')};
	string8 Item1SrcIndicators {xpath('Item1SrcIndicators')};
	string8 Item2OrigDate {xpath('Item2OrigDate')};
	string8 Item2LastUpdate {xpath('Item2LastUpdate')};
	string8 Item2SrcIndicators {xpath('Item2SrcIndicators')};
	string8 Item3OrigDate {xpath('Item3OrigDate')};
	string8 Item3LastUpdate {xpath('Item3LastUpdate')};
	string8 Item3SrcIndicators {xpath('Item3SrcIndicators')};
	string8 Item4OrigDate {xpath('Item4OrigDate')};
	string8 Item4LastUpdate {xpath('Item4LastUpdate')};
	string8 Item4SrcIndicators {xpath('Item4SrcIndicators')};
	string8 Item5OrigDate {xpath('Item5OrigDate')};
	string8 Item5LastUpdate {xpath('Item5LastUpdate')};
	string8 Item5SrcIndicators {xpath('Item5SrcIndicators')};
	string8 Item6OrigDate {xpath('Item6OrigDate')};
	string8 Item6LastUpdate {xpath('Item6LastUpdate')};
	string8 Item6SrcIndicators {xpath('Item6SrcIndicators')};
end;
		

end;