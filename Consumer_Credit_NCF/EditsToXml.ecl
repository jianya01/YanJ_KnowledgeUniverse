import Consumer_Credit_Layout;

export EditsToXml := MODULE

export EDITSReport := EDITSReport;
export EDITSReport2 := Consumer_Credit_Layout.EDITSReport2;
//
// These routines copy fields from EDITS into the iesp definitions for NCF
//

export FormatDate(string8 Indate) := function
	string8 OutDate := IF((INTEGER)Indate = 0, '00000000', Indate[5..8] + Indate[1..4]);
	return OutDate;	
end;	

// Assignment Functions
shared DoCommonAssign := MACRO
	self.UnitNumber  := EditsIn[1..3];
	self.GroupSequenceNumber  := EditsIn[4..6];
	self.RecordCode  := EditsIn[7..10];
	self.RecordOccurrA  := EditsIn[11..12];
	self.RecordOccurrB  := EditsIn[13..14];
endmacro;

// Assignment functions for Each EDITS type

export AssignAL51(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_AddressRecordReport,
	DoCommonAssign();
  self.Classification := EditsIn[15..16];
  self.GroupUsage := EditsIn[17..17];
  self.HouseNumber := EditsIn[18..26];
  self.StreetName := EditsIn[27..46];
  self.AptNumber := EditsIn[47..51];
  self.City := EditsIn[52..71];
  self.State := EditsIn[72..73];
	self.Zip := EditsIn[74..78];
	self.Zip4 := EditsIn[79..82];
	self.YearsAtAddress := EditsIn[83..84];
	self.MthsAtAddress := EditsIn[85..86];
	self.DateFirstSeen := FormatDate(EditsIn[87..94]);
	self.DateLastSeen := FormatDate(EditsIn[95..102]);
	self.FsiHouseNumber := EditsIn[103..103];
	self.FsiStreetName := EditsIn[104..104];
	self.FsiAptNumber := EditsIn[105..105];
	self.FsiCity := EditsIn[106..106];
	self.FsiState := EditsIn[107..107];
	self.FsiZip := EditsIn[108..108];
	self.FsiZip4 := EditsIn[109..109];
	self.FsiYearsAtAddress := EditsIn[110..110];
	self.FsiMonthsAtAddress := EditsIn[111..111];
	self.FsiDateFirstSeen := EditsIn[112..112];
	self.FsiDateLastSeen := EditsIn[113..113];
	self.OwnrentIndicator := EditsIn[124..124];
	self.CountyName := EditsIn[125..139];
	self.DataAssoDate := FormatDate(EditsIn[140..147]);
	self.DataSourceIndicator := EditsIn[148..148];
	self.TypeCode := EditsIn[149..150];
	self.CensusTract := EditsIn[151..160];

));

export AssignCN51(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_ConsumerNarrativeRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.DateStmtFiled	:= FormatDate(EditsIn[17..24]);
	self.StmtPurgeDate	:= FormatDate(EditsIn[25..32]);
	self.NameOfIndFiling	:= EditsIn[33..82];
	self.RelationshipToClaimant	:= EditsIn[83..94];
));

