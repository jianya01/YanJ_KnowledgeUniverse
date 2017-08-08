EXPORT Build_LogFile(pBuildfilename,pVaultFile, pBaseprefix, pBaseSuffix) := FUNCTIONMACRO


	LogFile_Existing := pBaseprefix + '::prod::' + pBaseSuffix + '::LogFile';
	// LogFile_Existing := pBaseprefix + '::' + pBaseSuffix + '::LogFile::'+'prod';
	
	LogFile_Existing_DS := DATASET(LogFile_Existing, Vault_Layout.LogFile_Layout, THOR, OPT);
	
	Yesterday := GLOBAL((UNSIGNED4)VaultIngest.date_math((STRING)std.date.today(), -1));
	
	New_Log_DS := DATASET([{WORKUNIT[2..9],
   													COUNT(pVaultFile), 
   													COUNT(pVaultFile(vault_date_last_seen = 0)),// active as per current build
   													COUNT(pVaultFile(vault_record_status = 5 AND Vault_Date_Last_Seen = Yesterday)),//Updated
   													COUNT(pVaultFile(vault_record_status = 6)),//new
   													COUNT(pVaultFile(vault_record_status = 4)),//unchanged
														pBuildfilename,
														WORKUNIT
   													}],
   													Vault_Layout.LogFile_Layout);
									
	Update_LogFile := New_Log_DS + LogFile_Existing_DS;
	
	Output_LogFile := VaultIngest.FileUtil.FN_OutputAndPromoteFile(Update_LogFile, pBaseprefix, pBaseSuffix +'::LogFile', WORKUNIT[2..9] + WORKUNIT[11..16]);
	
	RETURN Output_LogFile;

ENDMACRO;
