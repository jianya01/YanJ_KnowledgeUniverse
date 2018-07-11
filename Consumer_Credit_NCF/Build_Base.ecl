IMPORT ut, Consumer_Credit_Layout, STD;

EXPORT Build_Base(STRING8 InputStartDate = '', STRING8 InputEndDate = '', STRING1 Skip_Validation = 'N') := FUNCTION

		Layout_EditsArchive_Append_2 := Consumer_Credit_Layout.Layout_EditsArchive_Append_2;		
		
		STRING8 Indate := GLOBAL(WORKUNIT[2..9]);		
		
		Start_Date := IF(InputStartDate != '', InputStartDate, ut.DateFrom_DaysSince1900(ut.DaysSince1900(Indate[1..4], Indate[5..6], Indate[7..8]) - Constants.BufferDuration - 6));
		Start_Julian_Date := (UNSIGNED2)getJulianDate(Start_Date)[3..];
		
		End_Date :=  IF(InputEndDate != '', InputEndDate, ut.DateFrom_DaysSince1900(ut.DaysSince1900(Indate[1..4], Indate[5..6], Indate[7..8]) - Constants.BufferDuration));
		End_Julian_Date := (UNSIGNED2)getJulianDate(End_Date)[3..];

		// Max_Load_Date := ut.JultoYYYYMMDD('20' + (STRING)MAX(Files.ReportRequest_Data, JulianDate));
		// DayGap := ut.DaysSince1900(Start_Date[1..4], Start_Date[5..6], Start_Date[7..8]) - ut.DaysSince1900(Max_Load_Date[1..4], Max_Load_Date[5..6], Max_Load_Date[7..8]); 
		
		DS_Master_Archive_File := DATASET('~thor::base::ncf_tst::20180417::master_archive_report',Consumer_Credit_Layout.Layout_EditsArchive,thor);
		
		DS_BASE_MST_ARCHIVE_REPORT := PROJECT(DS_Master_Archive_File(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date),
																	TRANSFORM(Layout_EditsArchive_Append_2, 
																	SELF.OriginalRefNo := (UNSIGNED6) ConvertRefNo(LEFT.JulianDate, LEFT.RemainingRefNo, LEFT.ReportSource),	
																	SELF := LEFT, 
																	SELF := []));
																	
		DS_BASE_MST_ARCHIVE_REPORT_DIST := SORT(DISTRIBUTE(DS_BASE_MST_ARCHIVE_REPORT, HASH32(OriginalRefNo)),JulianDate,RemainingRefNo,ReportSource,LineNumber,LOCAL);

		DS_BASE_MST_ARCHIVE_REPORT_ITER := ITERATE(DS_BASE_MST_ARCHIVE_REPORT_DIST,
		 TRANSFORM(Layout_EditsArchive_Append_2,
		 SELF.ReportTypeCounter  		 := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 1,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'RI51' AND RIGHT.Edits[94] IN Consumer_Credit_NCF.Constants.Joint_Order_Type) => 2,
													 LEFT.ReportTypeCounter),
		 SELF.BureauCode  					 := MAP(
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'RI52' AND RIGHT.Edits[117] = 'X') => 'XPN',
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'RI52' AND RIGHT.Edits[117] = 'T') => 'TRU',
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'RI52' AND RIGHT.Edits[117] = 'E') => 'EFX',
													 LEFT.BureauCode),
		 SELF.RecordTypeCounter  		 := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] IN Consumer_Credit_NCF.Constants.Tradeline_Type_Set) => LEFT.RecordTypeCounter,		 
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND (RIGHT.Edits[7..10] IN Consumer_Credit_NCF.Constants.Record_Type_Set OR RIGHT.Edits[7..19] IN Consumer_Credit_NCF.Constants.Message_Type_Set)) => LEFT.RecordTypeCounter + 1,
													 LEFT.RecordTypeCounter),													
		 SELF.NarrativeRemarkCounter := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND (LEFT.Edits[7..10] IN Consumer_Credit_NCF.Constants.Record_Type_Set OR LEFT.Edits[7..19] IN Consumer_Credit_NCF.Constants.Message_Type_Set OR LEFT.Edits[7..10] = 'NR52') AND RIGHT.Edits[7..10] = 'NR51') => LEFT.NarrativeRemarkCounter + 1,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND LEFT.Edits[7..10] = 'NR51' AND RIGHT.Edits[7..10] = 'NR51' AND LEFT.NarrativeRemarkCounter > 0) => LEFT.NarrativeRemarkCounter + 1,
													 0),													  																													 
		 SELF.SH51Type 					 := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..19] = Consumer_Credit_NCF.Constants.SH51_Inqry) => 1,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..19] = Consumer_Credit_NCF.Constants.SH51_Ident) => 2,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'SH51' AND RIGHT.Edits[7..19] NOT IN [Consumer_Credit_NCF.Constants.SH51_Inqry, Consumer_Credit_NCF.Constants.SH51_Ident]) => 0,
													 LEFT.SH51Type),
		 SELF.SH51TypeSeq 				:= MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'SH51') => 0,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND LEFT.SH51Type IN [1, 2]) => LEFT.SH51TypeSeq + 1,
													0),			
		 SELF.FI90Seq 					 := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'FI90') => LEFT.FI90Seq + 1,
													LEFT.FI90Seq),
		 SELF.FI93Seq 					 := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
													(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'FI93') => LEFT.FI93Seq + 1,
													LEFT.FI93Seq),
		 // Added logic to meet the Modeling requirement of setting the Date_Reported with the report header DateOfReceipt value
		 SELF.Date_Reported  		 := MAP(((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR 
																		 (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) AND 
																			RIGHT.Edits[7..10] = 'RI51') => EditsToXml.FormatDate(RIGHT.Edits[127..134]),
																		(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo) => LEFT.Date_Reported,
																		LEFT.Date_Reported),
		 SELF := RIGHT), LOCAL);															 
																	 
		DuplicateReports := DEDUP(SORT(DISTRIBUTE(DS_BASE_MST_ARCHIVE_REPORT_ITER(Edits[7..10] = 'NR52' AND Edits[15..16] = 'GM' AND STD.Str.Find(Edits, 'DUPLICATE REPORT', 1) > 0), HASH32(OriginalRefNo)), 
																	 OriginalRefNo, LOCAL), OriginalRefNo, LOCAL);	
																	 
		Exclude_Duplicate_Reports := JOIN(DS_BASE_MST_ARCHIVE_REPORT_ITER, DuplicateReports,
																 LEFT.OriginalRefNo = RIGHT.OriginalRefNo,
																 TRANSFORM(Layout_EditsArchive_Append_2,
																 // SELF.RecordTypeCounter := IF(LEFT.Edits[7..10] IN Constants.Record_Type_Set OR LEFT.Edits[7..19] IN Constants.Message_Type_Set OR LEFT.NarrativeRemarkCounter != 0, LEFT.RecordTypeCounter, 0),
																 SELF.SH51Type := IF(LEFT.Edits[7..10] IN ['PI51', 'AL51'] OR LEFT.Edits[7..19] IN [Constants.SH51_Inqry, Constants.SH51_Ident], LEFT.SH51Type, 0),
																 SELF.SH51TypeSeq := IF(LEFT.Edits[7..10] IN ['PI51', 'AL51'], LEFT.SH51TypeSeq, 0),
																 SELF := LEFT), LEFT ONLY, LOCAL);

		InValidStatus_Reports := DEDUP(SORT(DISTRIBUTE(Exclude_Duplicate_Reports(Edits[7..10] = 'RI51' AND Edits[143] NOT IN ['C', 'U']), HASH32(OriginalRefNo)), 
																	 OriginalRefNo, ReportTypeCounter, LOCAL), OriginalRefNo, ReportTypeCounter, LOCAL);

		Exclude_InValidStatus_Reports := JOIN(Exclude_Duplicate_Reports, InValidStatus_Reports,
																		 LEFT.OriginalRefNo = RIGHT.OriginalRefNo AND
																		 LEFT.ReportTypeCounter = RIGHT.ReportTypeCounter,
																		 TRANSFORM(Layout_EditsArchive_Append_2,
																		 SELF := LEFT), LEFT ONLY, LOCAL);

 		TransactionLog := Files.NCF_Transaction_Log ;
   		// ((UNSIGNED2)reference_number[1..5] BETWEEN Start_Julian_Date AND End_Julian_Date AND
   																								 // Customer_Number NOT IN Constants.Test_Customers) : INDEPENDENT;
   											
		TransactionLogDupeRef := TABLE(DISTRIBUTE(TransactionLog, HASH32(reference_number)), {reference_number, CountRef := COUNT(GROUP)}, reference_number, LOCAL)(CountRef > 1) : INDEPENDENT;
														 
		TransactionLog_ExcludeDupe := JOIN(TransactionLog, TransactionLogDupeRef,
																	LEFT.reference_number = RIGHT.reference_number,
																	TRANSFORM(Consumer_Credit_Layout.LayoutTransactionLogs.transaction_log, SELF := LEFT), LEFT ONLY, MANY LOOKUP);
																	
		TransactionLog_Include := IF(COUNT(TransactionLogDupeRef) > 0, TransactionLog_ExcludeDupe, TransactionLog); 																	
 
		WeeklyTotalData := JOIN(Exclude_InValidStatus_Reports, TransactionLog, 
											 LEFT.OriginalRefNo = (UNSIGNED6) RIGHT.reference_number,
											 TRANSFORM(Layout_EditsArchive_Append_2,
											 SELF.Transaction_Id := RIGHT.Transaction_Id,
											 SELF.LexID := IF(LEFT.ReportTypeCounter = 2, RIGHT.spouse_lex_id, RIGHT.individual_lex_id),
											 // SELF.Date_Reported := RIGHT.date_added[1..4] + RIGHT.date_added[6..7] + RIGHT.date_added[9..10],
											 SELF := LEFT), HASH) : INDEPENDENT;
										 
		WeeklyData := WeeklyTotalData(LexID != 0);										 
										 
		CompleteData :=  WeeklyTotalData;										 
		
		// Primary_Credit_Reports := DEDUP(SORT(DISTRIBUTE(WeeklyTotalData(ReportTypeCounter = 1), HASH32(OriginalRefNo)), OriginalRefNo, LOCAL), OriginalRefNo, LOCAL);
		// Spousal_Credit_Reports := DEDUP(SORT(DISTRIBUTE(WeeklyTotalData(ReportTypeCounter = 2), HASH32(OriginalRefNo)), OriginalRefNo, LOCAL), OriginalRefNo, LOCAL);
		
		// AuditLog_Data := DATASET([{Indate,
															 // Start_Date,
															 // End_Date,
															 // COUNT(TransactionLog),
															 // COUNT(TransactionLogDupeRef),
															 // 0,0,0,0,0,0,0,0,0,0,0,0,0,
															 // COUNT(Primary_Credit_Reports),
															 // COUNT(Spousal_Credit_Reports),
															 // COUNT(Primary_Credit_Reports(LexID = 0)),
															 // COUNT(Spousal_Credit_Reports(LexID = 0))}],
															// Consumer_Credit_Layout.Layout_AuditLog);
		
		// ValidationSubject := 'The Consumer Credit input process validation failed for '+ TRIM(Indate);
		// ValidationBody    := 'The Consumer Credit input process validation failed for '+ TRIM(Indate) +'\n\n'+
												 // 'The workunit is ' + WORKUNIT + '\n\n' +
												 // 'Previously Loaded Until : ' + Max_Load_Date + '\n\n' +
												 // 'Current Load Request Start Date : ' + Start_Date + '\n\n';

		// ValidationEmail		:= Fileservices.Sendemail(EmailAddresses.ConsumerCredit_EmailAddresses, ValidationSubject, ValidationBody);
		
		// SuccessSubject 		:= 'The Consumer Credit files build successful for ' + TRIM(Indate);
		// SuccessBody    		:= 'The Consumer Credit files build successful for '+ TRIM(Indate) +'\n\n'+
												 // 'The workunit is '+ WORKUNIT +'\n\n';
												 
		// FailureSubject 		:= 'The Consumer Credit files build failed for ' + TRIM(Indate);
		// FailureBody    		:= 'The Consumer Credit files build failed for ' + TRIM(Indate) +'\n\n'+
												 // 'The workunit is ' + WORKUNIT + '\n\n' +
												 // 'ErrorMessage is ' + FAILMESSAGE + '\n\n';												 
												 
    // BuildFiles := SEQUENTIAL(FileUtil.FN_OutputAndPromoteFile(CompleteData, Files.base_prefix, 'report', WORKUNIT[2..9]  + WORKUNIT[11..16]),
														 // Build_Records(WeeklyData),
														 // Build_AuditLog(AuditLog_Data, Start_Julian_Date, End_Julian_Date),
														 // Fileservices.Sendemail(EmailAddresses.ConsumerCredit_EmailAddresses, SuccessSubject, SuccessBody))
														 // :FAILURE(Fileservices.Sendemail(EmailAddresses.ConsumerCredit_EmailAddresses, FailureSubject, FailureBody));	

			FINAL := OUTPUT(CompleteData,,'~thor::base::consumercredit::complete_report_new_'+GLOBAL(WORKUNIT[2..]),COMPRESSED,OVERWRITE);		
			RETURN FINAL;
			
		// RETURN IF(Skip_Validation = 'N' AND DayGap != 1, ValidationEmail, BuildFiles);

END;