export AssignCR51(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_CreditReportSummaryRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.DateCreditFileEstbed	:= FormatDate(EditsIn[17..24]);
	self.OldestOpeningDateOfTrade	:= FormatDate(EditsIn[25..32]);
	self.LatestReportingDateOfTrade	:= FormatDate(EditsIn[33..40]);
	self.DateOfLatestFileActivity	:= FormatDate(EditsIn[41..48]);
	self.ReportIncludesBankruptcies	:= EditsIn[49..49];
	self.DateOfLatestBankruptcyv1	:= FormatDate(EditsIn[50..57]);
	self.ReportIncludesPublicRecords	:= EditsIn[58..58];
	self.ReportIncldsCollectionItems	:= EditsIn[59..59];
	self.RptIncludesConsumerStmnts	:= EditsIn[60..60];
	self.HighCreditRangeLowAmount	:= EditsIn[61..67];
	self.HighCreditRangeHighAmount	:= EditsIn[68..74];
	self.TotalNumberOfTradeLines	:= EditsIn[75..77];
	self.NoOfAcctsWcurrentStatus0	:= EditsIn[78..79];
	self.NoOfAcctsWcurrentStatus1	:= EditsIn[80..81];
	self.NoOfAcctsWcurrentStatus2	:= EditsIn[82..83];
	self.NoOfAcctsWcurrentStatus3	:= EditsIn[84..85];
	self.NoOfAcctsWcurrentStatus4	:= EditsIn[86..87];
	self.NoOfAcctsWcurrentStatus5	:= EditsIn[88..89];
	self.NoOfAcctsWcurrentStatus7	:= EditsIn[90..91];
	self.NoOfAcctsWcurrentStatus8	:= EditsIn[92..93];
	self.NoOfAcctsWcurrentStatus9	:= EditsIn[94..95];
	self.NoOfAcctsWcurrStatusBlank	:= EditsIn[96..97];
	self.NoOfAcctsWhistStatus1	:= EditsIn[98..99];
	self.NoOfAcctsWhistStatus2	:= EditsIn[100..101];
	self.NoOfAcctsWhistStatus3	:= EditsIn[102..103];
	self.NoOfAcctsWhistStatus4	:= EditsIn[104..105];
	self.NoOfAcctsWhistStatus5	:= EditsIn[106..107];
	self.NoOfAcctsWhistStatus7	:= EditsIn[108..109];
	self.NoOfAcctsWhistStatus8	:= EditsIn[110..111];
	self.NoOfAcctsWhistStatus9	:= EditsIn[112..113];
	self.HighCreditTotalRevolving	:= EditsIn[114..120];
	self.HighCreditOpenended	:= EditsIn[121..127];
	self.HighCreditInstallment	:= EditsIn[128..134];
	self.AmountOwedTotalRevolving	:= EditsIn[135..141];
	self.AmountOwedTotalOpenended	:= EditsIn[142..148];
	self.AmountOwedTotalInstallment	:= EditsIn[149..155];
	self.PastDueTotalRevolving	:= EditsIn[156..162];
	self.PastDueTotalOpenended	:= EditsIn[163..169];
	self.PastDueTotalInstallment	:= EditsIn[170..176];
	self.NinetydayInquiryHistoryCount	:= EditsIn[177..178];
	self.NinetydayInquiryHistoryDate	:= FormatDate(EditsIn[179..186]);
	self.NumberOfRevolvingAccounts	:= EditsIn[187..188];
	self.NumberOfOpenendedAccounts	:= EditsIn[189..190];
	self.NumberOfInstallmentAccounts	:= EditsIn[191..192];
));

export AssignFI61(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_BankruptcyRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	// self.DateFiled	:= transfer(EditsIn[17..24],EDITS_Share.t_EDITSDate);
	self.DateFiled	:= FormatDate(EditsIn[17..24]);
	self.BankruptcyStatus	:= EditsIn[25..25];
	self.AssetsReported	:= EditsIn[26..34];
	self.LiabilitiesReported	:= EditsIn[35..43];
	// self.SatisfieddischargeDate	:= transfer(EditsIn[44..51],EDITS_Share.t_EDITSDate);
	self.SatisfieddischargeDate	:= FormatDate(EditsIn[44..51]);
	self.InfoSrc	:= EditsIn[52..52];
	self.CourtNumber	:= EditsIn[53..62];
	self.CaseNumber	:= EditsIn[63..104];
	self.BankruptcyType	:= EditsIn[105..105];
	self.FilingType	:= EditsIn[106..106];
	self.ExemptAmount	:= EditsIn[107..115];
	self.ConsumerDisputeFlag := EditsIn[116..116];
	self.BankStatusCode	:= EditsIn[117..118];
));

export AssignFI71(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_OtherIncomeRecordReport,
	DoCommonAssign();
	self.Classification := EditsIn[15..16];
	self.DateReported	:= FormatDate(EditsIn[17..24]);
	self.DateVerified	:= FormatDate(EditsIn[25..32]);
	self.Amount	:= EditsIn[33..39];
	self.IncomeSource	:= EditsIn[40..79];
	self.InfoIndirectlyVerified	:= EditsIn[80..80];
));

export AssignFI72(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_FinancingRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.InfoSrc	:= EditsIn[17..17];
	self.DateFiled	:= FormatDate(EditsIn[18..25]);
	self.ReportingCourtNumber	:= EditsIn[26..35];
	self.CaseNumber	:= EditsIn[36..77];
	self.IndustryCode	:= EditsIn[78..79];
	self.MaturityDate	:= FormatDate(EditsIn[80..87]);
));

