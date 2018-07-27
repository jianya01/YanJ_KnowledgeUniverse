IMPORT _Control, Consumer_Credit_NCF, STD, UT;

EXPORT FilesCleaned_NCF2_0 := MODULE
	SHARED FilterDate := 99999999; // If you want to run faster for quick iterative development set this to a recent date. Otherwise 99999999 runs everything.
	// SHARED FilterDate := 20160101; // If you want to run faster for quick iterative development set this to a recent date. Otherwise 99999999 runs everything.

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	Bankruptcy_Data_Raw := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.Bankruptcy (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.SatisfiedDischargeDate		:= Consumer_Credit.Utilities.CleanDate(LEFT.SatisfiedDischargeDate);
		SELF							:= LEFT));
		
	EXPORT Bankruptcy_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Bankruptcy_Data_Raw, JOIN(DISTRIBUTE(Bankruptcy_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	Collection_Data_Raw := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.Collection (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN MedicalClientName, BOOLEAN MedicalCollectionClientName, STRING2 IndustryCode, STRING8 FirstDelinquencyDateYYYYMMDD, STRING8 LastPaymentDateYYYYMMDD, STRING CODateReported},
		SELF.MedicalClientName				:= STD.Str.Find(STD.Str.ToUpperCase(LEFT.ClientNameOrNumber), 'MEDICAL PAYMENT', 1) > 0;
		SELF.MedicalCollectionClientName	:= REGEXFIND('AMBU|ANATOM|ANESTH|ARTHRIT|ASTHMA|BREAST|CHIRO|CLINIC|CARDIAC|CARDIOL|DDS|DENTA|DERMA|DIAGNOST|DOCTOR|DR |DR\\.|DRS|EMERG|GASTRO|GYNEC|HEALTH|HOSP|HLTH|IMAGING|LAB|MAXILLOF|MD |MEDIC|MEDSTAR|MEMORI|MERCY|NEURO|OB/GY|OBGYN|OBSTET|OPTHALM|OPTOM|ORAL|ORTHO|OSTEO|OTOLARYN|PATHO|PEDIAT|PHARM|PHY|RADI| ST |ST\\.|SURG|SAINT|UROLOG', STD.Str.ToUpperCase(LEFT.ClientNameOrNumber));
		SELF.DateReported					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReported);
		SELF.DateAssigned					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateAssigned);
		SELF.DateOfLastActivity				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLastActivity);
		SELF.DateOfBalance					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfBalance);
		SELF.StatusDate						:= Consumer_Credit.Utilities.CleanDate(LEFT.StatusDate);
		SELF.IndustryCode					:= STD.Str.ToUpperCase(LEFT.ReportingMemberAgencyNumber[4..5]);
		SELF.FirstDelinquencyDateYYYYMMDD	:= INTFORMAT((INTEGER)LEFT.FirstDelinquencyDate.Year, 4, 1) + INTFORMAT((INTEGER)LEFT.FirstDelinquencyDate.Month, 2, 1) + INTFORMAT((INTEGER)LEFT.FirstDelinquencyDate.Day, 2, 1);
		SELF.LastPaymentDateYYYYMMDD		:= INTFORMAT((INTEGER)LEFT.LastPaymentDate.Year, 4, 1) + INTFORMAT((INTEGER)LEFT.LastPaymentDate.Month, 2, 1) + INTFORMAT((INTEGER)LEFT.LastPaymentDate.Day, 2, 1);
		SELF.CODateReported					:= LEFT.DateReported;
		SELF								:= LEFT));
	
	EXPORT Collection_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Collection_Data_Raw, JOIN(DISTRIBUTE(Collection_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	CreditReportSummary_Data_Raw := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.CreditReportSummary (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN ReportIncludesBankruptciesBool, BOOLEAN ReportIncludesPublicRecordsBool, BOOLEAN ReportIncludesCollectionItemsBool, BOOLEAN ReportIncludesConsumerStatementsBool, STRING Version, STRING PaymentHistoryType, STRING FileSinceDate, STRING BirthDate, STRING DeathDate, STRING ConsumerStatementOnFile, STRING ContentType, STRING StatementLength, STRING ConsumerStatement},
		SELF.DateCreditFileEstbed					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateCreditFileEstbed);
		SELF.OldestOpeningDateOfTrade				:= Consumer_Credit.Utilities.CleanDate(LEFT.OldestOpeningDateOfTrade);
		SELF.LatestReportingDateOfTrade				:= Consumer_Credit.Utilities.CleanDate(LEFT.LatestReportingDateOfTrade);
		SELF.DateOfLatestFileActivity				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLatestFileActivity);
		SELF.ReportIncludesBankruptciesBool			:= LEFT.ReportIncludesBankruptcies = 'Y'; // Y == TRUE, N/Blank == FALSE
		SELF.DateOfLatestBankruptcyV1				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLatestBankruptcyV1);
		SELF.ReportIncludesPublicRecordsBool		:= LEFT.ReportIncludesPublicRecords = 'Y'; // Y == TRUE, N/Blank == FALSE
		SELF.ReportIncludesCollectionItemsBool		:= LEFT.ReportIncldsCollectionItems = 'Y'; // Y == TRUE, N/Blank == FALSE
		SELF.ReportIncludesConsumerStatementsBool	:= LEFT.RptIncludesConsumerStmnts = 'Y'; // Y == TRUE, N/Blank == FALSE
		SELF.NinetyDayInquiryHistoryDate			:= Consumer_Credit.Utilities.CleanDate(LEFT.NinetyDayInquiryHistoryDate);
		SELF.Version								:= IF(LEFT.Transaction_ID[1] = '8', '7X', '6');
		SELF.PaymentHistoryType						:= IF(LEFT.Transaction_ID[1] = '8', '8', '4');
		SELF.FileSinceDate							:= IF(LEFT.Transaction_ID[1] = '8', '', '20010101');
		SELF.BirthDate								:= IF(LEFT.Transaction_ID[1] = '8', '19870600', '19870608');
		SELF.DeathDate								:= IF(LEFT.Transaction_ID[1] = '8', '', '');
		SELF.ConsumerStatementOnFile				:= IF(LEFT.Transaction_ID[1] = '8', '1', '1');
		SELF.ContentType							:= IF(LEFT.Transaction_ID[1] = '8', 'CS', '');
		SELF.StatementLength						:= IF(LEFT.Transaction_ID[1] = '8', '48', '38');
		SELF.ConsumerStatement						:= IF(LEFT.Transaction_ID[1] = '8', 'This is just some random Consumer Statement text', 'You are currently looking at fake data');
		SELF										:= LEFT));
	
	EXPORT CreditReportSummary_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, CreditReportSummary_Data_Raw, JOIN(DISTRIBUTE(CreditReportSummary_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	Employment_Data_Raw := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.Employment (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateEmployed				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmployed);
		SELF.DateEmploymentVerified		:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmploymentVerified);
		SELF.DateLeft					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateLeft); // Not well populated
		SELF							:= LEFT));
	
	EXPORT Employment_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Employment_Data_Raw, JOIN(DISTRIBUTE(Employment_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	EXPORT InquiryHistory_Data_Step1 := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.InquiryHistory, TRANSFORM({RECORDOF(LEFT), BOOLEAN GDropInquiry, BOOLEAN GAutoFinanceInquiry, BOOLEAN GMortgageInquiry, BOOLEAN GUtilityInquiry, BOOLEAN GStudentLoanInquiry, INTEGER8 GDaysSinceInquiry, STRING2 IndustryID, STRING5 IndustryIDFull, STRING IQType},
	// EXPORT InquiryHistory_Data_Step1 := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.InquiryHistory_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN GDropInquiry, BOOLEAN GAutoFinanceInquiry, BOOLEAN GMortgageInquiry, BOOLEAN GUtilityInquiry, BOOLEAN GStudentLoanInquiry, INTEGER8 GDaysSinceInquiry, STRING2 IndustryID, STRING5 IndustryIDFull, STRING BureauCode, STRING KOB, STRING Amount, STRING IQType, STRING Abbreviation, STRING Terms},
		SELF.DateOfInquiry				:= LEFT.DateOfInquiry; // Don't want to do any cleaning or DD append process for Inquiries - it's either a valid date, or it's not.
		SELF.IndustryID					:= STD.Str.ToUpperCase(LEFT.InquirerID[4..5]);
		SELF.IndustryIDFull				:= STD.Str.ToUpperCase(LEFT.InquirerID[1..5]);
		SELF.IQType						:= LEFT._Type;
		// These are utilized for calculating GDropInquiry outside of KEL until KEL supports such functionality.  This will need to be migrated to the FDC code.
		SELF.GDropInquiry				:= FALSE;
		IQKOBLength						:= LENGTH(TRIM(LEFT.KOB));
		KOB_AUTO_FINANCE				:= CASE(LEFT.BureauCode,
												'XPN' => ['AC','AL','AN','AU','FA'],
												'TRU' => ['AC','AL','AN','AU','FA','QA'],
												'EFX' => ['AL','AN','AU','FA'],
												[]);
		KOB_AUTO_LEASE					:= CASE(LEFT.BureauCode,
												'XPN' => ['AC'],
												'TRU' => ['AC'],
												'EFX' => [],
												[]);
		IQ_KOB_AUTO_RESELLER			:= CASE(LEFT.BureauCode,
												'XPN' => ['ZA'],
												'TRU' => [],
												'EFX' => [],
												[]);
		SELF.GAutoFinanceInquiry		:= IQKOBLength = 2 AND (LEFT.KOB IN KOB_AUTO_FINANCE OR LEFT.KOB IN KOB_AUTO_LEASE OR LEFT.KOB IN IQ_KOB_AUTO_RESELLER);
		KOB_MORTGAGE					:= CASE(LEFT.BureauCode,
												'XPN' => ['BM','FB','FL','FM','FR','RD','RE'],
												'TRU' => ['BH','BM','FH','FM','QM','RD','RE'],
												'EFX' => ['FM','FR','RE'],
												[]);
		IQ_KOB_MORTGAGE_RESELLER		:= CASE(LEFT.BureauCode,
												'XPN' => ['ZB'],
												'TRU' => ['ZB','ZM'],
												'EFX' => ['ZB'],
												[]);
		SELF.GMortgageInquiry			:= IQKOBLength = 2 AND (LEFT.KOB IN KOB_MORTGAGE OR LEFT.KOB IN IQ_KOB_MORTGAGE_RESELLER);
		KOB1_UTILITY					:= CASE(LEFT.BureauCode,
												'XPN' => ['U'],
												'TRU' => ['U'],
												'EFX' => ['U'],
												[]);
		SELF.GUtilityInquiry			:= IQKOBLength = 2 AND (LEFT.KOB[1] IN KOB1_UTILITY);
		KOB_STUDENT_LOAN					:= CASE(LEFT.BureauCode,
												'XPN' => ['EB','EC','EL','ET','EU','EV','EZ'],
												'TRU' => ['BS','EB','EL','ET','EU','EV','EY','EZ','VG'],
												'EFX' => ['FE'],
												[]);
		SELF.GStudentLoanInquiry		:= IQKOBLength = 2 AND (LEFT.KOB IN KOB_STUDENT_LOAN);
		SELF.GDaysSinceInquiry			:= ABS(STD.Date.DaysBetween(STD.Date.FromStringToDate(LEFT.DateOfInquiry, '%Y%m%d'), STD.Date.FromStringToDate(LEFT.HDDateOfReport, '%Y%m%d')));
		SELF							:= LEFT));
	
	EXPORT InquiryHistory_Data_Grouped := PROJECT(GROUP(SORT(InquiryHistory_Data_Step1, Transaction_ID, LexID, HDDateOfReport, RecordTypeCounter, -GAutoFinanceInquiry, -GMortgageInquiry, -GUtilityInquiry, -GStudentLoanInquiry, -DateOfInquiry), Transaction_ID, LexID, HDDateOfReport, RecordTypeCounter), 
		TRANSFORM({RECORDOF(LEFT), STRING LastADate, STRING LastMDate, STRING LastUDate, STRING LastSDate, BOOLEAN DropAutoInquiry, BOOLEAN DropMortgageInquiry, BOOLEAN DropUtilityInquiry, BOOLEAN DropStudentLoanInquiry}, 
			SELF.DropAutoInquiry := FALSE; 
			SELF.LastADate := IF(LEFT.GAutoFinanceInquiry, LEFT.DateOfInquiry, '');
			SELF.DropMortgageInquiry := FALSE; 
			SELF.LastMDate := IF(LEFT.GMortgageInquiry, LEFT.DateOfInquiry, '');
			SELF.DropUtilityInquiry := FALSE; 
			SELF.LastUDate := IF(LEFT.GUtilityInquiry, LEFT.DateOfInquiry, '');
			SELF.DropStudentLoanInquiry := FALSE; 
			SELF.LastSDate := IF(LEFT.GStudentLoanInquiry, LEFT.DateOfInquiry, '');
			SELF := LEFT));
	
	InquiryHistory_Data_Raw := ITERATE(InquiryHistory_Data_Grouped, TRANSFORM(RECORDOF(LEFT),
		DaysBetweenA := IF(LEFT.LastADate != '', ABS(STD.Date.DaysBetween(STD.Date.FromStringToDate(LEFT.LastADate, '%Y%m%d'), STD.Date.FromStringToDate(RIGHT.DateOfInquiry, '%Y%m%d'))), 999999);
		SELF.DropAutoInquiry := IF(RIGHT.GAutoFinanceInquiry, IF(DaysBetweenA <= 30, TRUE, FALSE), FALSE);
		SELF.LastADate := IF(SELF.DropAutoInquiry, LEFT.LastADate, RIGHT.DateOfInquiry);
		
		DaysBetweenM := IF(LEFT.LastMDate != '', ABS(STD.Date.DaysBetween(STD.Date.FromStringToDate(LEFT.LastMDate, '%Y%m%d'), STD.Date.FromStringToDate(RIGHT.DateOfInquiry, '%Y%m%d'))), 999999);
		SELF.DropMortgageInquiry := IF(RIGHT.GMortgageInquiry, IF(DaysBetweenM <= 30, TRUE, FALSE), FALSE);
		SELF.LastMDate := IF(SELF.DropMortgageInquiry, LEFT.LastMDate, RIGHT.DateOfInquiry);
		
		DaysBetweenU := IF(LEFT.LastUDate != '', ABS(STD.Date.DaysBetween(STD.Date.FromStringToDate(LEFT.LastUDate, '%Y%m%d'), STD.Date.FromStringToDate(RIGHT.DateOfInquiry, '%Y%m%d'))), 999999);
		SELF.DropUtilityInquiry := IF(RIGHT.GUtilityInquiry, IF(DaysBetweenU <= 30, TRUE, FALSE), FALSE);
		SELF.LastUDate := IF(SELF.DropUtilityInquiry, LEFT.LastUDate, RIGHT.DateOfInquiry);
		
		DaysBetweenS := IF(LEFT.LastSDate != '', ABS(STD.Date.DaysBetween(STD.Date.FromStringToDate(LEFT.LastSDate, '%Y%m%d'), STD.Date.FromStringToDate(RIGHT.DateOfInquiry, '%Y%m%d'))), 999999);
		SELF.DropStudentLoanInquiry := IF(RIGHT.GStudentLoanInquiry, IF(DaysBetweenS <= 30, TRUE, FALSE), FALSE);
		SELF.LastSDate := IF(SELF.DropStudentLoanInquiry, LEFT.LastSDate, RIGHT.DateOfInquiry);
		
		SELF.GDropInquiry := SELF.DropAutoInquiry OR SELF.DropMortgageInquiry OR SELF.DropUtilityInquiry OR SELF.DropStudentLoanInquiry;
		SELF := RIGHT));
	
	EXPORT InquiryHistory_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, UNGROUP(InquiryHistory_Data_Raw), JOIN(DISTRIBUTE(UNGROUP(InquiryHistory_Data_Raw), HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	Judgement_Data_Raw := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.Judgement (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateSatisfied				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateSatisfied);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		SELF							:= LEFT));
	
	EXPORT Judgement_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Judgement_Data_Raw, JOIN(DISTRIBUTE(Judgement_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	NarrativeA_Data_Raw := NORMALIZE(Consumer_Credit_NCF.Build_Record_NCF2.NarrativeA (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate),
	2, TRANSFORM({RECORDOF(LEFT), STRING Remarks, STRING RemarksCode},
		SELF.Remarks     := std.Str.ToUpperCase(CHOOSE(COUNTER, LEFT.Remarks1, LEFT.Remarks2));
		SELF.RemarksCode := std.Str.ToUpperCase(CHOOSE(COUNTER, LEFT.RemarksCode1, LEFT.RemarksCode2));
		SELF             := LEFT))(RemarksCode != '');
	
	EXPORT NarrativeA_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, NarrativeA_Data_Raw, JOIN(DISTRIBUTE(NarrativeA_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	ReportRequest_Data_Raw := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.ReportRequest (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate), TRANSFORM({RECORDOF(LEFT)},
		SELF.DateOfOrder				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfOrder);
		SELF.DateOfReceipt				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfReceipt);
		SELF.DateOfCompletion			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfCompletion);
		SELF							:= LEFT));
	
	EXPORT ReportRequest_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, ReportRequest_Data_Raw, JOIN(DISTRIBUTE(ReportRequest_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	TaxLien_Data_Raw := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.TaxLien (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateReleased				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReleased);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		SELF							:= LEFT));
	
	EXPORT TaxLien_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, TaxLien_Data_Raw, JOIN(DISTRIBUTE(TaxLien_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	SHARED NormalizedTradelineHistory := RECORD
		STRING Transaction_ID;
		UNSIGNED LexID;
		STRING Date_Reported;
		UNSIGNED RecordTypeCounter;
		UNSIGNED1 RecordCounter;
		STRING1 RecordValue;
	END;
	SHARED NormalizedTradelineHistory NormalizeTradelineHistory(STRING Input, STRING Transaction_ID, UNSIGNED LexID, STRING Date_Reported, UNSIGNED RecordTypeCounter) := FUNCTION
		NormalizedResult := NORMALIZE(DATASET([{1}], {UNSIGNED1 a}), LENGTH(TRIM(Input)), TRANSFORM(NormalizedTradelineHistory,
														SELF.Transaction_ID := Transaction_ID;
														SELF.LexID := LexID;
														SELF.Date_Reported := Date_Reported;
														SELF.RecordTypeCounter := RecordTypeCounter;
														SELF.RecordCounter := COUNTER;
														SELF.RecordValue := Input[COUNTER]));
		RETURN NormalizedResult;
	END;
	
	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	TradeLine_Data_Raw := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.TradeLine (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate),
	TRANSFORM({RECORDOF(LEFT), BOOLEAN AutoLenderMemberName, BOOLEAN TapeSupplierIndicatorBool, STRING2 IndustryCode},
		SELF.AutoLenderMemberName		:= REGEXFIND('AUTO|MOTOR|AMERICAN HONDA FINANCE CORP|AUDI FINANCIAL SERVICES|BMW FINANCIAL SERVICES|CHRYSLER CREDIT CORPORATION|INFINITI FINANCIAL SERVICES|LEXUS FINANCIAL SERVICES|MERCEDES-BENZ CREDIT|PORSCHE FINANCIAL SERVICES|SAFCO|SOUTHEAST TOYOTA FINANCE|SUBARU LEASING CORP|VOLKSWAGAN CREDIT|DAIMLER / CHRYLSER ACCEPTANCE CORP|CHRYSLER FINANCIAL COMPANY|GMAC|VOLVO FINANCIAL SERVICES|WFS FINANCIAL|SAFECO IND', STD.Str.ToUpperCase(LEFT.MemberName));
		SELF.TapeSupplierIndicatorBool	:= LEFT.TapeSupplierIndicator = '*'; // * == TRUE, Blank == FALSE
		SELF.TRDateReported				:= Consumer_Credit.Utilities.CleanDate(LEFT.TRDateReported);
		SELF.DateAccountOpened			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateAccountOpened);
		SELF.PrevRateDate1				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate1);
		SELF.PrevRateDate2				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate2);
		SELF.PrevRateDate3				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate3);
		SELF.DateOfLastActivity			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLastActivity);
		SELF.IndustryCode				:= STD.Str.ToUpperCase(LEFT.ReportingMemberNumber[4..5]);
		SELF							:= LEFT));
	
	TradeLine_EnhancedData_Raw := Consumer_Credit_NCF.Build_Record_NCF2.EnhancedCreditTrade_FI91 (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate);
	
	TradeLineWithEnhanced_Raw := JOIN(DISTRIBUTE(TradeLine_Data_Raw, HASH64(Transaction_ID, LexID, HDDateOfReport, RecordTypeCounter)), DISTRIBUTE(TradeLine_EnhancedData_Raw, HASH64(Transaction_ID, LexID, HDDateOfReport, RecordTypeCounter)),
			LEFT.Transaction_ID = RIGHT.Transaction_ID AND LEFT.LexID = RIGHT.LexID AND LEFT.HDDateOfReport = RIGHT.HDDateOfReport AND LEFT.RecordTypeCounter = RIGHT.RecordTypeCounter, 
		TRANSFORM({RECORDOF(LEFT), RECORDOF(RIGHT) - Transaction_id - BureauCode - LexID - HDDateOfReport - JulianDate - RemainingRefNo - ReportSource - LineNumber - OriginalRefNo - ReportTypeCounter - RecordTypeCounter - NarrativeRemarkCounter - FI90Seq - FI93Seq - SH51Type - SH51TypeSeq - UnitNumber - GroupSequenceNumber - RecordCode - RecordOccurrA - RecordOccurrB - Classification},
			SELF							:= RIGHT;
			SELF							:= LEFT), LOCAL);
	
	FinancialPaymentPattern_FI92_Raw := PROJECT(Consumer_Credit_NCF.Build_Record_NCF2.FinancialPaymentPattern_FI92 (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate), TRANSFORM({RECORDOF(LEFT), DATASET(NormalizedTradelineHistory) PaymentHistory84MonthDataset, STRING PaymentHistory48Months, STRING PaymentHistory84Months},
		SELF.PaymentHistory48Months		:= LEFT.FortyEightMonthPaymentHistory;
		SELF.PaymentHistory84Months		:= TRIM(SELF.PaymentHistory48Months) + TRIM(LEFT.AdditionalPaymentHistory);
		SELF.PaymentHistory84MonthDataset := NormalizeTradelineHistory(SELF.PaymentHistory84Months, LEFT.Transaction_ID, LEFT.LexID, LEFT.HDDateOfReport, LEFT.RecordTypeCounter);
		SELF							:= LEFT));
	
	EnhancedTradeLineDataCombined := JOIN(DISTRIBUTE(TradeLineWithEnhanced_Raw, HASH64(Transaction_ID, LexID, HDDateOfReport, RecordTypeCounter)), DISTRIBUTE(FinancialPaymentPattern_FI92_Raw, HASH64(Transaction_ID, LexID, HDDateOfReport, RecordTypeCounter)),
			LEFT.Transaction_ID = RIGHT.Transaction_ID AND LEFT.LexID = RIGHT.LexID AND LEFT.HDDateOfReport = RIGHT.HDDateOfReport AND LEFT.RecordTypeCounter = RIGHT.RecordTypeCounter, 
		TRANSFORM({RECORDOF(LEFT), DATASET(NormalizedTradelineHistory) PaymentHistory84MonthDataset, STRING PaymentHistory48Months, STRING AdditionalPaymentHistory, STRING PaymentHistory84Months, STRING PaymentPatternStartDate},
			SELF.PaymentHistory48Months		:= RIGHT.PaymentHistory48Months;
			SELF.AdditionalPaymentHistory	:= RIGHT.AdditionalPaymentHistory;
			SELF.PaymentHistory84Months		:= RIGHT.PaymentHistory84Months;
			SELF.PaymentHistory84MonthDataset := RIGHT.PaymentHistory84MonthDataset;
			SELF.PaymentPatternStartDate	:= RIGHT.PaymentPatternStartDate;
			SELF							:= LEFT), LOCAL);
	
	EXPORT TradeLine_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, EnhancedTradeLineDataCombined, JOIN(DISTRIBUTE(EnhancedTradeLineDataCombined, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	Tradeline_History_Data_Raw := PROJECT(TradeLine_Data.PaymentHistory84MonthDataset, TRANSFORM(NormalizedTradelineHistory, SELF := LEFT));
	
	EXPORT Tradeline_History_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Tradeline_History_Data_Raw, JOIN(DISTRIBUTE(Tradeline_History_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	export FinancialTrendedData_FI93_Dist := distribute(Consumer_Credit_NCF.Build_Record_NCF2.FinancialTrendedData_FI93,
	                                                    hash32(Transaction_id, HDDateOfReport, RecordTypeCounter));
	
	export TradeLine_Data_Dist := distribute(TradeLine_Data, hash32(Transaction_id, HDDateOfReport, RecordTypeCounter));
	
	export TradeLine_Trended_Data_Raw1 := NORMALIZE(FinancialTrendedData_FI93_Dist (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate),
	                                                4, TRANSFORM({RECORDOF(LEFT), UNSIGNED1 MonthCounter, STRING8 TrendedDataDate, STRING9 BalanceAmount, STRING9 LoanAmountCreditLimit, STRING9 ScheduledPayment, STRING9 ActualPayment, STRING8 LastPaymentDate},
		TrendedDataDate            := CHOOSE(COUNTER, LEFT.TrendedDataDate1, LEFT.TrendedDataDate2, LEFT.TrendedDataDate3, LEFT.TrendedDataDate4);
		SELF.MonthCounter          := std.Date.MonthsBetween(std.Date.FromStringToDate(TrendedDataDate, '%m%Y'), std.Date.FromStringToDate(LEFT.HDDateOfReport, '%Y%m')) + 1;
		SELF.TrendedDataDate       := TrendedDataDate[3..6] + TrendedDataDate[1..2]; // KEL can't read a date formatted as MMYYYY
		SELF.BalanceAmount         := CHOOSE(COUNTER, LEFT.BalanceAmount1, LEFT.BalanceAmount2, LEFT.BalanceAmount3, LEFT.BalanceAmount4);
		SELF.LoanAmountCreditLimit := CHOOSE(COUNTER, LEFT.LoanAmountOrCreditLimit1, LEFT.LoanAmountOrCreditLimit2, LEFT.LoanAmountOrCreditLimit3, LEFT.LoanAmountOrCreditLimit4);
		SELF.ScheduledPayment      := CHOOSE(COUNTER, LEFT.ScheduledPaymentAmount1, LEFT.ScheduledPaymentAmount2, LEFT.ScheduledPaymentAmount3, LEFT.ScheduledPaymentAmount4);
		SELF.ActualPayment         := CHOOSE(COUNTER, LEFT.ActualPaymentAmount1, LEFT.ActualPaymentAmount2, LEFT.ActualPaymentAmount3, LEFT.ActualPaymentAmount4);
		SELF.LastPaymentDate       := CHOOSE(COUNTER, LEFT.LastPaymentDate1, LEFT.LastPaymentDate2, LEFT.LastPaymentDate3, LEFT.LastPaymentDate4);
		SELF                       := LEFT), local)(TrendedDataDate != '' and TrendedDataDate[1] != '0');
	
	export TradeLine_Keys := dedup(sort(project(TradeLine_Trended_Data_Raw1, {STRING16 Transaction_id, STRING8 HDDateOfReport, UNSIGNED2 RecordTypeCounter},
	                                            local), record), local);
	export TradeLine_Months := normalize(TradeLine_Keys, 25, transform({recordof(left), UNSIGNED1 MonthCounter}, self.MonthCounter := counter, self := left), local);
	
	export recordof(TradeLine_Trended_Data_Raw1) Fill_Trended_Data_From_FI90_FI91_FI93(recordof(TradeLine_Trended_Data_Raw1) Trended, recordof(TradeLine_Data_Dist) TradeLine) :=
	transform
		FI93 := project(Trended, transform({string BalanceAmount, string LoanAmountCreditLimit, string ScheduledPayment, string ActualPayment, string LastPaymentDate}, self := left));
		FI91 := project(TradeLine, transform({string BalanceAmount, string LoanAmountCreditLimit, string ScheduledPayment, string ActualPayment, string LastPaymentDate},
		                self.BalanceAmount         := left.AccountBalance;
		                self.LoanAmountCreditLimit := left.CreditLimit;
		                self.ScheduledPayment      := left.ScheduledPaymentAmount;
		                self.ActualPayment         := left.ActualPaymentAmount;
		                self := left));
		self := if(std.Date.FromStringToDate(TradeLine.TRDateReported, 'YYYYMM01') =
		           std.Date.FromStringToDate(  Trended.HDDateOfReport, 'YYYYMM01')
		           and Trended.MonthCounter = 1, FI91, FI93);
		self := Trended;
	end;

	export boolean TradeLine_Match(tr1, tr2) :=
	macro
		tr1.Transaction_id = tr2.Transaction_id and tr1.HDDateOfReport = tr2.HDDateOfReport and tr1.RecordTypeCounter = tr2.RecordTypeCounter
	endmacro;

	export TradeLine_Trended_Data_Raw2 := join(TradeLine_Months, TradeLine_Trended_Data_Raw1,
	                                   TradeLine_Match(left, right) and left.MonthCounter = right.MonthCounter,
																		 transform(recordof(right), self := left, self := right),
																		 left outer, local);

	export TradeLine_Trended_Data_Raw := join(TradeLine_Trended_Data_Raw2, TradeLine_Data_Dist,
	                                          TradeLine_Match(left, right),
																						Fill_Trended_Data_From_FI90_FI91_FI93(left, right),
																						left outer, local);
	
	EXPORT TradeLine_Trended_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, TradeLine_Trended_Data_Raw, JOIN(TradeLine_Trended_Data_Raw, DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
END;