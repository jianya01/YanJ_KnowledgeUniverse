IMPORT ut, Consumer_Credit_Layout, STD, Model_Scoring, CLUEAuto;

EXPORT Build_ScoringBase := FUNCTION

		Layout_EditsArchive_Append := Consumer_Credit_Layout.Layout_EditsArchive_Append;		
		
		STRING8 Indate := GLOBAL(WORKUNIT[2..9]);		

		DSscoring := DATASET('~scoring::input::2012::ncfreport_consumercredit_slim_scoring',MODEL_Scoring.Layout_ReportRaw, THOR)(line[7..10] != '');
		
		DS_BASE_MST_ARCHIVE_REPORT := PROJECT(DSscoring,
																	TRANSFORM(Consumer_Credit_Layout.Layout_EditsArchive_Append, 
																	SELF.JulianDate := (UNSIGNED2) LEFT.LastID[1..5],
																	SELF.RemainingRefNo := (UNSIGNED4) LEFT.LastID[6..14],
																	SELF.ReportSource := 0,
																	SELF.OriginalRefNo := (UNSIGNED6) LEFT.LastID,	
																	SELF.Edits := LEFT.Line,	
																	SELF := LEFT, 
																	SELF := []));
																	
		DS_BASE_MST_ARCHIVE_REPORT_DIST := SORT(DISTRIBUTE(DS_BASE_MST_ARCHIVE_REPORT, HASH32(OriginalRefNo)),JulianDate,RemainingRefNo,ReportSource,LineNumber,LOCAL);

		DS_BASE_MST_ARCHIVE_REPORT_ITER := ITERATE(DS_BASE_MST_ARCHIVE_REPORT_DIST,
																			 TRANSFORM(Layout_EditsArchive_Append,
																			 SELF.ReportTypeCounter  		 := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 1,
																																					(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'RI51' AND RIGHT.Edits[94] IN Constants.Joint_Order_Type) => 2,
																																					 LEFT.ReportTypeCounter),
																			 SELF.RecordTypeCounter  		 := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
																																					(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND (RIGHT.Edits[7..10] IN Constants.Record_Type_Set OR RIGHT.Edits[7..19] IN Constants.Message_Type_Set)) => LEFT.RecordTypeCounter + 1,
																																					 LEFT.RecordTypeCounter),													
																			 SELF.NarrativeRemarkCounter := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
																																					(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND (LEFT.Edits[7..10] IN Constants.Record_Type_Set OR LEFT.Edits[7..19] IN Constants.Message_Type_Set OR LEFT.Edits[7..10] = 'NR52') AND RIGHT.Edits[7..10] = 'NR51') => LEFT.NarrativeRemarkCounter + 1,
																																					(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND LEFT.Edits[7..10] = 'NR51' AND RIGHT.Edits[7..10] = 'NR51' AND LEFT.NarrativeRemarkCounter > 0) => LEFT.NarrativeRemarkCounter + 1,
																																					 0),													  																													 
																			 SELF.SH51Type 							 := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
																																					(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..19] = Constants.SH51_Inqry) => 1,
																																					(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..19] = Constants.SH51_Ident) => 2,
																																					(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'SH51' AND RIGHT.Edits[7..19] NOT IN [Constants.SH51_Inqry, Constants.SH51_Ident]) => 0,
																																					 LEFT.SH51Type),
																			 SELF.SH51TypeSeq 					 := MAP((LEFT.JulianDate = 0 AND LEFT.RemainingRefNo = 0) OR (LEFT.JulianDate <> RIGHT.JulianDate) OR (LEFT.RemainingRefNo <> RIGHT.RemainingRefNo) OR (LEFT.ReportSource <> RIGHT.ReportSource) OR (LEFT.OriginalRefNo <> RIGHT.OriginalRefNo) => 0,
																																					(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND RIGHT.Edits[7..10] = 'SH51') => 0,
																																					(LEFT.JulianDate = RIGHT.JulianDate AND LEFT.RemainingRefNo = RIGHT.RemainingRefNo AND LEFT.SH51Type IN [1, 2]) => LEFT.SH51TypeSeq + 1,
																																					0),																																					 
																			 SELF := RIGHT), LOCAL);														 
																	 
		DuplicateReports := DEDUP(SORT(DISTRIBUTE(DS_BASE_MST_ARCHIVE_REPORT_ITER(Edits[7..10] = 'NR52' AND Edits[15..16] = 'GM' AND STD.Str.Find(Edits, 'DUPLICATE REPORT', 1) > 0), HASH32(OriginalRefNo)), 
																	 OriginalRefNo, LOCAL), OriginalRefNo, LOCAL);	
																	 
		Exclude_Duplicate_Reports := JOIN(DS_BASE_MST_ARCHIVE_REPORT_ITER, DuplicateReports,
																 LEFT.OriginalRefNo = RIGHT.OriginalRefNo,
																 TRANSFORM(Layout_EditsArchive_Append,
																 SELF.RecordTypeCounter := IF(LEFT.Edits[7..10] IN Constants.Record_Type_Set OR LEFT.Edits[7..19] IN Constants.Message_Type_Set OR LEFT.NarrativeRemarkCounter != 0, LEFT.RecordTypeCounter, 0),
																 SELF.SH51Type := IF(LEFT.Edits[7..10] IN ['PI51', 'AL51'] OR LEFT.Edits[7..19] IN [Constants.SH51_Inqry, Constants.SH51_Ident], LEFT.SH51Type, 0),
																 SELF.SH51TypeSeq := IF(LEFT.Edits[7..10] IN ['PI51', 'AL51'], LEFT.SH51TypeSeq, 0),
																 SELF := LEFT), LEFT ONLY, LOCAL);

		InValidStatus_Reports := DEDUP(SORT(DISTRIBUTE(Exclude_Duplicate_Reports(Edits[7..10] = 'RI51' AND Edits[143] NOT IN ['C', 'U']), HASH32(OriginalRefNo)), 
																	 OriginalRefNo, ReportTypeCounter, LOCAL), OriginalRefNo, ReportTypeCounter, LOCAL);

		Exclude_InValidStatus_Reports := JOIN(Exclude_Duplicate_Reports, InValidStatus_Reports,
																		 LEFT.OriginalRefNo = RIGHT.OriginalRefNo AND
																		 LEFT.ReportTypeCounter = RIGHT.ReportTypeCounter,
																		 TRANSFORM(Layout_EditsArchive_Append,
																		 SELF := LEFT), LEFT ONLY, LOCAL);

		CreateTransactionLogRecord := PROJECT(DSscoring(Line[7..10] = 'RI51'),
																	TRANSFORM({STRING16 Transaction_id, STRING14 reference_number, UNSIGNED8 individual_lex_id, UNSIGNED8 spouse_lex_id, STRING10 date_added},
																	SELF.reference_number := LEFT.LastID;
																	SELF.Transaction_id := LEFT.LastID + '01';
																	SELF.individual_lex_id := 10*COUNTER + thorlib.nodes();
																	SELF.spouse_lex_id := 0;
																	date_added_int := CLUEAuto.julianToYYYYMMDD('20' + LEFT.LastID[1..2], (STRING)((UNSIGNED2)LEFT.LastID[3..5] - 400));
																	SELF.date_added := date_added_int[1..4] + '-' + date_added_int[5..6] + '-' + date_added_int[7..8]));
															
		WeeklyTotalData := JOIN(Exclude_InValidStatus_Reports, CreateTransactionLogRecord, 
											 LEFT.OriginalRefNo = (UNSIGNED6) RIGHT.reference_number,
											 TRANSFORM(Layout_EditsArchive_Append,
											 SELF.Transaction_Id := RIGHT.Transaction_Id,
											 SELF.LexID := IF(LEFT.ReportTypeCounter = 2, RIGHT.spouse_lex_id, RIGHT.individual_lex_id),
											 SELF.Date_Reported := RIGHT.date_added[1..4] + RIGHT.date_added[6..7] + RIGHT.date_added[9..10],
											 SELF := LEFT), HASH) : INDEPENDENT;
										 
		WeeklyData := WeeklyTotalData(LexID != 0);										 
										 
    CompleteData := Files.Report_Data + WeeklyData;										 
		
		Primary_Credit_Reports := DEDUP(SORT(DISTRIBUTE(WeeklyTotalData(ReportTypeCounter = 1), HASH32(OriginalRefNo)), OriginalRefNo, LOCAL), OriginalRefNo, LOCAL);
		Spousal_Credit_Reports := DEDUP(SORT(DISTRIBUTE(WeeklyTotalData(ReportTypeCounter = 2), HASH32(OriginalRefNo)), OriginalRefNo, LOCAL), OriginalRefNo, LOCAL);
		
		AuditLog_Data := DATASET([{Indate,
															 '',
															 '',
															 COUNT(CreateTransactionLogRecord),
															 0,
															 0,0,0,0,0,0,0,0,0,0,0,0,0,
															 COUNT(Primary_Credit_Reports),
															 COUNT(Spousal_Credit_Reports),
															 COUNT(Primary_Credit_Reports(LexID = 0)),
															 COUNT(Spousal_Credit_Reports(LexID = 0))}],
															Consumer_Credit_Layout.Layout_AuditLog);
		
		SuccessSubject 		:= 'The Consumer Credit files build successful for ' + TRIM(Indate);
		SuccessBody    		:= 'The Consumer Credit files build successful for '+ TRIM(Indate) +'\n\n'+
												 'The workunit is '+ WORKUNIT +'\n\n';
												 
		FailureSubject 		:= 'The Consumer Credit files build failed for ' + TRIM(Indate);
		FailureBody    		:= 'The Consumer Credit files build failed for ' + TRIM(Indate) +'\n\n'+
												 'The workunit is ' + WORKUNIT + '\n\n' +
												 'ErrorMessage is ' + FAILMESSAGE + '\n\n';												 
												 
    BuildFiles := SEQUENTIAL(FileUtil.FN_OutputAndPromoteFile(CompleteData, Files.base_prefix, 'report', WORKUNIT[2..9]  + WORKUNIT[11..16]),
														 Build_Records(WeeklyData),
														 OUTPUT(AuditLog_Data), // Build_AuditLog(AuditLog_Data, Start_Julian_Date, End_Julian_Date),
														 Fileservices.Sendemail(EmailAddresses.ConsumerCredit_EmailAddresses, SuccessSubject, SuccessBody))
														 :FAILURE(Fileservices.Sendemail(EmailAddresses.ConsumerCredit_EmailAddresses, FailureSubject, FailureBody));													
												 
		RETURN BuildFiles;

END;