export AssignFI73(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_PublicItemRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.InfoSrc	:= EditsIn[17..17];
	// self.DateFiled	:= transfer(EditsIn[18..25],EDITS_Share.t_EDITSDate);
	self.DateFiled	:= FormatDate(EditsIn[18..25]);
	self.ReportingCourtNumber	:= EditsIn[26..35];
	self.CaseNumber	:= EditsIn[36..77];
	self.AmountInvolved	:= EditsIn[78..82];
	self.TypeOfRecorditem	:= EditsIn[83..83];
	// self.DateSatisfied	:= transfer(EditsIn[84..91],EDITS_Share.t_EDITSDate);
	self.DateSatisfied	:= FormatDate(EditsIn[84..91]);
	self.StatusOfRecorditem	:= EditsIn[92..92];
	// self.DateVerified	:= transfer(EditsIn[93..100],EDITS_Share.t_EDITSDate);
	self.DateVerified	:= FormatDate(EditsIn[93..100]);
	self.Defendant	:= EditsIn[101..140];
	self.Plaintiff	:= EditsIn[141..180];
	// self.StatusDate := transfer(EditsIn[181..188],EDITS_Share.t_EDITSDate);
	self.StatusDate	:= FormatDate(EditsIn[181..188]);
	self.ConsumerDisputeFlag := EditsIn[189..189];
	self.JudgementType := EditsIn[190..191];
	self.AmountInvolvedEnhanced := EditsIn[192..200];	
));

export AssignFI74(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_ForeclosureRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.InfoSrc	:= EditsIn[17..17];
	self.DateReported	:= FormatDate(EditsIn[18..25]);
	self.DateChecked	:= FormatDate(EditsIn[26..33]);
	self.ReportingMemberNumbername	:= EditsIn[34..73];
));

export AssignFI75(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_NonResponsibilityRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.InfoSrc	:= EditsIn[17..17];
	self.DateReported	:= FormatDate(EditsIn[18..25]);
	self.TypeOfPersonFiling	:= EditsIn[26..26];
));

export AssignFI76(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_TaxLienRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.InfoSrc	:= EditsIn[17..17];
	// self.DateFiled	:= transfer(EditsIn[18..25],EDITS_Share.t_EDITSDate);
	self.DateFiled	:= FormatDate(EditsIn[18..25]);
	self.ReportingCourtNumber	:= EditsIn[26..35];
	self.CaseNumber	:= EditsIn[36..77];
	self.AmountOfLien	:= EditsIn[78..82];
	self.AcbCreditorClass	:= EditsIn[83..84];
	// self.DateReleased	:= transfer(EditsIn[85..92],EDITS_Share.t_EDITSDate);
	self.DateReleased	:= FormatDate(EditsIn[85..92]);
	// self.DateVerified	:= transfer(EditsIn[93..100],EDITS_Share.t_EDITSDate);
	self.DateVerified	:= FormatDate(EditsIn[93..100]);
	self.ConsumerDisputeFlag	:= EditsIn[101..101];
	self.LienEnhancedAmount := EditsIn[102..110];
));

export AssignFI77(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_FinancialCounselorRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.InfoSrc	:= EditsIn[17..17];
	self.DateReported	:= FormatDate(EditsIn[18..25]);
	self.ReportingMemberNumber	:= EditsIn[26..35];
	self.AmountInvolved	:= EditsIn[36..40];
	self.DateChecked	:= FormatDate(EditsIn[41..48]);
	self.DateSettled	:= FormatDate(EditsIn[49..56]);
	self.CounselingStatusCode	:= EditsIn[57..57];
));

export AssignFI78(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_GarnishmentARecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.InfoSrc	:= EditsIn[17..17];
	self.DateReported	:= FormatDate(EditsIn[18..25]);
	self.DateSatisfied	:= FormatDate(EditsIn[26..33]);
	self.DateChecked	:= FormatDate(EditsIn[34..41]);
	self.ReportingCourtNumber	:= EditsIn[42..51];
	self.CaseNumber	:= EditsIn[52..93];
	self.AmountOfGarnishment	:= EditsIn[94..98];
));

