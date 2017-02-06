IMPORT ut, Consumer_Credit_Layout;

EXPORT Build_AuditLog(DATASET(Consumer_Credit_Layout.Layout_AuditLog) AuditLog_Data_Input, UNSIGNED2 Start_Julian_Date, UNSIGNED2 End_Julian_Date) := FUNCTION

		Indate := WORKUNIT[2..9];

		AuditLog_Data := DATASET([{AuditLog_Data_Input[1].Load_Date,
															 AuditLog_Data_Input[1].Build_Start_Date,
															 AuditLog_Data_Input[1].Build_End_Date,
															 AuditLog_Data_Input[1].Count_Of_Transactions,
															 AuditLog_Data_Input[1].Count_Of_Duplicate_Reference_Numbers_In_TransactionLog,
															 COUNT(Files.ReportRequest_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.ReportIdSupplement_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.Address_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.BankRuptcy_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.Collection_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.CreditReportSummary_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.Employment_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.InquiryHistory_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.Judgement_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.NarrativeA_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.Person_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.TaxLien_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 COUNT(Files.TradeLine_Data(JulianDate BETWEEN Start_Julian_Date AND End_Julian_Date)),
															 AuditLog_Data_Input[1].Primary_Credit_Reports,
															 AuditLog_Data_Input[1].Spousal_Credit_Reports,
															 AuditLog_Data_Input[1].Primary_Credit_Reports_Without_LexID,
															 AuditLog_Data_Input[1].Spousal_Credit_Reports_Without_LexID}],
															 Consumer_Credit_Layout.Layout_AuditLog);
															 
     															 
		AuditLog_Data_Final := Files.AuditLog_Data + AuditLog_Data;
		
		SuccessSubject 		:= 'The Consumer Credit files audit log build successful for ' + TRIM(Indate);
		SuccessBody    		:= 'The Consumer Credit files audit log build successful for '+ TRIM(Indate) +'\n\n'+
												 'The workunit is '+ WORKUNIT +'\n\n';
												 
		FailureSubject 		:= 'The Consumer Credit files audit log build failed for ' + TRIM(Indate);
		FailureBody    		:= 'The Consumer Credit files audit log build failed for ' + TRIM(Indate) +'\n\n'+
												 'The workunit is ' + WORKUNIT + '\n\n' +
												 'ErrorMessage is ' + FAILMESSAGE + '\n\n';												 
												 
    BuildLogFiles := SEQUENTIAL(FileUtil.FN_OutputAndPromoteFile(AuditLog_Data_Final, Files.base_prefix, 'auditlog', WORKUNIT[2..9]  + WORKUNIT[11..16]),
																Fileservices.Sendemail(EmailAddresses.ConsumerCredit_EmailAddresses, SuccessSubject, SuccessBody))
																:FAILURE(Fileservices.Sendemail(EmailAddresses.ConsumerCredit_EmailAddresses, FailureSubject, FailureBody));							
														 
    RETURN BuildLogFiles;													
												 
END;