IMPORT Vault_layout;

EXPORT Build_LogFile(pVaultFile, pCurrent_Date, pYesterday, pBaseprefix, pBaseSuffix, pDataSource) := FUNCTIONMACRO
	
		LogFile_Existing := pBaseprefix + '::' + pBaseSuffix + '::LogFile::prod';
		
		LogFile_Existing_DS := DATASET(LogFile_Existing, Vault_Layout.LogFile_Layout, THOR, OPT);
		
		InputDate := (STRING8)pCurrent_Date;
		
		New_Log_DS := DATASET([{InputDate,
														COUNT(pVaultFile), 
														COUNT(pVaultFile(Vault_Active_Flag = 'Y')),
														COUNT(pVaultFile(Vault_Active_Flag = 'N' AND vault_date_last_seen = pYesterday)), 
														COUNT(pVaultFile(Vault_Active_Flag = 'Y' AND vault_date_first_seen = pCurrent_Date AND vault_date_last_seen = pCurrent_Date)),
														COUNT(pVaultFile(Vault_Active_Flag = 'Y' AND vault_date_first_seen <> pCurrent_Date AND vault_date_last_seen = pCurrent_Date))}],
														Vault_Layout.LogFile_Layout);
														
		Update_LogFile := New_Log_DS + LogFile_Existing_DS;
		
		Output_LogFile := Vault.FileUtil.FN_OutputAndPromoteFile(Update_LogFile, pBaseprefix, pBaseSuffix +'::LogFile', WORKUNIT[2..9] + WORKUNIT[11..16]);
		
		RETURN Output_LogFile;
	
ENDMACRO;