export AssignFI79(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_GarnishmentBRecordReport,
	DoCommonAssign();
	self.Plaintiff	:= EditsIn[15..54];
	self.Garnishee	:= EditsIn[55..94];
	self.Defendant	:= EditsIn[95..134];
));


export AssignFI80(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_CheckingSavingsAccountRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.InfoSrc	:= EditsIn[17..17];
	self.DateReported	:= FormatDate(EditsIn[18..25]);
	self.AccountType	:= EditsIn[26..26];
	self.ReportingMemberNumber	:= EditsIn[27..36];
	self.Amount	:= EditsIn[37..43];
	self.DateOpened	:= FormatDate(EditsIn[44..51]);
	self.ReasonCode	:= EditsIn[52..52];
));

export AssignFI81(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_CollectionRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.InfoSrc	:= EditsIn[17..17];
	self.DateReported	:= FormatDate(EditsIn[18..25]);
	self.DateAssigned	:= FormatDate(EditsIn[26..33]);
	self.ReportingMemberAgencyNumber	:= EditsIn[34..43];
	self.ClientNameOrNumber	:= EditsIn[44..58];
	self.AccountSerialNumber	:= EditsIn[59..78];
	self.EcoaCode	:= EditsIn[79..79];
	self.DateOfLastActivity	:= FormatDate(EditsIn[80..87]);
	self.OriginalAmount	:= EditsIn[88..92];
	self.DateOfBalance	:= FormatDate(EditsIn[93..100]);
	self.BalanceAmount	:= EditsIn[101..105];
	self.StatusDate	:= FormatDate(EditsIn[106..113]);
	self.CollectionItemStatus	:= EditsIn[114..114];
	self.CollectionItemStatusText	:= EditsIn[115..134];
	self.KOB := EditsIn[135..136];
	self.MemberName := EditsIn[137..166];
	self.PastDueAmount := EditsIn[167..175];
	self.OriginalCreditorClassificationCode := EditsIn[176..177];
	self.ConsumerDisputeFlag := EditsIn[178..178];
	self.AccountPurposeType := EditsIn[179..180];
	self.ConsumerInformationIndicator := EditsIn[181..182];
	self.LastPaymentDate := transfer(EditsIn[183..190],EDITS_Share.t_EDITSDate);
	self.FirstDelinquencyDate := transfer(EditsIn[191..198],EDITS_Share.t_EDITSDate);
	self.OriginalAmountEnhanced := EditsIn[199..207];
	self.BalanceAmountEnhanced := EditsIn[208..216];
));

export AssignFI90(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_CreditTradeHistoryRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.ReportingMemberNumber	:= EditsIn[17..26];
	self.MemberName	:= EditsIn[27..76];
	self.TapeSupplierIndicator	:= EditsIn[77..77];
	self.DateReported	:= FormatDate(EditsIn[78..85]);
	self.DateAccountOpened	:= FormatDate(EditsIn[86..93]);
	self.HighestCreditAmount	:= EditsIn[94..100];
	self.Terms	:= EditsIn[101..104];
	self.AccountBalance	:= EditsIn[105..111];
	self.PastDueAmount	:= EditsIn[112..117];
	self.AccountTypeCode	:= EditsIn[118..118];
	self.CurrentRateCode	:= EditsIn[119..119];
	self.MonthsReviewed	:= EditsIn[120..121];
	self.AccountDesignatorCode	:= EditsIn[122..122];
	self.AccountNumber	:= EditsIn[123..142];
	self.ThirtydayCounter	:= EditsIn[143..144];
	self.SixtydayCounter	:= EditsIn[145..146];
	self.NinetydayCounter	:= EditsIn[147..148];
	self.PrevRateCode1	:= EditsIn[149..149];
	self.PrevRateDate1	:= FormatDate(EditsIn[150..157]);
	self.PrevRateCode2	:= EditsIn[158..158];
	self.PrevRateDate2	:= FormatDate(EditsIn[159..166]);
	self.PrevRateCode3	:= EditsIn[167..167];
	self.PrevRateDate3	:= FormatDate(EditsIn[168..175]);
	self.DateOfLastActivity	:= FormatDate(EditsIn[176..183]);
	self.ReservedForInternalScoringUse	:= EditsIn[184..186];
	self.PaymentHistory24Month	:= EditsIn[187..211];
));

