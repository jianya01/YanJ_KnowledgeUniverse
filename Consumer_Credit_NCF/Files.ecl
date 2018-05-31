IMPORT ut, Consumer_Credit_Layout;

EXPORT Files := MODULE

//	EXPORT IsProd := regexfind('dev', Constants.Region_Name, nocase);
	EXPORT prefix := '~';
	EXPORT base_prefix := prefix + 'thor::base::consumercredit';
	EXPORT base_ncf_prefix := prefix + 'thor::base::ncf';
	
//	EXPORT IsInProd := regexfind('prod', Constants.Region_Name, nocase);
	EXPORT Inprefix := '~';
	
	EXPORT Layout_Report := Consumer_Credit_Layout.Layout_Report;	

	// EXPORT NCF_Transaction_Log := DATASET(ut.foreign_production_alpha + 'thor::base::ncf::qa::transaction_log.txt', Consumer_Credit_Layout.LayoutTransactionLogs.transaction_log, THOR);
	
	EXPORT NCF_Transaction_Log := DATASET( '~thor::base::ncf_tst::20180417::transaction_log.txt', Consumer_Credit_Layout.LayoutTransactionLogs.transaction_log_new, THOR);

	
	EXPORT NCF_Master_Archive := DATASET(Inprefix + 'thor::base::ncf::qa::master_archive_report', Consumer_Credit_Layout.Layout_EditsArchive, THOR);

	EXPORT Report_Data := DATASET(base_prefix + '::prod::report', Consumer_Credit_Layout.Layout_EditsArchive_Append, THOR, OPT);
	
	EXPORT ReportRequest_Data := DATASET(base_prefix + '::prod::reportrequest', Consumer_Credit_Layout.Layout_Report.Layout_ReportRequestIdRecord, THOR, OPT);
	
	EXPORT ReportIdSupplement_Data := DATASET(base_prefix + '::prod::reportidsupplement', Consumer_Credit_Layout.Layout_Report.Layout_ReportIdSupplementARecord, THOR, OPT);
	
	EXPORT CreditReportSummary_Data := DATASET(base_prefix + '::prod::creditreportsummary', Consumer_Credit_Layout.Layout_Report.Layout_CreditReportSummaryRecord, THOR, OPT);
	
	EXPORT Bankruptcy_Data := DATASET(base_prefix + '::prod::bankruptcy', Consumer_Credit_Layout.Layout_Report.Layout_BankruptcyRecord, THOR, OPT);
	  																
	EXPORT Collection_Data := DATASET(base_prefix + '::prod::collection', Consumer_Credit_Layout.Layout_Report.Layout_CollectionRecord, THOR, OPT);
	
	EXPORT Employment_Data := DATASET(base_prefix + '::prod::employment', Consumer_Credit_Layout.Layout_Report.Layout_EmploymentRecord, THOR, OPT);
	
	EXPORT TaxLien_Data := DATASET(base_prefix + '::prod::taxlien', Consumer_Credit_Layout.Layout_Report.Layout_TaxLienRecord, THOR, OPT);
	
	EXPORT TradeLine_Data := DATASET(base_prefix + '::prod::tradeline', Consumer_Credit_Layout.Layout_Report.Layout_CreditTradeHistoryRecord, THOR, OPT);
	
	EXPORT InquiryHistory_Data := DATASET(base_prefix + '::prod::inquiryhistory', Consumer_Credit_Layout.Layout_Report.Layout_InquiryHistoryHeaderRecord, THOR, OPT);

	EXPORT Address_Data := DATASET(base_prefix + '::prod::address', Consumer_Credit_Layout.Layout_Report.Layout_AddressRecord, THOR, OPT);	
	
	EXPORT Finance_Data := DATASET(base_prefix + '::prod::finance', Consumer_Credit_Layout.Layout_Report.Layout_FinancingRecord, THOR, OPT);	
	
	EXPORT Judgement_Data := DATASET(base_prefix + '::prod::judgement', Consumer_Credit_Layout.Layout_Report.Layout_PublicItemRecord, THOR, OPT);	
	
	EXPORT NarrativeA_Data := DATASET(base_prefix + '::prod::narrativea', Consumer_Credit_Layout.Layout_Report.Layout_NarrativeARecord, THOR, OPT);
	
	EXPORT Person_Data := DATASET(base_prefix + '::prod::person', Consumer_Credit_Layout.Layout_Report.Layout_PersonRecord, THOR, OPT);

	EXPORT TransactionLogLiensJudgements  := DATASET(base_ncf_prefix + '::laj::transaction_log_lien_judgment', Consumer_Credit_Layout.Layout_Transaction_Log_Lien_Judgement.t_Transaction_Log_Lien_JudgementRecord_csv, CSV(heading(0), SEPARATOR('|'), TERMINATOR('\n')));
	
	EXPORT TransactionLogLiensJudgements_File  :='~thor::base::ncf::laj::Liens_JudgementsData';
	
	EXPORT Lien_JudgementsData := DATASET(base_ncf_prefix + '::Prod::Liens_JudgementsData', Consumer_Credit_Layout.Layout_Log_NCF_Transaction_Log_Liens_Judgements, THOR,OPT);
	
END;