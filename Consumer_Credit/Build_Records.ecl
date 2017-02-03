IMPORT Consumer_Credit_Layout;

EXPORT Build_Records(DATASET(Consumer_Credit_Layout.Layout_EditsArchive_Append) Report_Data) := FUNCTION

	Layout_Report := Consumer_Credit_Layout.Layout_Report;
	
	ReportRequest := PROJECT(Report_Data(Edits[7..10]='RI51'),
									 TRANSFORM(Layout_Report.Layout_ReportRequestIdRecord,	
									 SELF := EditsToXml.AssignRI51(LEFT.Edits),
									 SELF := LEFT));

	ReportIdSupplement := PROJECT(Report_Data(Edits[7..10]='RI52'),
											  TRANSFORM(Layout_Report.Layout_ReportIdSupplementARecord,	
											  SELF := EditsToXml.AssignRI52(LEFT.Edits),
											  SELF := LEFT));

	CreditReportSummary := PROJECT(Report_Data(Edits[7..10]='CR51'),
											   TRANSFORM(Layout_Report.Layout_CreditReportSummaryRecord,	
											   SELF := EditsToXml.AssignCR51(LEFT.Edits),
											   SELF := LEFT));
									 
	BankRuptcy := PROJECT(Report_Data(Edits[7..10]='FI61'),
								TRANSFORM(Layout_Report.Layout_BankruptcyRecord,	
								SELF := EditsToXml.AssignFI61(LEFT.Edits),
								SELF := LEFT));

	Collection := PROJECT(Report_Data(Edits[7..10]='FI81'),
								TRANSFORM(Layout_Report.Layout_CollectionRecord,
								SELF := EditsToXml.AssignFI81(LEFT.Edits),
								SELF := LEFT));

	Employment := PROJECT(Report_Data(Edits[7..10]='OE53'),
								TRANSFORM(Layout_Report.Layout_EmploymentRecord,
								SELF := EditsToXml.AssignOE53(LEFT.Edits),
								SELF := LEFT));

	TaxLien 	 := PROJECT(Report_Data(Edits[7..10]='FI76'),
								TRANSFORM(Layout_Report.Layout_TaxLienRecord,
								SELF := EditsToXml.AssignFI76(LEFT.Edits),
								SELF := LEFT));
								
	TradeLine  := PROJECT(Report_Data(Edits[7..10]='FI90'),
								TRANSFORM(Layout_Report.Layout_CreditTradeHistoryRecord,
								SELF := EditsToXml.AssignFI90(LEFT.Edits),
								SELF := LEFT));
								
	InquiryHistory := PROJECT(Report_Data(Edits[7..10]='IH51'),
								TRANSFORM(Layout_Report.Layout_InquiryHistoryHeaderRecord,
								SELF := EditsToXml.AssignIH51(LEFT.Edits),
								SELF := LEFT));
								
	Address		 := PROJECT(Report_Data(Edits[7..10]='AL51'),
								TRANSFORM(Layout_Report.Layout_AddressRecord,
								SELF := EditsToXml.AssignAL51(LEFT.Edits),
								SELF := LEFT));
								
	Judgement := PROJECT(Report_Data(Edits[7..10]='FI73'),
								TRANSFORM(Layout_Report.Layout_PublicItemRecord,
								SELF := EditsToXml.AssignFI73(LEFT.Edits),
								SELF := LEFT));

	NarrativeA := PROJECT(Report_Data(Edits[7..10]='NR51'),
								TRANSFORM(Layout_Report.Layout_NarrativeARecord,
								SELF := EditsToXml.AssignNR51(LEFT.Edits),
								SELF := LEFT));
								
	Person     := PROJECT(Report_Data(Edits[7..10]='PI51'),
								TRANSFORM(Layout_Report.Layout_PersonRecord,
								SELF := EditsToXml.AssignPI51(LEFT.Edits),
								SELF := LEFT));
								
	BuildFiles := SEQUENTIAL(FileUtil.FN_OutputAndPromoteFile(Files.ReportRequest_Data + ReportRequest, Files.base_prefix, 'reportrequest', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.ReportIdSupplement_Data + ReportIdSupplement, Files.base_prefix, 'reportidsupplement', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.CreditReportSummary_Data + CreditReportSummary, Files.base_prefix, 'creditreportsummary', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.Bankruptcy_Data + BankRuptcy, Files.base_prefix, 'bankruptcy', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.Collection_Data + Collection, Files.base_prefix, 'collection', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.Employment_Data + Employment, Files.base_prefix, 'employment', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.TaxLien_Data + TaxLien, Files.base_prefix, 'taxlien', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.TradeLine_Data + TradeLine, Files.base_prefix, 'tradeline', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.InquiryHistory_Data + InquiryHistory, Files.base_prefix, 'inquiryhistory', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.Address_Data + Address, Files.base_prefix, 'address', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.Judgement_Data + Judgement, Files.base_prefix, 'judgement', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.NarrativeA_Data + NarrativeA, Files.base_prefix, 'narrativea', WORKUNIT[2..9]  + WORKUNIT[11..16]),
													 FileUtil.FN_OutputAndPromoteFile(Files.Person_Data + Person, Files.base_prefix, 'person', WORKUNIT[2..9]  + WORKUNIT[11..16]));
												 
  RETURN BuildFiles;										
					 
END;