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



/* temporaryLogLayout := RECORD
       UNSIGNED8 TotalRecords;
       UNSIGNED8 TotalActiveRecords;
       UNSIGNED8 TotalPreviousActiveRecords;
       UNSIGNED8 TotalNewActiveRecords;
       UNSIGNED8 TotalUpdatedActiveRecords;
   END;
   
   temporaryLogLayout setFlags(pVaultFile le) := TRANSFORM
       SELF.TotalRecords := 1;
       SELF.TotalActiveRecords := (UNSIGNED)(Vault_Active_Flag = 'Y');
       SELF.TotalPreviousActiveRecords := (UNSIGNED)(Vault_Active_Flag = 'N' AND vault_date_last_seen = pYesterday);
       SELF.TotalNewActiveRecords := (UNSIGNED)(Vault_Active_Flag = 'Y' AND vault_date_first_seen = pCurrent_Date AND vault_date_last_seen = pCurrent_Date);
       SELF.TotalUpdatedActiveRecords := (UNSIGNED)(Vault_Active_Flag = 'Y' AND vault_date_first_seen <> pCurrent_Date AND vault_date_last_seen = pCurrent_Date);
   END;
   
   flaggedVaultFile := PROJECT(pVaultFile, setFlags(LEFT));
   
   statsVaultFile := ROLLUP(flaggedVaultFile, 
           TRUE, 
       TRANSFORM(temporaryLogLayout, 
           SELF.TotalRecords := le.TotalRecords + ri.TotalRecords;
           SELF.TotalActiveRecords := le.TotalActiveRecords + ri.TotalActiveRecords;
           SELF.TotalPreviousActiveRecords := le.TotalPreviousActiveRecords + ri.TotalPreviousActiveRecords;
           SELF.TotalNewActiveRecords := le.TotalNewActiveRecords + ri.TotalNewActiveRecords;
           SELF.TotalUpdatedActiveRecords := le.TotalUpdatedActiveRecords + ri.TotalUpdatedActiveRecords))[1];
   
   New_Log_DS := DATASET([{InputDate, statsVaultFile.TotalRecords, statsVaultFile.TotalActiveRecords, statsVaultFile.TotalPreviousActiveRecords, statsVaultFile.TotalNewActiveRecords, statsVaultFile.TotalUpdatedActiveRecords}], Vault_Layout.LogFile_Layout);
*/