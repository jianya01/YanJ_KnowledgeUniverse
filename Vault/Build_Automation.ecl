IMPORT ut;

EXPORT Build_Automation(pVaultFile, pProdFile, pProdFilename, pVaultLayout, pJoinFields, pCompareLeftFields, pCompareRightFields, pBaseprefix, pBaseSuffix, pBuildDate, pDataSource, pEmailSource) := FUNCTIONMACRO
	
	BOOLEAN IsActive := pVaultFile.vault_active_flag = 'Y';
	pOldFile := pVaultFile(IsActive);
	pNewFile := PROJECT(pProdFile, TRANSFORM(pVaultLayout, SELF := LEFT, SELF := []));
	
	Current_Date := (UNSIGNED4) pBuildDate;
	Yesterday := GLOBAL((UNSIGNED4)vault.date_math(pBuildDate, -1));		 
  Maxvault_rid := GLOBAL(MAX(pVaultFile, vault_rid));
		 
	pVaultLayout Take_Record(pOldFile vault_le, pNewFile vault_ri) := TRANSFORM
    BOOLEAN left_null := #EXPAND(pCompareLeftFields);
    BOOLEAN right_null := #EXPAND(pCompareRightFields);
		SELF.vault_date_first_seen := IF(left_null, Current_Date, vault_le.vault_date_first_seen);
		SELF.vault_date_last_seen := IF(right_null, Yesterday, Current_Date);
    SELF.vault_active_flag := IF(right_null, 'N', 'Y');
    SELF.vault_rid := IF(left_null, 0, vault_le.vault_rid);		
		SELF := IF(right_null, vault_le, vault_ri);
  END;

  re := JOIN(pOldFile, pNewFile,
						#EXPAND(pJoinFields),
						Take_Record(LEFT,RIGHT), HASH, FULL OUTER);
	
	BOOLEAN IsNewRecord := re.vault_rid = 0;
	vault_ridProject := PROJECT(re(IsNewRecord), 
											TRANSFORM(pVaultLayout,
											SELF.vault_rid := Maxvault_rid + COUNTER,
											SELF := LEFT));							
					
	CombineFile := pVaultFile(NOT IsActive) +	re(NOT IsNewRecord) + vault_ridProject;	
	
	pEmailSourceTrim := TRIM(pEmailSource, LEFT, RIGHT);
  Successsubject  := 'The ' + pEmailSourceTrim + ' Build Completed for ' + (STRING)std.date.today();
	Successbody     := 'The ' + pEmailSourceTrim + ' Build Completed for ' + (STRING)std.date.today() + '\n' +
										 'The Workunit is ' + WORKUNIT +'\n';		
										
	Failuresubject  := 'The ' + pEmailSourceTrim + ' Build Failed for ' + (STRING)std.date.today();
	Failurebody     := 'The ' + pEmailSourceTrim + ' Build Failed for ' + (STRING)std.date.today() + '\n' +
										 'The Workunit is ' + WORKUNIT + '\n'+
										 'ErrorMessage is ' + FAILMESSAGE + '\n\n';		
	
	CreateFile := SEQUENTIAL(Vault.FileUtil.FN_OutputAndPromoteFile(CombineFile, pBaseprefix, pBaseSuffix, WORKUNIT[2..9] + WORKUNIT[11..16]),
													 STD.File.SetFileDescription(Vault.Files(pDataSource,pBaseSuffix).base_prod_vault_file, pProdFilename),
													 // Vault.Strata_Automation(pVaultFile, Current_Date, Yesterday, pBaseSuffix, pStrataBase, pStrataFrequency),
													 Vault.Build_LogFile(pVaultFile, Current_Date, Yesterday, pBaseprefix, pBaseSuffix,pDataSource,pProdFilename),
													 Fileservices.Sendemail(Vault.EmailAddresses.Vault_EmailAddresses, Successsubject, Successbody))
												 : FAILURE(Fileservices.Sendemail(Vault.EmailAddresses.Vault_EmailAddresses, Failuresubject, Failurebody));
									
	RETURN CreateFile;									
	
ENDMACRO;