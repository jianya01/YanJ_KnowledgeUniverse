IMPORT ut, Consumer_Credit_Layout;

EXPORT Files := MODULE

//	EXPORT IsProd := regexfind('dev', Constants.Region_Name, nocase);
	EXPORT prefix := '~';
	EXPORT base_prefix := prefix + 'thor::base::consumercredit';
	
//	EXPORT IsInProd := regexfind('prod', Constants.Region_Name, nocase);
	EXPORT Inprefix := '~';
	
	EXPORT Layout_Report := Consumer_Credit_Layout.Layout_Report;	

	EXPORT NCF_Transaction_Log := DATASET(Inprefix + 'thor::base::ncf::qa::transaction_log.txt', Consumer_Credit_Layout.LayoutTransactionLogs.transaction_log, THOR);
	
	EXPORT NCF_Master_Archive := DATASET(Inprefix + 'thor::base::ncf::qa::master_archive_report', Consumer_Credit_Layout.Layout_EditsArchive, THOR);

	EXPORT Report_Data := DATASET(base_prefix + '::prod::report', Consumer_Credit_Layout.Layout_EditsArchive_Append, THOR, OPT);
	
	EXPORT ReportRequest_Data := DATASET(base_prefix + '::prod::reportrequest', Layout_Report.Layout_ReportRequestIdRecord, THOR, OPT);
	
	EXPORT ReportIdSupplement_Data := DATASET(base_prefix + '::prod::reportidsupplement', Layout_Report.Layout_ReportIdSupplementARecord, THOR, OPT);
	
	EXPORT CreditReportSummary_Data := DATASET(base_prefix + '::prod::creditreportsummary', Layout_Report.Layout_CreditReportSummaryRecord, THOR, OPT);
	
	EXPORT Bankruptcy_Data := DATASET(base_prefix + '::prod::bankruptcy', Layout_Report.Layout_BankruptcyRecord, THOR, OPT);
	  																
	EXPORT Collection_Data := DATASET(base_prefix + '::prod::collection', Layout_Report.Layout_CollectionRecord, THOR, OPT);
	
	EXPORT Employment_Data := DATASET(base_prefix + '::prod::employment', Layout_Report.Layout_EmploymentRecord, THOR, OPT);
	
	EXPORT TaxLien_Data := DATASET(base_prefix + '::prod::taxlien', Layout_Report.Layout_TaxLienRecord, THOR, OPT);
	
	EXPORT TradeLine_Data := DATASET(base_prefix + '::prod::tradeline', Layout_Report.Layout_CreditTradeHistoryRecord, THOR, OPT);
	
	EXPORT InquiryHistory_Data := DATASET(base_prefix + '::prod::inquiryhistory', Layout_Report.Layout_InquiryHistoryHeaderRecord, THOR, OPT);

	EXPORT Address_Data := DATASET(base_prefix + '::prod::address', Layout_Report.Layout_AddressRecord, THOR, OPT);	
	
	EXPORT Finance_Data := DATASET(base_prefix + '::prod::finance', Layout_Report.Layout_FinancingRecord, THOR, OPT);	
	
	EXPORT Judgement_Data := DATASET(base_prefix + '::prod::judgement', Layout_Report.Layout_PublicItemRecord, THOR, OPT);	
	
	EXPORT NarrativeA_Data := DATASET(base_prefix + '::prod::narrativea', Layout_Report.Layout_NarrativeARecord, THOR, OPT);
	
	EXPORT Person_Data := DATASET(base_prefix + '::prod::person', Layout_Report.Layout_PersonRecord, THOR, OPT);
	
END;