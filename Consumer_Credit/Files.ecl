IMPORT _Control, ut, Consumer_Credit_Layout;

EXPORT Files := MODULE

//	EXPORT IsProd := regexfind('dev', Constants.Region_Name, nocase);
	EXPORT prefix := '~';
	EXPORT base_prefix := prefix + 'thor::base::consumercredit';
	EXPORT base_ncf_prefix := prefix + 'thor::base::ncf';
	
//	EXPORT IsInProd := regexfind('prod', Constants.Region_Name, nocase);
	EXPORT Inprefix := '~';
	
	EXPORT Layout_Report := Consumer_Credit_Layout.Layout_Report;	

	EXPORT NCF_Transaction_Log := DATASET(Inprefix + 'thor::base::ncf::qa::transaction_log.txt', Consumer_Credit_Layout.LayoutTransactionLogs.transaction_log, THOR);
	
	EXPORT NCF_Master_Archive := DATASET(Inprefix + 'thor::base::ncf::qa::master_archive_report', Consumer_Credit_Layout.Layout_EditsArchive, THOR);

	EXPORT Report_Data_Raw := DATASET(base_prefix + '::prod::report', Consumer_Credit_Layout.Layout_EditsArchive_Append, THOR, OPT);
	EXPORT Report_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Report_Data_Raw, JOIN(DISTRIBUTE(Report_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT ReportRequest_Data_Raw := DATASET(base_prefix + '::prod::reportrequest', Consumer_Credit_Layout.Layout_Report.Layout_ReportRequestIdRecord, THOR, OPT);
	EXPORT ReportRequest_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, ReportRequest_Data_Raw, JOIN(DISTRIBUTE(ReportRequest_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT ReportIdSupplement_Data_Raw := DATASET(base_prefix + '::prod::reportidsupplement', Consumer_Credit_Layout.Layout_Report.Layout_ReportIdSupplementARecord, THOR, OPT);
	EXPORT ReportIdSupplement_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, ReportIdSupplement_Data_Raw, JOIN(DISTRIBUTE(ReportIdSupplement_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT CreditReportSummary_Data_Raw := DATASET(base_prefix + '::prod::creditreportsummary', Consumer_Credit_Layout.Layout_Report.Layout_CreditReportSummaryRecord, THOR, OPT);
	EXPORT CreditReportSummary_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, CreditReportSummary_Data_Raw, JOIN(DISTRIBUTE(CreditReportSummary_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT Bankruptcy_Data_Raw := DATASET(base_prefix + '::prod::bankruptcy', Consumer_Credit_Layout.Layout_Report.Layout_BankruptcyRecord, THOR, OPT);
	EXPORT Bankruptcy_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Bankruptcy_Data_Raw, JOIN(DISTRIBUTE(Bankruptcy_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
																
	EXPORT Collection_Data_Raw := DATASET(base_prefix + '::prod::collection', Consumer_Credit_Layout.Layout_Report.Layout_CollectionRecord, THOR, OPT);
	EXPORT Collection_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Collection_Data_Raw, JOIN(DISTRIBUTE(Collection_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT Employment_Data_Raw := DATASET(base_prefix + '::prod::employment', Consumer_Credit_Layout.Layout_Report.Layout_EmploymentRecord, THOR, OPT);
	EXPORT Employment_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Employment_Data_Raw, JOIN(DISTRIBUTE(Employment_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT TaxLien_Data_Raw := DATASET(base_prefix + '::prod::taxlien', Consumer_Credit_Layout.Layout_Report.Layout_TaxLienRecord, THOR, OPT);
	EXPORT TaxLien_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, TaxLien_Data_Raw, JOIN(DISTRIBUTE(TaxLien_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT TradeLine_Data_Raw := DATASET(base_prefix + '::prod::tradeline', Consumer_Credit_Layout.Layout_Report.Layout_CreditTradeHistoryRecord, THOR, OPT);
	EXPORT TradeLine_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, TradeLine_Data_Raw, JOIN(DISTRIBUTE(TradeLine_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT InquiryHistory_Data_Raw := DATASET(base_prefix + '::prod::inquiryhistory', Consumer_Credit_Layout.Layout_Report.Layout_InquiryHistoryHeaderRecord, THOR, OPT);
	EXPORT InquiryHistory_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, InquiryHistory_Data_Raw, JOIN(DISTRIBUTE(InquiryHistory_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT Address_Data_Raw := DATASET(base_prefix + '::prod::address', Consumer_Credit_Layout.Layout_Report.Layout_AddressRecord, THOR, OPT);	
	EXPORT Address_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Address_Data_Raw, JOIN(DISTRIBUTE(Address_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT Finance_Data_Raw := DATASET(base_prefix + '::prod::finance', Consumer_Credit_Layout.Layout_Report.Layout_FinancingRecord, THOR, OPT);	
	EXPORT Finance_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Finance_Data_Raw, JOIN(DISTRIBUTE(Finance_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT Judgement_Data_Raw := DATASET(base_prefix + '::prod::judgement', Consumer_Credit_Layout.Layout_Report.Layout_PublicItemRecord, THOR, OPT);	
	EXPORT Judgement_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Judgement_Data_Raw, JOIN(DISTRIBUTE(Judgement_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT NarrativeA_Data_Raw := DATASET(base_prefix + '::prod::narrativea', Consumer_Credit_Layout.Layout_Report.Layout_NarrativeARecord, THOR, OPT);
	EXPORT NarrativeA_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, NarrativeA_Data_Raw, JOIN(DISTRIBUTE(NarrativeA_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT Person_Data_Raw := DATASET(base_prefix + '::prod::person', Consumer_Credit_Layout.Layout_Report.Layout_PersonRecord, THOR, OPT);
	EXPORT Person_Data := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Person_Data_Raw, JOIN(DISTRIBUTE(Person_Data_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT AuditLog_Data := DATASET(base_prefix + '::prod::auditlog', Consumer_Credit_Layout.Layout_AuditLog, THOR, OPT);
	
	EXPORT TransactionLogLiensJudgements_Raw  := DATASET(base_ncf_prefix + '::laj::Liens_JudgementsData', Consumer_Credit_Layout.Layout_Transaction_Log_Lien_Judgement.t_Transaction_Log_Lien_JudgementRecord_csv, CSV(heading(0), SEPARATOR('|'), TERMINATOR('\n')),OPT);
	EXPORT TransactionLogLiensJudgements := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, TransactionLogLiensJudgements_Raw, JOIN(DISTRIBUTE(TransactionLogLiensJudgements_Raw, HASH64((STRING75)Transaction_ID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.Transaction_ID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
	
	EXPORT TransactionLogLiensJudgements_File  :='~thor::base::ncf::laj::Liens_JudgementsData';
	
	EXPORT Lien_JudgementsData_Raw := DATASET(base_ncf_prefix + '::Prod::Liens_JudgementsData', Consumer_Credit_Layout.Layout_Log_NCF_Transaction_Log_Liens_Judgements, THOR,OPT);
	EXPORT Lien_JudgementsData := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, Lien_JudgementsData_Raw, JOIN(DISTRIBUTE(Lien_JudgementsData_Raw, HASH64((STRING75)TransactionID)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.TransactionID = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
END;
