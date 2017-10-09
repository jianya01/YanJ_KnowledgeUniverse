IMPORT Consumer_Credit_Layout;

EXPORT Build_Record_NCF2 := MODULE

	EXPORT Report_Data := DATASET('~thor::base::consumercredit::complete_report',Consumer_Credit_Layout.Layout_EditsArchive_Append_2,thor);

	EXPORT ReportRequest := PROJECT(Report_Data(Edits[7..10]='RI51'),
									 TRANSFORM(Layout_Report.Layout_ReportRequestIdRecord,	
									 SELF := EditsToXml.AssignRI51(LEFT.Edits),
									 SELF.BureauCode := '';
									 SELF := LEFT));

	EXPORT ReportIdSupplement := PROJECT(Report_Data(Edits[7..10]='RI52'),
											  TRANSFORM(Layout_Report.Layout_ReportIdSupplementARecord,	
											  SELF := EditsToXml.AssignRI52(LEFT.Edits),
											  SELF := LEFT));

	EXPORT CreditReportSummary := PROJECT(Report_Data(Edits[7..10]='CR51'),
											   TRANSFORM(Layout_Report.Layout_CreditReportSummaryRecord,	
											   SELF := EditsToXml.AssignCR51(LEFT.Edits),
											   SELF := LEFT));
									 
	EXPORT Bankruptcy := PROJECT(Report_Data(Edits[7..10]='FI61'),
								TRANSFORM(Layout_Report.Layout_BankruptcyRecord,	
								SELF := EditsToXml.AssignFI61(LEFT.Edits),
								SELF := LEFT));

	EXPORT Collection := PROJECT(Report_Data(Edits[7..10]='FI81'),
								TRANSFORM(Layout_Report.Layout_CollectionRecord,
								SELF := EditsToXml.AssignFI81(LEFT.Edits),
								SELF := LEFT));

	EXPORT Employment := PROJECT(Report_Data(Edits[7..10]='OE53'),
								TRANSFORM(Layout_Report.Layout_EmploymentRecord,
								SELF := EditsToXml.AssignOE53(LEFT.Edits),
								SELF := LEFT));

	EXPORT TaxLien 	 := PROJECT(Report_Data(Edits[7..10]='FI76'),
								TRANSFORM(Layout_Report.Layout_TaxLienRecord,
								SELF := EditsToXml.AssignFI76(LEFT.Edits),
								SELF := LEFT));
								
	EXPORT TradeLine  := PROJECT(Report_Data(Edits[7..10]='FI90'),
								TRANSFORM(Layout_Report.Layout_CreditTradeHistoryRecord,
								SELF := EditsToXml.AssignFI90(LEFT.Edits),
								SELF := LEFT));
								
	EXPORT InquiryHistory := PROJECT(Report_Data(Edits[7..10]='IH51'),
								TRANSFORM(Layout_Report.Layout_InquiryHistoryHeaderRecord,
								SELF := EditsToXml.AssignIH51(LEFT.Edits),
								SELF := LEFT));
								
	EXPORT Address		 := PROJECT(Report_Data(Edits[7..10]='AL51'),
								TRANSFORM(Layout_Report.Layout_AddressRecord,
								SELF := EditsToXml.AssignAL51(LEFT.Edits),
								SELF := LEFT));
								
	EXPORT Judgement := PROJECT(Report_Data(Edits[7..10]='FI73'),
								TRANSFORM(Layout_Report.Layout_PublicItemRecord,
								SELF := EditsToXml.AssignFI73(LEFT.Edits),
								SELF := LEFT));

	EXPORT NarrativeA := PROJECT(Report_Data(Edits[7..10]='NR51'),
								TRANSFORM(Layout_Report.Layout_NarrativeARecord,
								SELF := EditsToXml.AssignNR51(LEFT.Edits),
								SELF := LEFT));
								
	EXPORT Person     := PROJECT(Report_Data(Edits[7..10]='PI51'),
								TRANSFORM(Layout_Report.Layout_PersonRecord,
								SELF := EditsToXml.AssignPI51(LEFT.Edits),
								SELF := LEFT));			
				
	EXPORT CreditReportSummary_CR52    := PROJECT(Report_Data(Edits[7..10]='CR52'),
								TRANSFORM(Layout_Report.Layout_CreditReportSummary_CR52,
								SELF := EditsToXml.AssignCR52(LEFT.Edits),
								SELF := LEFT));	
								
	EXPORT EnhancedCreditTrade_FI91     := PROJECT(Report_Data(Edits[7..10]='FI91'),
								TRANSFORM(Layout_Report.Layout_EnhancedCreditTrade_FI91,
								SELF := EditsToXml.AssignFI91(LEFT.Edits),
								SELF := LEFT));	
				
	EXPORT FinancialPaymentPattern_FI92     := PROJECT(Report_Data(Edits[7..10]='FI92'),
								TRANSFORM(Layout_Report.Layout_FinancialPaymentPattern_FI92,
								SELF := EditsToXml.AssignFI92(LEFT.Edits),
								SELF := LEFT));	
				
	EXPORT FinancialTrendedData_FI93     := PROJECT(Report_Data(Edits[7..10]='FI93'),
								TRANSFORM(Layout_Report.Layout_FinancialTrendedData_FI93,
								SELF := EditsToXml.AssignFI93(LEFT.Edits),
								SELF := LEFT));	
						 
END;