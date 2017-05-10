 IMPORT Consumer_Credit_Layout,STD,Vault;
 
 EXPORT CreateLogNCFTransactionLiensJudgements(STRING Input_File_Date ='') := FUNCTION
		
		Input_LienJudgement_File := Files.TransactionLogLiensJudgements;
		Vault_LienJudgement_File := Files.Lien_JudgementsData;
		Vault_LienJudgement_File_Name := Files.TransactionLogLiensJudgements_File;
		File_Date := IF(Input_File_Date ='',(STRING)std.date.today(),Input_File_Date);
		Source_IP := '10.194.64.250';
		Source_Path := '/data/orbitprod/Vault/NCF/LienJudgement/process/'+File_Date+'/transaction_log_lien_judgment.txt';
		Destination_Group := 'analyt_thor400_90_b';
		
		SprayFile  := FileServices.SprayVariable(Source_IP ,Source_Path,,
																						 '' ,, '' ,
																						 Destination_Group,Vault_LienJudgement_File_Name,,,,true,,true):PERSIST(Files.TransactionLogLiensJudgements_File + 'Spray_Temp' + File_Date,EXPIRE(15));
		
		Max_Rid := MAX(Vault_LienJudgement_File,Vault_Rid);
		
	  TransactionLogEditsArchive := PROJECT(Input_LienJudgement_File, TRANSFORM(Consumer_Credit_Layout.Layout_Log_NCF_Transaction_Log_Liens_Judgements,
       SELF.LexID :=(UNSIGNED) LEFT.Lex_ID;
       SELF.TransactionID := LEFT.Transaction_ID;
       SELF.Date_Last_Seen := LEFT.Date_Loaded; 
       SELF.VendorLiensAndJudgements := LEFT.Content;
			 SELF.Vendor := LEFT.Vendor;
			 SELF.ProcessType := LEFT.Process_Type;
			 SELF.ContentType := LEFT.Content_Type;
			 SELF.Vault_Rid := Max_Rid +COUNTER;
			 SELF := LEFT));
				
  TransactionLogEditsArchive_Out := Vault_LienJudgement_File + TransactionLogEditsArchive;

  Successsubject  := 'LiensJudgements Build Completed for ' + (STRING)std.date.today();
	Successbody     := 'LiensJudgementsData  Build Completed for ' + (STRING)std.date.today() + '\n' +
										 'The Workunit is ' + WORKUNIT +'\n';		
										
	Failuresubject  := 'LiensJudgements  Build Failed for ' + (STRING)std.date.today();
	Failurebody     := 'LiensJudgementsData  Build Failed for ' + (STRING)std.date.today() + '\n' +
										 'The Workunit is ' + WORKUNIT + '\n'+
										 'ErrorMessage is ' + FAILMESSAGE + '\n\n';		
										 
	
	CreateFile := SEQUENTIAL(SprayFile, 
													 Consumer_Credit.FileUtil.FN_OutputAndPromoteFile(TransactionLogEditsArchive_Out, Files.base_ncf_prefix, 'Liens_JudgementsData', WORKUNIT[2..9] + WORKUNIT[11..16]),
													 Fileservices.Sendemail(Consumer_Credit.EmailAddresses.NCF_EmailAddresses, Successsubject, Successbody))
												 : FAILURE(Fileservices.Sendemail(Consumer_Credit.EmailAddresses.NCF_EmailAddresses, Failuresubject, Failurebody));
									
	RETURN CreateFile;			

END;