export AssignFI95(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_NonMemberRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.DateReported	:= FormatDate(EditsIn[17..24]);
	self.AccountTypeCode	:= EditsIn[25..25];
	self.CurrentRateCode	:= EditsIn[26..26];
	self.DateAccountOpened	:= FormatDate(EditsIn[27..34]);
	self.CustomerNarrative	:= EditsIn[35..74];
	self.HighestCreditAmount	:= EditsIn[75..81];
	self.AccountBalance	:= EditsIn[82..88];
	self.PastDueAmount	:= EditsIn[89..94];
	self.RateLessThanZero	:= EditsIn[95..95];
));

export AssignIH51(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_InquiryHistoryHeaderRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	// self.DateOfInquiry	:= transfer(EditsIn[17..24],EDITS_Share.t_EDITSDate);
	self.DateOfInquiry	:= FormatDate(EditsIn[17..24]);
	self.InquirerName	:= EditsIn[27..76];
	self.Quoteback	:= EditsIn[77..136];
	self.InquirerId	:= EditsIn[137..146];
	self.InfoSrc	:= EditsIn[147..147];
	self.UnitClassification	:= EditsIn[148..149];
	self.ReportUsage	:= EditsIn[150..151];
	self.KOB := EditsIn[152..153];
	self.Amount	:= EditsIn[154..162];
	self._Type := EditsIn[163..164];
	self.Abbreviation	:= EditsIn[165..172];
	self.Terms := EditsIn[173..176];
));

export AssignIS51(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_ForeignBureauRecordReport,
	DoCommonAssign();
	self.DateReported	:= FormatDate(EditsIn[17..24]);
	self.Classification	:= EditsIn[15..16];
	self.BureauCode	:= EditsIn[25..25];
	self.CityAndNarrative	:= EditsIn[26..43];
	self.StateAndNarrative	:= EditsIn[44..83];
));

export AssignPI51(string230 EditsIn) := ROW(TRANSFORM(EDITSReport2.t_PersonRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16];
	self.Prefix	:= EditsIn[17..20];
	self.Last	:= EditsIn[21..48];
	self.First	:= EditsIn[49..68];
	self.Middle	:= EditsIn[69..83];
	self.Suffix	:= EditsIn[84..86];
	self.DateOfBirth	:= FormatDate(EditsIn[87..94]);
	self.Age	:= EditsIn[95..97];
	self.Sex	:= EditsIn[98..98]; 
	self.SSN	:= EditsIn[99..107];
	self.HeightFeet	:= EditsIn[108..108];
	self.HeightInches	:= EditsIn[109..110];
	self.Weight	:= EditsIn[111..113];
	self.Relationship	:= EditsIn[114..114];
	self.RelationshipDesc	:= EditsIn[115..134];
	self.IndividualAddressAssociationInd	:= EditsIn[135..135];
	self.NameAssociationIndicator	:= EditsIn[136..136];
	self.DataAssociationDate	:= FormatDate(EditsIn[137..144]);
	self.MaritalStatus	:= EditsIn[145..145];
	self.FsiPrefix	:= EditsIn[146..146];
	/* second one at 147 */
	self.FsiLast	:= EditsIn[147..147];
	self.FsiFirst	:= EditsIn[148..148];
	self.FsiMiddle	:= EditsIn[149..149];
	self.FsiSuffix	:= EditsIn[150..150];
	self.FsiDateOfBirth	:= EditsIn[151..151];
	self.FsiAge	:= EditsIn[152..152];
	self.FsiSex	:= EditsIn[153..153];
	self.FsiSSN	:= EditsIn[154..154];
	self.FsiHeightFeet	:= EditsIn[155..155];
	self.FsiHeightInches	:= EditsIn[156..156];
	self.FsiWeight	:= EditsIn[157..157];
	self.FsiRelationship	:= EditsIn[158..158];
	self.FsiMaritalStatus	:= EditsIn[159..159];
	self.FsiEyeColor	:= EditsIn[160..160];
	self.FsiHairColor	:= EditsIn[161..161];
	self.SsnVerified	:= EditsIn[163..163]; 
	self.RaceCode	:= EditsIn[164..164];
	self.DataSourceIndicator	:= EditsIn[165..165];
	self.EyeColor	:= EditsIn[166..168];
	self.HairColor	:= EditsIn[169..171];
	self.DateOfDeath	:= FormatDate(EditsIn[172..179]);
	self.NumberOfDependents	:= EditsIn[180..181];
	// self.FraudAlertInd	:= EditsIn[];
	// self.MultiPolicyInd	:= EditsIn[];
	// self.DateOfLoss	:= EditsIn[];
	self := [];
));

