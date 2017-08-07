IMPORT _Control, Consumer_Credit, Consumer_Credit_Layout, STD, UT;

EXPORT FilesCleaned_NCF2_0 := MODULE
	SHARED FilterDate := 99999999; // If you want to run faster for quick iterative development set this to a recent date. Otherwise 99999999 runs everything.
	// SHARED FilterDate := 20160101; // If you want to run faster for quick iterative development set this to a recent date. Otherwise 99999999 runs everything.

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	Bankruptcy_Data_Raw := PROJECT(Consumer_Credit.Files.Bankruptcy_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), STRING BureauCode, STRING StatusCode, STRING ConsumerDisputeFlag},
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.SatisfiedDischargeDate		:= Consumer_Credit.Utilities.CleanDate(LEFT.SatisfiedDischargeDate);
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode					:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.StatusCode					:= IF(LEFT.Transaction_ID[1] = '8', '11', '13');
		SELF.ConsumerDisputeFlag		:= IF(LEFT.Transaction_ID[1] = '8', 'Y', '');
		SELF							:= LEFT));
		
	EXPORT Bankruptcy_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Bankruptcy_Data_Raw, JOIN(DISTRIBUTE(Bankruptcy_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	Collection_Data_Raw := PROJECT(Consumer_Credit.Files.Collection_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN MedicalClientName, BOOLEAN MedicalCollectionClientName, STRING2 IndustryCode, STRING BureauCode, STRING KOB, STRING AccountNumber, STRING PastDueAmount, STRING ClassificationCode, STRING ConsumerDisputeFlag, STRING AccountPurposeCode, STRING ConsumerInfoIndicator, STRING DateOfFirstDelinquency, STRING CODateReported, STRING LastPaymentDate},
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
		SELF.AccountNumber					:= IF(LEFT.Transaction_ID[1] = '8', 'A1224', 'B45');
		SELF.PastDueAmount					:= IF(LEFT.Transaction_ID[1] = '8', '10', '0');
		SELF.ClassificationCode				:= IF(LEFT.Transaction_ID[1] = '8', 'A4', 'ZA');
		SELF.ConsumerDisputeFlag			:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
		SELF.AccountPurposeCode				:= IF(LEFT.Transaction_ID[1] = '8', 'DB', 'CO');
		SELF.ConsumerInfoIndicator			:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
		SELF.DateOfFirstDelinquency			:= IF(LEFT.Transaction_ID[1] = '8', '', '19990515');
		SELF.LastPaymentDate				:= (STRING)LEFT.DateOfLastActivity;
		SELF.CODateReported					:= LEFT.DateReported;
		SELF								:= LEFT));
	
	EXPORT Collection_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Collection_Data_Raw, JOIN(DISTRIBUTE(Collection_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	CreditReportSummary_Data_Raw := PROJECT(Consumer_Credit.Files.CreditReportSummary_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN ReportIncludesBankruptciesBool, BOOLEAN ReportIncludesPublicRecordsBool, BOOLEAN ReportIncludesCollectionItemsBool, BOOLEAN ReportIncludesConsumerStatementsBool, STRING BureauCode, STRING Version, STRING PaymentHistoryType, STRING FileSinceDate, STRING BirthDate, STRING DeathDate, STRING ConsumerStatementOnFile, STRING ContentType, STRING StatementLength, STRING ConsumerStatement},
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
		SELF.BirthDate								:= IF(LEFT.Transaction_ID[1] = '8', '19870600', '19870608');
		SELF.DeathDate								:= IF(LEFT.Transaction_ID[1] = '8', '', '');
		SELF.ConsumerStatementOnFile				:= IF(LEFT.Transaction_ID[1] = '8', '1', '1');
		SELF.ContentType							:= IF(LEFT.Transaction_ID[1] = '8', 'CS', '');
		SELF.StatementLength						:= IF(LEFT.Transaction_ID[1] = '8', '48', '38');
		SELF.ConsumerStatement						:= IF(LEFT.Transaction_ID[1] = '8', 'This is just some random Consumer Statement text', 'You are currently looking at fake data');
		SELF										:= LEFT));
	
	EXPORT CreditReportSummary_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, CreditReportSummary_Data_Raw, JOIN(DISTRIBUTE(CreditReportSummary_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	Employment_Data_Raw := PROJECT(Consumer_Credit.Files.Employment_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateEmployed				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmployed);
		SELF.DateEmploymentVerified		:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmploymentVerified);
		SELF.DateLeft					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateLeft); // Not well populated
		SELF							:= LEFT));
	
	EXPORT Employment_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Employment_Data_Raw, JOIN(DISTRIBUTE(Employment_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	InquiryHistory_TestData := PROJECT(DATASET([{'6994415R3141133', 1413802196, '20170802', 1, 1, '20170420', 'AL'},
						{'6994415R3141133', 1413802196, '20170802', 1, 2, '20170601', 'AL'},
						{'6994415R3141133', 1413802196, '20170802', 1, 3, '20170629', 'AL'},
						{'6994415R3141133', 1413802196, '20170802', 1, 4, '20170701', 'AL'},
						{'6994415R3141133', 1413802196, '20170802', 1, 5, '20170712', 'AL'},
						{'6994415R3141133', 1413802196, '20170802', 1, 6, '20170421', 'FM'},
						{'6994415R3141133', 1413802196, '20170802', 1, 7, '20170602', 'FM'},
						{'6994415R3141133', 1413802196, '20170802', 1, 8, '20170630', 'FM'},
						{'6994415R3141133', 1413802196, '20170802', 1, 9, '20170702', 'FM'},
						{'6994415R3141133', 1413802196, '20170802', 1, 10, '20170713', 'FM'},
						{'0F19ADA9C0X3382', 1514226899, '20170803', 1, 1, '20170420', 'AL'},
						{'0F19ADA9C0X3382', 1514226899, '20170803', 1, 2, '20170601', 'AL'},
						{'0F19ADA9C0X3382', 1514226899, '20170803', 1, 3, '20170629', 'AL'},
						{'0F19ADA9C0X3382', 1514226899, '20170803', 1, 4, '20170701', 'AL'},
						{'0F19ADA9C0X3382', 1514226899, '20170803', 1, 5, '20170712', 'AL'}], 
				{STRING Transaction_ID, UNSIGNED6 LexID, STRING Date_Reported, INTEGER RecordTypeCounter, INTEGER LineNumber, STRING DateOfInquiry, STRING KOB}), TRANSFORM({RECORDOF(Consumer_Credit.Files.InquiryHistory_Data), STRING KOB}, SELF := LEFT; SELF := []));
				
	EXPORT InquiryHistory_Data_Step1 := PROJECT(InquiryHistory_TestData, TRANSFORM({RECORDOF(LEFT), BOOLEAN GDropInquiry, BOOLEAN GAutoFinanceInquiry, BOOLEAN GMortgageInquiry, BOOLEAN GUtilityInquiry, BOOLEAN GStudentLoanInquiry, INTEGER8 GDaysSinceInquiry, STRING2 IndustryID, STRING5 IndustryIDFull, STRING BureauCode, /*STRING KOB,*/ STRING Amount, STRING IQType, STRING Abbreviation, STRING Terms},
	// EXPORT InquiryHistory_Data_Step1 := PROJECT(Consumer_Credit.Files.InquiryHistory_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN GDropInquiry, BOOLEAN GAutoFinanceInquiry, BOOLEAN GMortgageInquiry, BOOLEAN GUtilityInquiry, BOOLEAN GStudentLoanInquiry, INTEGER8 GDaysSinceInquiry, STRING2 IndustryID, STRING5 IndustryIDFull, STRING BureauCode, STRING KOB, STRING Amount, STRING IQType, STRING Abbreviation, STRING Terms},
		SELF.DateOfInquiry				:= LEFT.DateOfInquiry; // Don't want to do any cleaning or DD append process for Inquiries - it's either a valid date, or it's not.
		SELF.IndustryID					:= STD.Str.ToUpperCase(LEFT.InquirerID[4..5]);
		SELF.IndustryIDFull				:= STD.Str.ToUpperCase(LEFT.InquirerID[1..5]);
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode					:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		// SELF.KOB						:= IF(LEFT.Transaction_ID[1] = '8', 'AL', 'AL');
		SELF.KOB						:= LEFT.KOB;
		SELF.Amount						:= IF(LEFT.Transaction_ID[1] = '8', '123', '');
		SELF.IQType						:= IF(LEFT.Transaction_ID[1] = '8', 'U', '');
		SELF.Abbreviation				:= IF(LEFT.Transaction_ID[1] = '8', '', 'CR');
		SELF.Terms						:= IF(LEFT.Transaction_ID[1] = '8', 'UNK', '');
		// These are utilized for calculating GDropInquiry outside of KEL until KEL supports such functionality.  This will need to be migrated to the FDC code.
		SELF.GDropInquiry				:= FALSE;
		IQKOBLength						:= LENGTH(TRIM(SELF.KOB));
		KOB_AUTO_FINANCE				:= CASE(SELF.BureauCode,
												'XPN' => ['AC','AL','AN','AU','FA'],
												'TRU' => ['AC','AL','AN','AU','FA','QA'],
												'EFX' => ['AL','AN','AU','FA'],
												[]);
		KOB_AUTO_LEASE					:= CASE(SELF.BureauCode,
												'XPN' => ['AC'],
												'TRU' => ['AC'],
												'EFX' => [],
												[]);
		IQ_KOB_AUTO_RESELLER			:= CASE(SELF.BureauCode,
												'XPN' => ['ZA'],
												'TRU' => [],
												'EFX' => [],
												[]);
		SELF.GAutoFinanceInquiry		:= IQKOBLength = 2 AND (SELF.KOB IN KOB_AUTO_FINANCE OR SELF.KOB IN KOB_AUTO_LEASE OR SELF.KOB IN IQ_KOB_AUTO_RESELLER);
		KOB_MORTGAGE					:= CASE(SELF.BureauCode,
												'XPN' => ['BM','FB','FL','FM','FR','RD','RE'],
												'TRU' => ['BH','BM','FH','FM','QM','RD','RE'],
												'EFX' => ['FM','FR','RE'],
												[]);
		IQ_KOB_MORTGAGE_RESELLER		:= CASE(SELF.BureauCode,
												'XPN' => ['ZB'],
												'TRU' => ['ZB','ZM'],
												'EFX' => ['ZB'],
												[]);
		SELF.GMortgageInquiry			:= IQKOBLength = 2 AND (SELF.KOB IN KOB_MORTGAGE OR SELF.KOB IN IQ_KOB_MORTGAGE_RESELLER);
		KOB1_UTILITY					:= CASE(SELF.BureauCode,
												'XPN' => ['U'],
												'TRU' => ['U'],
												'EFX' => ['U'],
												[]);
		SELF.GUtilityInquiry			:= IQKOBLength = 2 AND (SELF.KOB[1] IN KOB1_UTILITY);
		KOB_STUDENT_LOAN					:= CASE(SELF.BureauCode,
												'XPN' => ['EB','EC','EL','ET','EU','EV','EZ'],
												'TRU' => ['BS','EB','EL','ET','EU','EV','EY','EZ','VG'],
												'EFX' => ['FE'],
												[]);
		SELF.GStudentLoanInquiry		:= IQKOBLength = 2 AND (SELF.KOB IN KOB_STUDENT_LOAN);
		SELF.GDaysSinceInquiry			:= ABS(STD.Date.DaysBetween(STD.Date.FromStringToDate(LEFT.DateOfInquiry, '%Y%m%d'), STD.Date.FromStringToDate(LEFT.Date_Reported, '%Y%m%d')));
		SELF							:= LEFT));
	
	EXPORT InquiryHistory_Data_Grouped := PROJECT(GROUP(SORT(InquiryHistory_Data_Step1, Transaction_ID, LexID, Date_Reported, RecordTypeCounter, -GAutoFinanceInquiry, -GMortgageInquiry, -GUtilityInquiry, -GStudentLoanInquiry, -DateOfInquiry), Transaction_ID, LexID, Date_Reported, RecordTypeCounter), 
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
	Judgement_Data_Raw := PROJECT(Consumer_Credit.Files.Judgement_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), STRING BureauCode, STRING ConsumerDisputeFlag, STRING JudgmentType},
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateSatisfied				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateSatisfied);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode					:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.JudgmentType				:= IF(LEFT.Transaction_ID[1] = '8', '11', '12');
		SELF.ConsumerDisputeFlag		:= IF(LEFT.Transaction_ID[1] = '8', 'Y', '');
		SELF							:= LEFT));
	
	EXPORT Judgement_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Judgement_Data_Raw, JOIN(DISTRIBUTE(Judgement_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	NarrativeA_Data_Raw := PROJECT(Consumer_Credit.Files.NarrativeA_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN Remark1ContainsDispute, BOOLEAN Remark2ContainsDispute, BOOLEAN Remark1ContainsClosed, BOOLEAN Remark2ContainsClosed, STRING Remarks3, STRING RemarksCode3, STRING Remarks4, STRING RemarksCode4, BOOLEAN Remark3ContainsDispute, BOOLEAN Remark4ContainsDispute, BOOLEAN Remark3ContainsClosed, BOOLEAN Remark4ContainsClosed},
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
	
	EXPORT NarrativeA_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, NarrativeA_Data_Raw, JOIN(DISTRIBUTE(NarrativeA_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	ReportRequest_Data_Raw := PROJECT(Consumer_Credit.Files.ReportRequest_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT)},
		SELF.DateOfOrder				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfOrder);
		SELF.DateOfReceipt				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfReceipt);
		SELF.DateOfCompletion			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfCompletion);
		SELF							:= LEFT));
	
	EXPORT ReportRequest_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, ReportRequest_Data_Raw, JOIN(DISTRIBUTE(ReportRequest_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	TaxLien_Data_Raw := PROJECT(Consumer_Credit.Files.TaxLien_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), STRING BureauCode, STRING ConsumerDisputeFlag},
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateReleased				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReleased);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		// These are all new 2.0 fields, need to re-map these once we have the finalized EDITs layout
		SELF.BureauCode					:= IF(LEFT.Transaction_ID[1] = '8', 'XPN', 'EFX');
		SELF.ConsumerDisputeFlag		:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
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
	TradeLine_Data_Raw := PROJECT(Consumer_Credit.Files.TradeLine_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), DATASET(NormalizedTradelineHistory) PaymentHistory84MonthDataset, BOOLEAN AutoLenderMemberName, BOOLEAN TapeSupplierIndicatorBool, STRING2 IndustryCode, STRING BureauCode, STRING TradeKey, STRING KOB, STRING ECOA, STRING PortfolioTypeCode, STRING ClosedDate, STRING CreditLimit, STRING ChargeOffAmount, STRING ScheduledPaymentAmount, STRING MonthlyPaymentType, STRING AccountPurposeType, STRING ActualPaymentAmount, BOOLEAN ActualPaymentNullInd, STRING StatusCode, STRING AccountConditionCode, STRING DerogCounter, STRING OldHistoricWorstRatingCode, STRING OldHistoricWorstRatingDate, STRING StatusDate, STRING LastPaymentDate, STRING PaymentHistory48Months, STRING AdditionalPaymentHistory, STRING PaymentHistory84Months, STRING ConsumerDisputeFlag, STRING ConsumerInfoIndicator, STRING PaymentFrequency, STRING ActivityDesignatorCode, STRING MortgageID, STRING DeferredPaymentStartDate, STRING DeferredPaymentAmount, STRING BalloonPaymentAmount, STRING BalloonPaymentDueDate, STRING PaymentPatternStartDate, STRING TRDateReported},
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
		SELF.ActualPaymentNullInd		:= (BOOLEAN)(INTEGER)IF(LEFT.Transaction_ID[1] = '8', '0', '0');
		SELF.StatusCode					:= IF(LEFT.Transaction_ID[1] = '8', 'B', '');
		SELF.AccountConditionCode		:= IF(LEFT.Transaction_ID[1] = '8', 'C', '');
		SELF.DerogCounter				:= IF(LEFT.Transaction_ID[1] = '8', '1', '');
		SELF.OldHistoricWorstRatingCode	:= IF(LEFT.Transaction_ID[1] = '8', '1', '1');
		SELF.OldHistoricWorstRatingDate	:= IF(LEFT.Transaction_ID[1] = '8', '20100201', '20100201');
		SELF.StatusDate					:= IF(LEFT.Transaction_ID[1] = '8', '20100201', '20100201');
		LastPaymentDate					:= IF(LEFT.Transaction_ID[1] = '8', '02032017', '02032017');
		SELF.LastPaymentDate			:= IF(SELF.BureauCode IN ['XPN', 'EFX'], LastPaymentDate[5..8] + LastPaymentDate[1..2] + LastPaymentDate[3..4], LastPaymentDate[1..4] + LastPaymentDate[5..6] + LastPaymentDate[7..8]);
		ClosedDate						:= IF(LEFT.Transaction_ID[1] = '8', '02032017', '02032017');
		SELF.ClosedDate					:= IF(SELF.BureauCode = 'EFX', ClosedDate[5..8] + ClosedDate[1..2] + ClosedDate[3..4], ClosedDate);
		SELF.PaymentHistory48Months		:= IF(LEFT.Transaction_ID[1] = '8', '111234567654321111111111', '77654321111111111111112121111111');
		SELF.AdditionalPaymentHistory	:= '';
		SELF.PaymentHistory84Months		:= TRIM(SELF.PaymentHistory48Months) + TRIM(SELF.AdditionalPaymentHistory);
		SELF.PaymentHistory84MonthDataset := NormalizeTradelineHistory(SELF.PaymentHistory84Months, LEFT.Transaction_ID, LEFT.LexID, LEFT.Date_Reported, LEFT.RecordTypeCounter);
		SELF.ConsumerDisputeFlag		:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
		SELF.ConsumerInfoIndicator		:= IF(LEFT.Transaction_ID[1] = '8', 'N', '');
		SELF.PaymentFrequency			:= IF(LEFT.Transaction_ID[1] = '8', 'B', 'D');
		SELF.ActivityDesignatorCode		:= IF(LEFT.Transaction_ID[1] = '8', 'A1', 'A2');
		SELF.MortgageID					:= IF(LEFT.Transaction_ID[1] = '8', 'M12345', 'M12345');
		SELF.DeferredPaymentStartDate	:= IF(LEFT.Transaction_ID[1] = '8', '0', '20110101');
		SELF.DeferredPaymentAmount		:= IF(LEFT.Transaction_ID[1] = '8', '0', '400');
		SELF.BalloonPaymentAmount		:= IF(LEFT.Transaction_ID[1] = '8', '500', '500');
		SELF.BalloonPaymentDueDate		:= IF(LEFT.Transaction_ID[1] = '8', '20110201', '20110201');
		SELF.PaymentPatternStartDate	:= IF(LEFT.Transaction_ID[1] = '8', '20110101', '20110101');
		SELF.TRDateReported				:= LEFT.DateReported;
		SELF							:= LEFT));
	
	EXPORT TradeLine_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, TradeLine_Data_Raw, JOIN(DISTRIBUTE(TradeLine_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	Tradeline_History_Data_Raw := PROJECT(TradeLine_Data.PaymentHistory84MonthDataset, TRANSFORM(NormalizedTradelineHistory, SELF := LEFT));
	
	EXPORT Tradeline_History_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Tradeline_History_Data_Raw, JOIN(DISTRIBUTE(Tradeline_History_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	// TODO: This will need to be re-worked once we have the actual file layout, for now I am populating potential test cases
	TradeLine_Trended_Data_Raw := PROJECT((UT.DS_OneRecord + UT.DS_OneRecord), TRANSFORM({STRING Transaction_ID, UNSIGNED LexID, UNSIGNED Date_Reported, UNSIGNED RecordTypeCounter, UNSIGNED1 MonthCounter, STRING6 TrendedDataDate, UNSIGNED BalanceAmount, UNSIGNED LoanAmountCreditLimit, UNSIGNED ScheduledPayment, UNSIGNED ActualPayment, UNSIGNED LastPaymentDate, BOOLEAN TDActualPaymentNullInd},
		SELF.Transaction_ID				:= CASE(COUNTER,
											1 => '8778015R13971833',
											2 => '0F19ADA9C0X3382',
												 '');
		SELF.LexID						:= 1514226899;
		SELF.Date_Reported				:= 20170201;
		SELF.RecordTypeCounter			:= 1;
		SELF.MonthCounter				:= COUNTER;
		SELF.TrendedDataDate			:= '201702';
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
		SELF.TDActualPaymentNullInd		:= (BOOLEAN)(INTEGER)0;
		SELF							:= LEFT));
	
	EXPORT TradeLine_Trended_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, TradeLine_Trended_Data_Raw, JOIN(DISTRIBUTE(TradeLine_Trended_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
END;