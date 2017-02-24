﻿EXPORT Layout_AuditLog := RECORD
	STRING8 Load_Date;
	STRING8 Build_Start_Date;
	STRING8 Build_End_Date;
	UNSIGNED8 Count_Of_Transactions;
	UNSIGNED8 Count_Of_Duplicate_Reference_Numbers_In_TransactionLog;
	UNSIGNED8 ReportRequest_Records;
	UNSIGNED8 ReportIdSupplement_Records;
	UNSIGNED8 Address_Records;
	UNSIGNED8 BankRuptcy_Records;
	UNSIGNED8 Collection_Records;
	UNSIGNED8 CreditReportSummary_Records;
	UNSIGNED8 Employment_Records;
	UNSIGNED8 InquiryHistory_Records;
	UNSIGNED8 Judgement_Records;
	UNSIGNED8 NarrativeA_Records;
	UNSIGNED8 Person_Records;
	UNSIGNED8 TaxLien_Records;
	UNSIGNED8 TradeLine_Records;
	UNSIGNED8 Primary_Credit_Reports;
	UNSIGNED8 Spousal_Credit_Reports;
	UNSIGNED8 Primary_Credit_Reports_Without_LexID;
	UNSIGNED8 Spousal_Credit_Reports_Without_LexID;	
END;