export AssignNR51(string230 EditsIn) := ROW(TRANSFORM(EDITSReport2.t_NarrativeARecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16]; 
	self.TypeRemarks	:= EditsIn[17..18];
	self.Remarks1	:= EditsIn[19..97];
	self.Remarks2	:= EditsIn[98..176];
	self.RemarksCode1	:= EditsIn[177..178];
	self.RemarksCode2	:= EditsIn[179..180];
));

export AssignNR52(string230 EditsIn) := ROW(TRANSFORM(EDITSReport2.t_NarrativeBRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16]; 
	self.NarrativeMessageCode	:= EditsIn[17..21];
	self.RemarksLine1	:= EditsIn[22..100];
	self.RemarksLine2	:= EditsIn[101..179];
));

export AssignOE53(string230 EditsIn) := ROW(TRANSFORM(EDITSReport2.t_OccupationCRecordReport,
	DoCommonAssign();
	self.Classification	:= EditsIn[15..16]; 
	self.TypeOfPositionDesc	:= EditsIn[17..50];
	self.EmployerName	:= EditsIn[51..84];
	self.StateOfEmployment	:= EditsIn[85..86];
	self.CityOfEmployment	:= EditsIn[87..94];
	self.DateEmployed	:= FormatDate(EditsIn[95..102]);
	self.DateEmploymentVerified	:= FormatDate(EditsIn[103..110]);
	self.DateLeft	:= FormatDate(EditsIn[111..118]);
	self.EmploymentIndirectlyVerified	:= EditsIn[119..119];
	self.MonthlySalary	:= EditsIn[120..126];
));

export AssignRI51(string230 EditsIn) := ROW(TRANSFORM(EDITSReport2.t_ReportRequestIdRecordReport,
	DoCommonAssign();
  self.Quoteback	:= EditsIn[15..74];
  self.ReportCode	:= EditsIn[75..78];
  self.ReportCodeDesc	:= EditsIn[79..93];
  self.ReportType	:= EditsIn[94..94];
  self.AccountNumber	:= EditsIn[95..100];
  self.AccountSuffix	:= EditsIn[101..103];
  self.SpecialBillId	:= EditsIn[104..118];
  self.DateOfOrder	:= FormatDate(EditsIn[119..126]);
  self.DateOfReceipt	:= FormatDate(EditsIn[127..134]);
  self.DateOfCompletion	:= FormatDate(EditsIn[135..142]);
  self.ProcessingcompletionStatus	:= EditsIn[143..143];
  self.ReportUsage	:= EditsIn[144..145];
  self.ReferenceNumber	:= EditsIn[146..159];
  self.TimeOfReport	:= EditsIn[160..163];
  self.ProductGroup	:= EditsIn[164..167];
  self.Attach1ProcessStatus	:= EditsIn[168..168];
  self.Attach2ProcessStatus	:= EditsIn[169..169];
  self.Attach3ProcessStatus	:= EditsIn[170..170];
  self.Attach4ProcessStatus	:= EditsIn[171..171];
  self.Attach5ProcessStatus	:= EditsIn[172..172];
  self.Attach6ProcessStatus	:= EditsIn[173..173];
  self.Attach7ProcessStatus	:= EditsIn[174..174];
  self.Attach8ProcessStatus	:= EditsIn[175..175];
  self.Attach9ProcessStatus	:= EditsIn[176..176];
  self.Attach10ProcesStatus	:= EditsIn[177..177];
  self.RecordVersion	:= EditsIn[179..180];	
	self.ProcessingStatusCode := '';
));

