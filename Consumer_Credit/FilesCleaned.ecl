IMPORT Consumer_Credit, Consumer_Credit_Layout, STD;

EXPORT FilesCleaned := MODULE
	EXPORT Address_Data := Consumer_Credit.Files.Address_Data;

	EXPORT Bankruptcy_Data := PROJECT(Consumer_Credit.Files.Bankruptcy_Data, TRANSFORM(RECORDOF(LEFT),
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.SatisfiedDischargeDate		:= Consumer_Credit.Utilities.CleanDate(LEFT.SatisfiedDischargeDate);
		SELF							:= LEFT));

	EXPORT Collection_Data := PROJECT(Consumer_Credit.Files.Collection_Data, TRANSFORM({RECORDOF(LEFT), BOOLEAN MedicalClientName, STRING2 IndustryCode},
		SELF.MedicalClientName			:= STD.Str.Find(STD.Str.ToUpperCase(LEFT.ClientNameOrNumber), 'MEDICAL PAYMENT', 1) > 0;
		SELF.DateReported				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReported);
		SELF.DateAssigned				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateAssigned);
		SELF.DateOfLastActivity			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLastActivity);
		SELF.DateOfBalance				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfBalance);
		SELF.StatusDate					:= Consumer_Credit.Utilities.CleanDate(LEFT.StatusDate);
		SELF.IndustryCode				:= STD.Str.ToUpperCase(LEFT.ReportingMemberAgencyNumber[4..5]);
		SELF							:= LEFT));

	EXPORT CreditReportSummary_Data := PROJECT(Consumer_Credit.Files.CreditReportSummary_Data, TRANSFORM({RECORDOF(LEFT), BOOLEAN ReportIncludesBankruptciesBool, BOOLEAN ReportIncludesPublicRecordsBool, BOOLEAN ReportIncludesCollectionItemsBool, BOOLEAN ReportIncludesConsumerStatementsBool},
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
		SELF										:= LEFT));

	EXPORT Employment_Data := PROJECT(Consumer_Credit.Files.Employment_Data, TRANSFORM(RECORDOF(LEFT),
		SELF.DateEmployed				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmployed);
		SELF.DateEmploymentVerified		:= Consumer_Credit.Utilities.CleanDate(LEFT.DateEmploymentVerified);
		SELF.DateLeft					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateLeft); // Not well populated
		SELF							:= LEFT));

	EXPORT Finance_Data := Consumer_Credit.Files.Finance_Data;

	EXPORT InquiryHistory_Data := PROJECT(Consumer_Credit.Files.InquiryHistory_Data, TRANSFORM({RECORDOF(LEFT), STRING2 IndustryID, STRING5 IndustryIDFull},
		SELF.DateOfInquiry				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfInquiry);
		SELF.IndustryID					:= STD.Str.ToUpperCase(LEFT.InquirerID[4..5]);
		SELF.IndustryIDFull				:= STD.Str.ToUpperCase(LEFT.InquirerID[1..5]);
		SELF							:= LEFT));

	EXPORT Judgement_Data := PROJECT(Consumer_Credit.Files.Judgement_Data, TRANSFORM(RECORDOF(LEFT),
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateSatisfied				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateSatisfied);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		SELF							:= LEFT));

	EXPORT NarrativeA_Data := PROJECT(Consumer_Credit.Files.NarrativeA_Data, TRANSFORM({RECORDOF(LEFT), BOOLEAN Remark1ContainsDispute, BOOLEAN Remark2ContainsDispute, BOOLEAN Remark1ContainsClosed, BOOLEAN Remark2ContainsClosed},
		Remark1							:= STD.Str.ToUpperCase(LEFT.Remarks1);
		Remark2							:= STD.Str.ToUpperCase(LEFT.Remarks2);
		SELF.Remark1ContainsDispute		:= STD.Str.Find(Remark1, 'DISPUTE', 1) > 0;
		SELF.Remark2ContainsDispute		:= STD.Str.Find(Remark2, 'DISPUTE', 1) > 0;
		SELF.Remark1ContainsClosed		:= STD.Str.Find(Remark1, 'CLOSED', 1) > 0;
		SELF.Remark2ContainsClosed		:= STD.Str.Find(Remark2, 'CLOSED', 1) > 0;
		SELF							:= LEFT));

	EXPORT Person_Data := Consumer_Credit.Files.Person_Data;
	
	EXPORT Report_Data := Consumer_Credit.Files.Report_Data;
	
	EXPORT ReportIdSupplement_Data := Consumer_Credit.Files.ReportIdSupplement_Data;
	
	EXPORT ReportRequest_Data := Consumer_Credit.Files.ReportRequest_Data;

	EXPORT TaxLien_Data := PROJECT(Consumer_Credit.Files.TaxLien_Data, TRANSFORM(RECORDOF(LEFT),
		SELF.DateFiled					:= Consumer_Credit.Utilities.CleanDate(LEFT.DateFiled);
		SELF.DateReleased				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReleased);
		SELF.DateVerified				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateVerified); // Not well populated
		SELF							:= LEFT));

	EXPORT TradeLine_Data := PROJECT(Consumer_Credit.Files.TradeLine_Data, TRANSFORM({RECORDOF(LEFT), BOOLEAN TapeSupplierIndicatorBool, STRING2 IndustryCode},
		SELF.TapeSupplierIndicatorBool	:= LEFT.TapeSupplierIndicator = '*'; // * == TRUE, Blank == FALSE
		SELF.DateReported				:= Consumer_Credit.Utilities.CleanDate(LEFT.DateReported);
		SELF.DateAccountOpened			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateAccountOpened);
		SELF.PrevRateDate1				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate1);
		SELF.PrevRateDate2				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate2);
		SELF.PrevRateDate3				:= Consumer_Credit.Utilities.CleanDate(LEFT.PrevRateDate3);
		SELF.DateOfLastActivity			:= Consumer_Credit.Utilities.CleanDate(LEFT.DateOfLastActivity);
		SELF.IndustryCode				:= STD.Str.ToUpperCase(LEFT.ReportingMemberNumber[4..5]);
		SELF							:= LEFT));
END;