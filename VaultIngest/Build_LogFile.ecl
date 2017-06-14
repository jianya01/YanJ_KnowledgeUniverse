EXPORT Build_LogFile(pVaultFile, pCurrent_Date, pYesterday, pBaseprefix, pBaseSuffix) := FUNCTIONMACRO


	LogFile_Existing := pBaseprefix + '::prod::' + pBaseSuffix + '::LogFile';
	
	LogFile_Existing_DS := DATASET(LogFile_Existing, Vault_Layout.Layout_Logfile, THOR, OPT);
	
	InputDate := (STRING8)pCurrent_Date;
	New_Log_DS := DATASET([{InputDate[1..4] + '-' + InputDate[5..6] + '-' + InputDate[7..8],
   													COUNT(pVaultFile), 
   													COUNT(pVaultFile(vault_date_last_seen = 0)),// active as per current build
   													COUNT(pVaultFile(vault_date_last_seen = pYesterday)),//expired in this build
   													COUNT(pVaultFile(vault_record_status = 6)),//new
   													COUNT(pVaultFile(vault_record_status = 5))//updated
   													}],
   													Vault_Layout.Layout_Logfile);
									
	Update_LogFile := New_Log_DS + LogFile_Existing_DS;
	
	Output_LogFile := VaultIngest.FileUtil.FN_OutputAndPromoteFile(Update_LogFile, pBaseprefix, pBaseSuffix +'::LogFile', WORKUNIT[2..9] + WORKUNIT[11..16]);
	
	RETURN Output_LogFile;

ENDMACRO;