export AssignRI52(string230 EditsIn) := ROW(TRANSFORM(EDITSReport2.t_ReportIdSupplementARecordReport,
	DoCommonAssign();
	self.Classification := EditsIn[15..16];
	self.AccountName  := EditsIn[17..56];
	self.CustOrgCodeLevel1 := EditsIn[57..66];
	self.CustOrgCodeLevel2 := EditsIn[67..76];
	self.CustOrgCodeLevel3 := EditsIn[77..86];
	self.CustOrgCodeLevel4  := EditsIn[87..96];
	self.SpecialField1 := EditsIn[97..106];
	self.SpecialField2 := EditsIn[107..116];
	self.SpecialField3 := EditsIn[117..126];
	self.SpecialFieldA  := EditsIn[127..136];
	self.SpecialFieldB := EditsIn[137..146];
	self.SpecialFieldC := EditsIn[147..156];
	self.RelatedReferenceNumber := EditsIn[157..170];
	self.RelatedProcessingDate := FormatDate( EditsIn[171..178]);
	self.SpecialNumericField1 := EditsIn[179..182];
));

export AssignSH51(string230 EditsIn) := ROW(TRANSFORM(EDITSReport2.t_ReportSectionHeaderRecordReport,
	DoCommonAssign();
	self.SectionIdentifier  := EditsIn[15..19];
	self.SectionLabel  := EditsIn[20..98];
	self.SectionDeveloped  := EditsIn[99..99];
));

export AssignCR52(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_CreditReportSummaryEnhancedInformationRecordReport,
	DoCommonAssign();
	self.Classification := EditsIn[15..16];
	self.BankruptcyPresence := EditsIn[17..17];
	self.PublicRecordPresence := EditsIn[18..18];
	self.CollectionPresence := EditsIn[19..19];
	self.MortgagePresence := EditsIn[20..20];
	self.MinCreditLimit := EditsIn[21..27];
	self.MaxCreditLimit := EditsIn[28..34];
	self.MaxCreditAmount := EditsIn[35..41];
	// self.LastDateReported := transfer(EditsIn[42..49],EDITS_Share.t_EDITSDate);
	self.LastDateReported	:= FormatDate(EditsIn[42..49]);
	self.InquiryNumber := EditsIn[50..52];
	// self.MostRecentInquiryDate := transfer(EditsIn[53..60],EDITS_Share.t_EDITSDate);
	self.MostRecentInquiryDate	:= FormatDate(EditsIn[53..60]);
	self.CreditUtilization := EditsIn[61..63];
	self.OpenTradesNumber := EditsIn[64..66];
	self.TotalOpenTradeBalance := EditsIn[67..73];
	// self.MostRecentTradeDate := transfer(EditsIn[74..81],EDITS_Share.t_EDITSDate);
	self.MostRecentTradeDate	:= FormatDate(EditsIn[74..81]);
	self.OldestOpenTradeAge	:= EditsIn[82..85];
));

export AssignFI91(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_EnhancedCreditTradeHistoryRecordReport,
	DoCommonAssign();
	self.Classification := EditsIn[15..16];
	self.KOB := EditsIn[17..18];
	self.AccountPurposeType := EditsIn[19..20];
	self.CreditLimit := EditsIn[21..30];
	self.ScheduledPaymentAmount := EditsIn[31..39];
	self.MonthlyPaymentType := EditsIn[40..40];
	self.ActualPaymentAmount := EditsIn[41..49];
	self.DerogCounter := EditsIn[50..51];
	self.OldHistoricalWorstRatingCode := EditsIn[52..53];
	// self.OldHistoricalWorstRatingDate := transfer(EditsIn[54..61],EDITS_Share.t_EDITSDate);
	self.OldHistoricalWorstRatingDate	:= FormatDate(EditsIn[54..61]);
	// self.StatusDate := transfer(EditsIn[62..69],EDITS_Share.t_EDITSDate);
	self.StatusDate	:= FormatDate(EditsIn[62..69]);
	// self.LastPaymentDate := transfer(EditsIn[70..77],EDITS_Share.t_EDITSDate);
	self.LastPaymentDate	:= FormatDate(EditsIn[70..77]);
	self.ConsumerDisputeFlag := EditsIn[78..78];
	self.PaymentFrequency := EditsIn[79..79];
	self.ActivityDesignatorCode := EditsIn[80..81];
	// self.ClosedDate := transfer(EditsIn[82..89],EDITS_Share.t_EDITSDate);
	self.ClosedDate	:= FormatDate(EditsIn[82..89]);
	self.ChargeOffAmount := EditsIn[90..99];
	self.StatusCode := EditsIn[100..101];
	self.AccountConditionCode := EditsIn[102..103];
	self.ConsumerInformationIndicator := EditsIn[104..105];
	self.MortgageID := EditsIn[106..123];
	// self.DeferredPaymentStartDate := transfer(EditsIn[124..131],EDITS_Share.t_EDITSDate);
	self.DeferredPaymentStartDate	:= FormatDate(EditsIn[124..131]);
	self.DeferredPaymentAmount := EditsIn[132..140];
	self.BalloonPaymentAmount := EditsIn[141..149];
	// self.BalloonPaymentDueDate := transfer(EditsIn[150..157],EDITS_Share.t_EDITSDate);
	self.BalloonPaymentDueDate	:= FormatDate(EditsIn[150..157]);
	self.CurrentRateCodeEnhanced := EditsIn[158..159];
	// self.LastActivityOrFirstDelinquencyDate	:= transfer(EditsIn[160..167],EDITS_Share.t_EDITSDate);
	self.LastActivityOrFirstDelinquencyDate	:= FormatDate(EditsIn[160..167]);
	self.MaximumDelinquencyCode := EditsIn[168..168];
	// self.MaximumDelinquencyDate := transfer(EditsIn[169..176],EDITS_Share.t_EDITSDate);
	self.MaximumDelinquencyDate	:= FormatDate(EditsIn[169..176]);
));

