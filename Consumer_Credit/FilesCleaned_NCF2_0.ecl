IMPORT Consumer_Credit, Consumer_Credit_Layout, STD, UT;

EXPORT FilesCleaned_NCF2_0 := MODULE
	SHARED FilterDate := 99999999; // If you want to run faster for quick iterative development set this to a recent date. Otherwise 99999999 runs everything.
	// SHARED FilterDate := 20160101; // If you want to run faster for quick iterative development set this to a recent date. Otherwise 99999999 runs everything.

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	EXPORT Bankruptcy_Data := PROJECT(Consumer_Credit.Files.Bankruptcy_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), STRING BureauCode, STRING ECOA, STRING StatusDate, STRING ConsumerDisputeFlag},
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.SatisfiedDischargeDate		:= Consumer_Credit.Utilities.CleanDate(LEFT.SatisfiedDischargeDate);
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode					:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.ECOA						:= IF(LEFT.Transaction_ID[1] = '8', 'I', 'J');
		SELF.StatusDate					:= IF(LEFT.Transaction_ID[1] = '8', '20160608', '02012017');
		SELF.ConsumerDisputeFlag		:= IF(LEFT.Transaction_ID[1] = '8', 'Y', '');
		SELF							:= LEFT));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	EXPORT Collection_Data := PROJECT(Consumer_Credit.Files.Collection_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN MedicalClientName, BOOLEAN MedicalCollectionClientName, STRING2 IndustryCode, STRING BureauCode, STRING KOB, STRING OriginalCreditorName, STRING AccountNumber, STRING PastDueAmount, STRING ClassificationCode, STRING ConsumerDisputeFlag, STRING AccountTypeCode, STRING ConsumerInfoIndicator, STRING Date1stDelinquency},
		SELF.MedicalClientName				:= STD.Str.Find(STD.Str.ToUpperCase(LEFT.ClientNameOrNumber), 'MEDICAL PAYMENT', 1) > 0;
		SELF.MedicalCollectionClientName	:= REGEXFIND('AMBU|ANATOM|ANESTH|ARTHRIT|ASTHMA|BREAST|CHIRO|CLINIC|CARDIAC|CARDIOL|DDS|DENTA|DERMA|DIAGNOST|DOCTOR|DR |DR\\.|DRS|EMERG|GASTRO|GYNEC|HEALTH|HOSP|HLTH|IMAGING|LAB|MAXILLOF|MD |MEDIC|MEDSTAR|MEMORI|MERCY|NEURO|OB/GY|OBGYN|OBSTET|OPTHALM|OPTOM|ORAL|ORTHO|OSTEO|OTOLARYN|PATHO|PEDIAT|PHARM|PHY|RADI| ST |ST\\.|SURG|SAINT|UROLOG', STD.Str.ToUpperCase(LEFT.ClientNameOrNumber));
		SELF.DateReported					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReported);
		SELF.DateAssigned					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateAssigned);
		SELF.DateOfLastActivity				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLastActivity);
		SELF.DateOfBalance					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfBalance);
		SELF.StatusDate						:= Consumer_Credit.Utilities.CleanDate(LEFT.StatusDate);
		SELF.IndustryCode					:= STD.Str.ToUpperCase(LEFT.ReportingMemberAgencyNumber[4..5]);
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode						:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.KOB							:= IF(LEFT.Transaction_ID[1] = '8', '45', '45');
		SELF.OriginalCreditorName			:= IF(LEFT.Transaction_ID[1] = '8', 'Someone', 'Random');
		SELF.AccountNumber					:= IF(LEFT.Transaction_ID[1] = '8', 'A1224', 'B45');
		SELF.PastDueAmount					:= IF(LEFT.Transaction_ID[1] = '8', '10', '0');
		SELF.ClassificationCode				:= IF(LEFT.Transaction_ID[1] = '8', 'A4', 'ZA');
		SELF.ConsumerDisputeFlag			:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
		SELF.AccountTypeCode				:= IF(LEFT.Transaction_ID[1] = '8', 'DB', 'CO');
		SELF.ConsumerInfoIndicator			:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
		SELF.Date1stDelinquency				:= IF(LEFT.Transaction_ID[1] = '8', '', '05151999');
		SELF								:= LEFT));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	EXPORT CreditReportSummary_Data := PROJECT(Consumer_Credit.Files.CreditReportSummary_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN ReportIncludesBankruptciesBool, BOOLEAN ReportIncludesPublicRecordsBool, BOOLEAN ReportIncludesCollectionItemsBool, BOOLEAN ReportIncludesConsumerStatementsBool, STRING BureauCode, STRING Version, STRING PaymentHistoryType, STRING FileSinceDate, STRING BirthDate, STRING DeathDate, STRING ConsumerStatementOnFile, STRING ContentType, STRING StatementLength, STRING ConsumerStatement},
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
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode								:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.Version								:= IF(LEFT.Transaction_ID[1] = '8', '7X', '6');
		SELF.PaymentHistoryType						:= IF(LEFT.Transaction_ID[1] = '8', '8', '4');
		SELF.FileSinceDate							:= IF(LEFT.Transaction_ID[1] = '8', '', '20010101');
		SELF.BirthDate								:= IF(LEFT.Transaction_ID[1] = '8', '06001987', '06081987');
		SELF.DeathDate								:= IF(LEFT.Transaction_ID[1] = '8', '', '');
		SELF.ConsumerStatementOnFile				:= IF(LEFT.Transaction_ID[1] = '8', '1', '1');
		SELF.ContentType							:= IF(LEFT.Transaction_ID[1] = '8', 'CS', '');
		SELF.StatementLength						:= IF(LEFT.Transaction_ID[1] = '8', '48', '38');
		SELF.ConsumerStatement						:= IF(LEFT.Transaction_ID[1] = '8', 'This is just some random Consumer Statement text', 'You are currently looking at fake data');
		SELF										:= LEFT));

	EXPORT Employment_Data := PROJECT(Consumer_Credit.Files.Employment_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateEmployed				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmployed);
		SELF.DateEmploymentVerified		:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmploymentVerified);
		SELF.DateLeft					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateLeft); // Not well populated
		SELF							:= LEFT));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	EXPORT InquiryHistory_Data := PROJECT(Consumer_Credit.Files.InquiryHistory_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), STRING2 IndustryID, STRING5 IndustryIDFull, STRING BureauCode, STRING KOB, STRING Amount, STRING IQType, STRING Abbreviation, STRING Terms},
		SELF.DateOfInquiry				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfInquiry);
		SELF.IndustryID					:= STD.Str.ToUpperCase(LEFT.InquirerID[4..5]);
		SELF.IndustryIDFull				:= STD.Str.ToUpperCase(LEFT.InquirerID[1..5]);
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode					:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.KOB						:= IF(LEFT.Transaction_ID[1] = '8', '45', '45');
		SELF.Amount						:= IF(LEFT.Transaction_ID[1] = '8', '123', '');
		SELF.IQType						:= IF(LEFT.Transaction_ID[1] = '8', 'U', '');
		SELF.Abbreviation				:= IF(LEFT.Transaction_ID[1] = '8', '', 'CR');
		SELF.Terms						:= IF(LEFT.Transaction_ID[1] = '8', 'UNK', '');
		SELF							:= LEFT));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	EXPORT Judgement_Data := PROJECT(Consumer_Credit.Files.Judgement_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), STRING BureauCode, STRING ECOA, STRING StatusDate, STRING ConsumerDisputeFlag},
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateSatisfied				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateSatisfied);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode					:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.ECOA						:= IF(LEFT.Transaction_ID[1] = '8', 'I', 'J');
		SELF.StatusDate					:= IF(LEFT.Transaction_ID[1] = '8', '20140101', '');
		SELF.ConsumerDisputeFlag		:= IF(LEFT.Transaction_ID[1] = '8', 'Y', '');
		SELF							:= LEFT));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	EXPORT NarrativeA_Data := PROJECT(Consumer_Credit.Files.NarrativeA_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN Remark1ContainsDispute, BOOLEAN Remark2ContainsDispute, BOOLEAN Remark1ContainsClosed, BOOLEAN Remark2ContainsClosed, STRING Remarks3, STRING RemarksCode3, STRING Remarks4, STRING RemarksCode4, BOOLEAN Remark3ContainsDispute, BOOLEAN Remark4ContainsDispute, BOOLEAN Remark3ContainsClosed, BOOLEAN Remark4ContainsClosed},
		Remark1							:= STD.Str.ToUpperCase(LEFT.Remarks1);
		Remark2							:= STD.Str.ToUpperCase(LEFT.Remarks2);
		SELF.Remarks1					:= Remark1;
		SELF.Remarks2					:= Remark2;
		SELF.Remark1ContainsDispute		:= STD.Str.Find(Remark1, 'DISPUTE', 1) > 0;
		SELF.Remark2ContainsDispute		:= STD.Str.Find(Remark2, 'DISPUTE', 1) > 0;
		SELF.Remark1ContainsClosed		:= STD.Str.Find(Remark1, 'CLOSED', 1) > 0;
		SELF.Remark2ContainsClosed		:= STD.Str.Find(Remark2, 'CLOSED', 1) > 0;
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		Remark3							:= STD.Str.ToUpperCase('DISPUTE');
		Remark4							:= STD.Str.ToUpperCase('CLOSED');
		SELF.Remarks3					:= Remark3;
		SELF.RemarksCode3				:= 'DI';
		SELF.Remarks4					:= Remark4;
		SELF.RemarksCode4				:= 'CL';
		SELF.Remark3ContainsDispute		:= STD.Str.Find(Remark3, 'DISPUTE', 1) > 0;
		SELF.Remark4ContainsDispute		:= STD.Str.Find(Remark4, 'DISPUTE', 1) > 0;
		SELF.Remark3ContainsClosed		:= STD.Str.Find(Remark3, 'CLOSED', 1) > 0;
		SELF.Remark4ContainsClosed		:= STD.Str.Find(Remark4, 'CLOSED', 1) > 0;
		SELF							:= LEFT));
	
	EXPORT ReportRequest_Data := PROJECT(Consumer_Credit.Files.ReportRequest_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT)},
		SELF.DateOfOrder				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfOrder);
		SELF.DateOfReceipt				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfReceipt);
		SELF.DateOfCompletion			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfCompletion);
		SELF							:= LEFT));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	EXPORT TaxLien_Data := PROJECT(Consumer_Credit.Files.TaxLien_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), STRING BureauCode, STRING ECOA, STRING StatusDate, STRING ConsumerDisputeFlag},
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateReleased				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReleased);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode					:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.ECOA						:= IF(LEFT.Transaction_ID[1] = '8', 'I', 'J');
		SELF.StatusDate					:= IF(LEFT.Transaction_ID[1] = '8', '0', '');
		SELF.ConsumerDisputeFlag		:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
		SELF							:= LEFT));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	EXPORT TradeLine_Data := PROJECT(Consumer_Credit.Files.TradeLine_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN PaymentHistory84MonthsContainsGridSatisfactory, BOOLEAN PaymentHistory84MonthsContainsGrid30DPD, BOOLEAN PaymentHistory84MonthsContainsGrid60DPD, BOOLEAN PaymentHistory84MonthsContainsGrid90DPD, BOOLEAN PaymentHistory84MonthsContainsGrid120180DPD, BOOLEAN PaymentHistory84MonthsContainsGridDEROG, BOOLEAN PaymentHistory84MonthsContainsGridCollection, BOOLEAN AutoLenderMemberName, BOOLEAN TapeSupplierIndicatorBool, STRING2 IndustryCode, STRING BureauCode, STRING TradeKey, STRING KOB, STRING ECOA, STRING PortfolioTypeCode, STRING CreditLimit, STRING ChargeOffAmount, STRING ScheduledPaymentAmount, STRING MonthlyPaymentType, STRING AccountPurposeType, STRING ActualPaymentAmount, STRING ActualPaymentNullInd, STRING StatusCode, STRING AccountConditionCode, STRING DerogCounter, STRING OldHistoricWorstRatingCode, STRING OldHistoricWorstRatingDate, STRING StatusDate, STRING LastPaymentDate, STRING PaymentHistory84Months, STRING ConsumerDisputeFlag, STRING ConsumerInfoIndicator, STRING PaymentFrequency, STRING ActivityDesignatorCode, STRING MortgageID, STRING DeferredPaymentStartDate, STRING DeferredPaymentAmount, STRING BalloonPaymentAmount, STRING BalloonPaymentDueDate, STRING PaymentPatternStartDate, BOOLEAN PaymentHistory84MonthsContainsGridL3Satisfactory},
		SELF.AutoLenderMemberName		:= REGEXFIND('AUTO|MOTOR|AMERICAN HONDA FINANCE CORP|AUDI FINANCIAL SERVICES|BMW FINANCIAL SERVICES|CHRYSLER CREDIT CORPORATION|INFINITI FINANCIAL SERVICES|LEXUS FINANCIAL SERVICES|MERCEDES-BENZ CREDIT|PORSCHE FINANCIAL SERVICES|SAFCO|SOUTHEAST TOYOTA FINANCE|SUBARU LEASING CORP|VOLKSWAGAN CREDIT|DAIMLER / CHRYLSER ACCEPTANCE CORP|CHRYSLER FINANCIAL COMPANY|GMAC|VOLVO FINANCIAL SERVICES|WFS FINANCIAL|SAFECO IND', STD.Str.ToUpperCase(LEFT.MemberName));
		SELF.TapeSupplierIndicatorBool	:= LEFT.TapeSupplierIndicator = '*'; // * == TRUE, Blank == FALSE
		SELF.DateReported				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReported);
		SELF.DateAccountOpened			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateAccountOpened);
		SELF.PrevRateDate1				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate1);
		SELF.PrevRateDate2				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate2);
		SELF.PrevRateDate3				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate3);
		SELF.DateOfLastActivity			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLastActivity);
		SELF.IndustryCode				:= STD.Str.ToUpperCase(LEFT.ReportingMemberNumber[4..5]);
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode					:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.TradeKey					:= IF(LEFT.Transaction_ID[1] = '8', '1', '1');
		SELF.KOB						:= IF(LEFT.Transaction_ID[1] = '8', '45', '45');
		SELF.AccountNumber				:= IF(LEFT.Transaction_ID[1] = '8', 'A1224', 'B45');
		SELF.ECOA						:= IF(LEFT.Transaction_ID[1] = '8', 'I', 'J');
		SELF.PortfolioTypeCode			:= IF(LEFT.Transaction_ID[1] = '8', 'R', '1');
		SELF.CreditLimit				:= IF(LEFT.Transaction_ID[1] = '8', '5000', '5000');
		SELF.ChargeOffAmount			:= IF(LEFT.Transaction_ID[1] = '8', '1000', '500');
		SELF.ScheduledPaymentAmount		:= IF(LEFT.Transaction_ID[1] = '8', '100', '50');
		SELF.MonthlyPaymentType			:= IF(LEFT.Transaction_ID[1] = '8', 'S', '');
		SELF.AccountPurposeType			:= IF(LEFT.Transaction_ID[1] = '8', 'CR', 'AU');
		SELF.ActualPaymentAmount		:= IF(LEFT.Transaction_ID[1] = '8', '100', '50');
		SELF.ActualPaymentNullInd		:= IF(LEFT.Transaction_ID[1] = '8', '0', '0');
		SELF.StatusCode					:= IF(LEFT.Transaction_ID[1] = '8', 'B', '');
		SELF.AccountConditionCode		:= IF(LEFT.Transaction_ID[1] = '8', 'C', '');
		SELF.DerogCounter				:= IF(LEFT.Transaction_ID[1] = '8', '1', '');
		SELF.OldHistoricWorstRatingCode	:= IF(LEFT.Transaction_ID[1] = '8', '1', '1');
		SELF.OldHistoricWorstRatingDate	:= IF(LEFT.Transaction_ID[1] = '8', '20100201', '02002010');
		SELF.StatusDate					:= IF(LEFT.Transaction_ID[1] = '8', '20100201', '20100201');
		SELF.LastPaymentDate			:= IF(LEFT.Transaction_ID[1] = '8', '02032017', '02032017');
		SELF.PaymentHistory84Months		:= IF(LEFT.Transaction_ID[1] = '8', '1/2/3/4/5', '1/2/3/4/5');
		SELF.PaymentHistory84MonthsContainsGridSatisfactory := MAP(SELF.BureauCode = 'EFX' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '01'))) > 0,
																									 SELF.BureauCode = 'XPN' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '01N'))) > 0,
																									 SELF.BureauCode = 'TRU' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '01'))) > 0,
																									 FALSE);
		SELF.PaymentHistory84MonthsContainsGrid30DPD := MAP(SELF.BureauCode = 'EFX' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '2'))) > 0,
																									 SELF.BureauCode = 'XPN' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '2'))) > 0,
																									 SELF.BureauCode = 'TRU' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '2'))) > 0,
																									 FALSE);
		SELF.PaymentHistory84MonthsContainsGrid60DPD := MAP(SELF.BureauCode = 'EFX' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '3'))) > 0,
																									 SELF.BureauCode = 'XPN' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '3'))) > 0,
																									 SELF.BureauCode = 'TRU' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '3'))) > 0,
																									 FALSE);
		SELF.PaymentHistory84MonthsContainsGrid90DPD := MAP(SELF.BureauCode = 'EFX' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '4'))) > 0,
																									 SELF.BureauCode = 'XPN' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '4'))) > 0,
																									 SELF.BureauCode = 'TRU' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '4'))) > 0,
																									 FALSE);
		SELF.PaymentHistory84MonthsContainsGrid120180DPD := MAP(SELF.BureauCode = 'EFX' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '5'))) > 0,
																									 SELF.BureauCode = 'XPN' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '567'))) > 0,
																									 SELF.BureauCode = 'TRU' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '5'))) > 0,
																									 FALSE);
		SELF.PaymentHistory84MonthsContainsGridDEROG := MAP(SELF.BureauCode = 'EFX' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '89Y'))) > 0,
																									 SELF.BureauCode = 'XPN' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '89Y'))) > 0,
																									 SELF.BureauCode = 'TRU' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '89Y'))) > 0,
																									 FALSE);
		SELF.PaymentHistory84MonthsContainsGridCollection := MAP(SELF.BureauCode = 'EFX' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), ''))) > 0,
																									 SELF.BureauCode = 'XPN' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), '93'))) > 0,
																									 SELF.BureauCode = 'TRU' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months), ''))) > 0,
																									 FALSE);
		SELF.ConsumerDisputeFlag		:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
		SELF.ConsumerInfoIndicator		:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
		SELF.PaymentFrequency			:= IF(LEFT.Transaction_ID[1] = '8', 'B', 'D');
		SELF.ActivityDesignatorCode		:= IF(LEFT.Transaction_ID[1] = '8', 'A1', 'A2');
		SELF.MortgageID					:= IF(LEFT.Transaction_ID[1] = '8', 'M12345', 'M12345');
		SELF.DeferredPaymentStartDate	:= IF(LEFT.Transaction_ID[1] = '8', '0', '20110101');
		SELF.DeferredPaymentAmount		:= IF(LEFT.Transaction_ID[1] = '8', '0', '400');
		SELF.BalloonPaymentAmount		:= IF(LEFT.Transaction_ID[1] = '8', '500', '500');
		SELF.BalloonPaymentDueDate		:= IF(LEFT.Transaction_ID[1] = '8', '02002011', '20110201');
		SELF.PaymentPatternStartDate	:= IF(LEFT.Transaction_ID[1] = '8', '20110101', '20110101');
		// SELF.PaymentHistory84MonthsContainsGridL3Satisfactory	:= MAP(SELF.BureauCode = 'EFX' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months[1..(3-(STD.Date.MonthsBetween(SELF.PaymentPatternStartDate,SELF.DateReported)-1))]), '01'))) > 0,
																																	// SELF.BureauCode = 'XPN' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months[1..(3-(STD.Date.MonthsBetween(SELF.PaymentPatternStartDate,SELF.DateReported)-1))]), '01N'))) > 0,
																																	// SELF.BureauCode = 'TRU' => LENGTH(TRIM(StringLib.StringFilter(StringLib.StringToUpperCase(SELF.PaymentHistory84Months[1..(3-(STD.Date.MonthsBetween(SELF.PaymentPatternStartDate,SELF.DateReported)-1))]), '01'))) > 0,
																																	// FALSE);
		SELF							:= LEFT));
	
	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	EXPORT TradeLine_Trended_Data := PROJECT((UT.DS_OneRecord + UT.DS_OneRecord), TRANSFORM({STRING Transaction_ID, UNSIGNED LexID, UNSIGNED Date_Reported, UNSIGNED RecordTypeCounter, UNSIGNED1 MonthCounter, UNSIGNED BalanceAmount, UNSIGNED LoanAmountCreditLimit, UNSIGNED ScheduledPayment, UNSIGNED ActualPayment, UNSIGNED LastPaymentDate, UNSIGNED1 ActualPaymentNullInd},
		SELF.Transaction_ID				:= CASE(COUNTER,
											1 => '8778015R13971833',
											2 => '0F19ADA9C0X3382',
												 '');
		SELF.LexID						:= 1514226899;
		SELF.Date_Reported				:= 20170201;
		SELF.RecordTypeCounter			:= 1;
		SELF.MonthCounter				:= COUNTER;
		SELF.BalanceAmount				:= CASE(COUNTER,
											1 => 12345,
											2 => 222,
												 0);
		SELF.LoanAmountCreditLimit		:= CASE(COUNTER,
											1 => 55555,
											2 => 222,
												 0);
		SELF.ScheduledPayment			:= CASE(COUNTER,
											1 => 111,
											2 => 10,
												 0);
		SELF.ActualPayment				:= CASE(COUNTER,
											1 => 100,
											2 => 10,
												 0);
		SELF.LastPaymentDate			:= CASE(COUNTER,
											1 => 20170202,
											2 => 20170201,
												 0);
		SELF.ActualPaymentNullInd		:= 0;
		SELF							:= LEFT));
END;