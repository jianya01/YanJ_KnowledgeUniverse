IMPORT _Control, Consumer_Credit, Consumer_Credit_Layout, STD;

EXPORT FilesCleaned := MODULE
	SHARED FilterDate := 99999999; // If you want to run faster for quick iterative development set this to a recent date. Otherwise 99999999 runs everything.
//	SHARED FilterDate := 20160101; // If you want to run faster for quick iterative development set this to a recent date. Otherwise 99999999 runs everything.

	Address_Data_Raw := Consumer_Credit.Files.Address_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate);
	
	EXPORT Address_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Address_Data_Raw, JOIN(DISTRIBUTE(Address_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	Bankruptcy_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.Bankruptcy_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.SatisfiedDischargeDate		:= Consumer_Credit.Utilities.CleanDate(LEFT.SatisfiedDischargeDate);
		SELF							:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID) + '|' + TRIM((STRING)Date_Reported) + '|' + TRIM((STRING)RecordTypeCounter)));

	EXPORT Bankruptcy_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Bankruptcy_Data_Raw, JOIN(DISTRIBUTE(Bankruptcy_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));

	Collection_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.Collection_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN MedicalClientName, BOOLEAN MedicalCollectionClientName, STRING2 IndustryCode},
		SELF.MedicalClientName				:= STD.Str.Find(STD.Str.ToUpperCase(LEFT.ClientNameOrNumber), 'MEDICAL PAYMENT', 1) > 0;
		SELF.MedicalCollectionClientName	:= REGEXFIND('AMBU|ANATOM|ANESTH|ARTHRIT|ASTHMA|BREAST|CHIRO|CLINIC|CARDIAC|CARDIOL|DDS|DENTA|DERMA|DIAGNOST|DOCTOR|DR |DR\\.|DRS|EMERG|GASTRO|GYNEC|HEALTH|HOSP|HLTH|IMAGING|LAB|MAXILLOF|MD |MEDIC|MEDSTAR|MEMORI|MERCY|NEURO|OB/GY|OBGYN|OBSTET|OPTHALM|OPTOM|ORAL|ORTHO|OSTEO|OTOLARYN|PATHO|PEDIAT|PHARM|PHY|RADI| ST |ST\\.|SURG|SAINT|UROLOG', STD.Str.ToUpperCase(LEFT.ClientNameOrNumber));
		SELF.DateReported					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReported);
		SELF.DateAssigned					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateAssigned);
		SELF.DateOfLastActivity				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLastActivity);
		SELF.DateOfBalance					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfBalance);
		SELF.StatusDate						:= Consumer_Credit.Utilities.CleanDate(LEFT.StatusDate);
		SELF.IndustryCode					:= STD.Str.ToUpperCase(LEFT.ReportingMemberAgencyNumber[4..5]);
		SELF								:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID) + '|' + TRIM((STRING)Date_Reported) + '|' + TRIM((STRING)RecordTypeCounter)));

	EXPORT Collection_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Collection_Data_Raw, JOIN(DISTRIBUTE(Collection_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	CreditReportSummary_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.CreditReportSummary_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN ReportIncludesBankruptciesBool, BOOLEAN ReportIncludesPublicRecordsBool, BOOLEAN ReportIncludesCollectionItemsBool, BOOLEAN ReportIncludesConsumerStatementsBool},
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
		SELF										:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID)));

	EXPORT CreditReportSummary_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, CreditReportSummary_Data_Raw, JOIN(DISTRIBUTE(CreditReportSummary_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	Employment_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.Employment_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateEmployed				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmployed);
		SELF.DateEmploymentVerified		:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmploymentVerified);
		SELF.DateLeft					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateLeft); // Not well populated
		SELF							:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID) + '|' + TRIM((STRING)Date_Reported) + '|' + TRIM((STRING)RecordTypeCounter)));

	EXPORT Employment_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Employment_Data_Raw, JOIN(DISTRIBUTE(Employment_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	Finance_Data_Raw := Consumer_Credit.Files.Finance_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate);

	EXPORT Finance_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Finance_Data_Raw, JOIN(DISTRIBUTE(Finance_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	InquiryHistory_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.InquiryHistory_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), STRING2 IndustryID, STRING5 IndustryIDFull},
		SELF.DateOfInquiry				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfInquiry);
		SELF.IndustryID					:= STD.Str.ToUpperCase(LEFT.InquirerID[4..5]);
		SELF.IndustryIDFull				:= STD.Str.ToUpperCase(LEFT.InquirerID[1..5]);
		SELF							:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID) + '|' + TRIM((STRING)Date_Reported) + '|' + TRIM((STRING)RecordTypeCounter)));

	EXPORT InquiryHistory_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, InquiryHistory_Data_Raw, JOIN(DISTRIBUTE(InquiryHistory_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	Judgement_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.Judgement_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateSatisfied				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateSatisfied);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		SELF							:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID) + '|' + TRIM((STRING)Date_Reported) + '|' + TRIM((STRING)RecordTypeCounter)));

	EXPORT Judgement_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Judgement_Data_Raw, JOIN(DISTRIBUTE(Judgement_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	NarrativeA_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.NarrativeA_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN Remark1ContainsDispute, BOOLEAN Remark2ContainsDispute, BOOLEAN Remark1ContainsClosed, BOOLEAN Remark2ContainsClosed},
		Remark1							:= STD.Str.ToUpperCase(LEFT.Remarks1);
		Remark2							:= STD.Str.ToUpperCase(LEFT.Remarks2);
		SELF.Remark1ContainsDispute		:= STD.Str.Find(Remark1, 'DISPUTE', 1) > 0;
		SELF.Remark2ContainsDispute		:= STD.Str.Find(Remark2, 'DISPUTE', 1) > 0;
		SELF.Remark1ContainsClosed		:= STD.Str.Find(Remark1, 'CLOSED', 1) > 0;
		SELF.Remark2ContainsClosed		:= STD.Str.Find(Remark2, 'CLOSED', 1) > 0;
		SELF							:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID) + '|' + TRIM((STRING)Date_Reported) + '|' + TRIM((STRING)RecordTypeCounter) + '|' + TRIM((STRING)NarrativeRemarkCounter)));

	EXPORT NarrativeA_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, NarrativeA_Data_Raw, JOIN(DISTRIBUTE(NarrativeA_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	Person_Data_Raw := Consumer_Credit.Files.Person_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate);
	
	EXPORT Person_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Person_Data_Raw, JOIN(DISTRIBUTE(Person_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	Report_Data_Raw := Consumer_Credit.Files.Report_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate);
	
	EXPORT Report_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Report_Data_Raw, JOIN(DISTRIBUTE(Report_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	ReportIdSupplement_Data_Raw := Consumer_Credit.Files.ReportIdSupplement_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate);
	
	EXPORT ReportIdSupplement_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, ReportIdSupplement_Data_Raw, JOIN(DISTRIBUTE(ReportIdSupplement_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	ReportRequest_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.ReportRequest_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT)},
		SELF.DateOfOrder				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfOrder);
		SELF.DateOfReceipt				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfReceipt);
		SELF.DateOfCompletion			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfCompletion);
		SELF							:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID)));

	EXPORT ReportRequest_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, ReportRequest_Data_Raw, JOIN(DISTRIBUTE(ReportRequest_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	TaxLien_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.TaxLien_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM(RECORDOF(LEFT),
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateReleased				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReleased);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		SELF							:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID) + '|' + TRIM((STRING)Date_Reported) + '|' + TRIM((STRING)RecordTypeCounter)));

	EXPORT TaxLien_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, TaxLien_Data_Raw, JOIN(DISTRIBUTE(TaxLien_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	TradeLine_Data_Raw := DISTRIBUTE(PROJECT(Consumer_Credit.Files.TradeLine_Data (FilterDate = 99999999 OR (INTEGER)Date_Reported >= FilterDate), TRANSFORM({RECORDOF(LEFT), BOOLEAN AutoLenderMemberName, BOOLEAN TapeSupplierIndicatorBool, STRING2 IndustryCode},
		SELF.AutoLenderMemberName		:= REGEXFIND('AUTO|MOTOR|AMERICAN HONDA FINANCE CORP|AUDI FINANCIAL SERVICES|BMW FINANCIAL SERVICES|CHRYSLER CREDIT CORPORATION|INFINITI FINANCIAL SERVICES|LEXUS FINANCIAL SERVICES|MERCEDES-BENZ CREDIT|PORSCHE FINANCIAL SERVICES|SAFCO|SOUTHEAST TOYOTA FINANCE|SUBARU LEASING CORP|VOLKSWAGAN CREDIT|DAIMLER / CHRYLSER ACCEPTANCE CORP|CHRYSLER FINANCIAL COMPANY|GMAC|VOLVO FINANCIAL SERVICES|WFS FINANCIAL|SAFECO IND', STD.Str.ToUpperCase(LEFT.MemberName));
		SELF.TapeSupplierIndicatorBool	:= LEFT.TapeSupplierIndicator = '*'; // * == TRUE, Blank == FALSE
		SELF.DateReported				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReported);
		SELF.DateAccountOpened			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateAccountOpened);
		SELF.PrevRateDate1				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate1);
		SELF.PrevRateDate2				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate2);
		SELF.PrevRateDate3				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate3);
		SELF.DateOfLastActivity			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLastActivity);
		SELF.IndustryCode				:= STD.Str.ToUpperCase(LEFT.ReportingMemberNumber[4..5]);
		SELF							:= LEFT)), HASH64(TRIM((STRING)Transaction_ID) + '|' + TRIM((STRING)LexID) + '|' + TRIM((STRING)Date_Reported) + '|' + TRIM((STRING)RecordTypeCounter)));

	EXPORT TradeLine_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, TradeLine_Data_Raw, JOIN(DISTRIBUTE(TradeLine_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
END;
