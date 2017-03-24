 IMPORT NCF_Layout,STD,Vault;
 
 EXPORT CreateLogNCFTransactionLiensJudgements := FUNCTION
		
		Max_Rid := MAX(Files.Lien_JudgementsData,Vault_Rid);
		
	  TransactionLogEditsArchive := PROJECT(Files.TransactionLogLiensJudgements, TRANSFORM(NCF_Layout.Layout_Log_NCF_Transaction_Log_Liens_Judgements,
       SELF.LexID :=(UNSIGNED) LEFT.Lex_ID;
       SELF.TransactionID := LEFT.Transaction_ID;
       SELF.Date_Last_Seen := LEFT.Date_Loaded; 
       SELF.VendorLiensAndJudgements := LEFT.Content;
			 SELF.Vendor := LEFT.Vendor;
			 SELF.ProcessType := LEFT.Process_Type;
			 SELF.ContentType := LEFT.Content_Type;
			 SELF.Vault_Rid := Max_Rid +COUNTER;
			 SELF := LEFT));
				
  TransactionLogEditsArchive_Out := Files.Lien_JudgementsData + TransactionLogEditsArchive;

  Successsubject  := 'LiensJudgements Build Completed for ' + (STRING)std.date.today();
	Successbody     := 'LiensJudgementsData  Build Completed for ' + (STRING)std.date.today() + '\n' +
										 'The Workunit is ' + WORKUNIT +'\n';		
										
	Failuresubject  := 'LiensJudgements  Build Failed for ' + (STRING)std.date.today();
	Failurebody     := 'LiensJudgementsData  Build Failed for ' + (STRING)std.date.today() + '\n' +
										 'The Workunit is ' + WORKUNIT + '\n'+
										 'ErrorMessage is ' + FAILMESSAGE + '\n\n';		
	
	
															
																					
																					
	CreateFile := SEQUENTIAL(NCF.FileUtil.FN_OutputAndPromoteFile(TransactionLogEditsArchive_Out, Files.base_prefix, 'Liens_JudgementsData', WORKUNIT[2..9] + WORKUNIT[11..16]),
													 Fileservices.Sendemail(NCF.EmailAddresses.NCF_EmailAddresses, Successsubject, Successbody))
												 : FAILURE(Fileservices.Sendemail(NCF.EmailAddresses.NCF_EmailAddresses, Failuresubject, Failurebody));
									
	RETURN CreateFile;			

END;






