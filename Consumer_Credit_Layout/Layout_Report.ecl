IMPORT Consumer_Credit_Layout;

EXPORT Layout_Report := MODULE

	EXPORT Common_Data := RECORD
		Consumer_Credit_Layout.Layout_EditsArchive_Append - Edits;
	END;

	EXPORT Layout_ReportRequestIdRecord := RECORD //RecordCode[RI51]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport2.t_ReportRequestIdRecordReport;
	END;	
	
	EXPORT Layout_ReportIdSupplementARecord := RECORD //RecordCode[RI52]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport2.t_ReportIdSupplementARecordReport;
	END;		

	EXPORT Layout_BankruptcyRecord := RECORD //RecordCode[FI61]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_BankruptcyRecordReport;
	END;

	EXPORT Layout_CollectionRecord := RECORD //RecordCode[FI81]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_CollectionRecordReport;
	END;
	
	EXPORT Layout_EmploymentRecord := RECORD //RecordCode[OE53]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport2.t_OccupationCRecordReport;
	END;
	
	EXPORT Layout_NarrativeARecord := RECORD //RecordCode[NR51]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport2.t_NarrativeARecordReport;
	END;
	
	EXPORT Layout_AddressRecord := RECORD //RecordCode[AL51]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_AddressRecordReport;
	END;
	
	EXPORT Layout_CreditReportSummaryRecord := RECORD //RecordCode[CR51]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_CreditReportSummaryRecordReport;
	END;
	
	EXPORT Layout_ConsumerNarrativeRecord := RECORD //RecordCode[CN51]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_ConsumerNarrativeRecordReport;
	END;
	
	EXPORT Layout_OtherIncomeRecord := RECORD //RecordCode[FI71]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_OtherIncomeRecordReport;
	END;
	
	EXPORT Layout_FinancingRecord := RECORD //RecordCode[FI72]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_FinancingRecordReport;
	END;
	
	EXPORT Layout_PublicItemRecord := RECORD //RecordCode[FI73]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_PublicItemRecordReport;
	END;
	
	EXPORT Layout_ForeclosureRecord := RECORD //RecordCode[FI74]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_ForeclosureRecordReport;
	END;
	
	EXPORT Layout_NonResponsibilityRecord := RECORD //RecordCode[FI75]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_NonResponsibilityRecordReport;
	END;

	EXPORT Layout_TaxLienRecord := RECORD //RecordCode[FI76]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_TaxLienRecordReport;
	END;
	
	EXPORT Layout_FinancialCounselorRecord := RECORD //RecordCode[FI77]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_FinancialCounselorRecordReport;
	END;
	
	EXPORT Layout_GarnishmentARecord := RECORD //RecordCode[FI78]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_GarnishmentARecordReport;
	END;
	
	EXPORT Layout_GarnishmentBRecord := RECORD //RecordCode[FI79]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_GarnishmentBRecordReport;
	END;
	
	EXPORT Layout_CheckingSavingsAccountRecord := RECORD //RecordCode[FI80]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_CheckingSavingsAccountRecordReport;
	END;
	
	EXPORT Layout_CreditTradeHistoryRecord := RECORD //RecordCode[FI90]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_CreditTradeHistoryRecordReport;
	END;
	
	EXPORT Layout_InquiryHistoryHeaderRecord := RECORD //RecordCode[IH51]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_InquiryHistoryHeaderRecordReport;
	END;		
	
	EXPORT Layout_PersonRecord := RECORD //RecordCode[PI51]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport2.t_PersonRecordReport;
	END;	
	
	EXPORT Layout_NonMemberRecord := RECORD //RecordCode[FI95]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_NonMemberRecordReport;
	END;

	EXPORT Layout_ForeignBureauRecord := RECORD //RecordCode[IS51]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport.t_ForeignBureauRecordReport;
	END;	
	
	EXPORT Layout_NarrativeBRecord := RECORD //RecordCode[NR52]
		Common_Data;
		Consumer_Credit_Layout.EDITSReport2.t_NarrativeBRecordReport;
	END;	
	
END;	