export AssignFI92(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_FinancialPaymentPatternGridRecordReport,
	DoCommonAssign();
	self.Classification := EditsIn[15..16];
	// self.PaymentPatternStartDate := transfer(EditsIn[17..24],EDITS_Share.t_EDITSDate);
	self.PaymentPatternStartDate	:= FormatDate(EditsIn[17..24]);
	self.FortyEightMonthPaymentHistory := EditsIn[25..72];
	self.AdditionalPaymentHistory := EditsIn[73..108];
));

export AssignFI93(string230 EditsIn) := ROW(TRANSFORM(EDITSReport.t_FinancialTrendedDataRecordReport,
	DoCommonAssign();
	self.Classification := EditsIn[15..16];
	self.TrendedDataDate1 := EditsIn[17..22];
	self.BalanceAmount1 := EditsIn[23..31];
	self.LoanAmountOrCreditLimit1 := EditsIn[32..40];
	self.ScheduledPaymentAmount1 := EditsIn[41..49];
	self.ActualPaymentAmount1 := EditsIn[50..58];
	// self.LastPaymentDate1 := transfer(EditsIn[59..66],EDITS_Share.t_EDITSDate);
	self.LastPaymentDate1	:= FormatDate(EditsIn[59..66]);
	self.TrendedDataDate2 := EditsIn[67..72];
	self.BalanceAmount2 := EditsIn[73..81];
	self.LoanAmountOrCreditLimit2 := EditsIn[82..90];
	self.ScheduledPaymentAmount2 := EditsIn[91..99];
	self.ActualPaymentAmount2 := EditsIn[100..108];
	// self.LastPaymentDate2 := transfer(EditsIn[109..116],EDITS_Share.t_EDITSDate);
	self.LastPaymentDate2	:= FormatDate(EditsIn[109..116]);
	self.TrendedDataDate3 := EditsIn[117..122];
	self.BalanceAmount3 := EditsIn[123..131];
	self.LoanAmountOrCreditLimit3 := EditsIn[132..140];
	self.ScheduledPaymentAmount3 := EditsIn[141..149];
	self.ActualPaymentAmount3 := EditsIn[150..158];
	// self.LastPaymentDate3 := transfer(EditsIn[159..166],EDITS_Share.t_EDITSDate);
	self.LastPaymentDate3	:= FormatDate(EditsIn[159..166]);
	self.TrendedDataDate4 := EditsIn[167..172];
	self.BalanceAmount4 := EditsIn[173..181];
	self.LoanAmountOrCreditLimit4 := EditsIn[182..190];
	self.ScheduledPaymentAmount4 := EditsIn[191..199];
	self.ActualPaymentAmount4 := EditsIn[200..208];
	// self.LastPaymentDate4 := transfer(EditsIn[209..216],EDITS_Share.t_EDITSDate);
	self.LastPaymentDate4	:= FormatDate(EditsIn[209..216]);
));
end; // module