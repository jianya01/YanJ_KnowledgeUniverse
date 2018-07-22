IMPORT STD,UT,Vault_Layout;

EXPORT ProcessAutomation_V2(pVaultFile, pProdFile, pProdFilename, pVaultLayout, pJoinFields, pCompareLeftFields, pCompareRightFields, pBaseprefix, pBaseSuffix, pBuildDate, pDataSource, pEmailSourceIn ,pPkgVar = ' ',pRoxieIP = ' ') := FUNCTIONMACRO
	
		
	// Set version date through dops/idops
	
	VersionFileName := pBaseprefix + '::' + pBaseSuffix + '::VersionFile';
	VersionFile := DATASET(VersionFileName, Vault_Layout.Layout_Version, THOR, OPT);
	
	NewVersionDate := Vault.get_EnvVariable(pPkgVar, pRoxieIP);

	UpdateVersionDs := DATASET([{NewVersionDate, pPkgVar}], Vault_Layout.Layout_Version);
	
	CreateVersionDs := OUTPUT(UpdateVersionDs,, VersionFileName, OVERWRITE, COMPRESSED);
	
	pEmailSourceinTrim := TRIM(pEmailSourceIn,LEFT,RIGHT);
										
	FailureAutomationsubject  := 'The ' + pEmailSourceinTrim + ' Automation Failed for ' + (STRING)std.date.today();
	FailureAutomationbody     := 'The ' + pEmailSourceinTrim + ' Automation Failed for ' + (STRING)std.date.today() + '\n' +
															 'The Workunit is ' + WORKUNIT + '\n'+
															 'ErrorMessage is ' + FAILMESSAGE + '\n\n';				
															 
															 
	SourceDedupFailureAutomationsubject  := 'The ' + pEmailSourceinTrim + ' Automation Failed for ' + (STRING)std.date.today();
	SourceDedupFailureAutomationbody     := 'The ' + pEmailSourceinTrim + ' Automation Failed for ' + (STRING)std.date.today() + '\n' +
															 'The Workunit is ' + WORKUNIT + '\n'+
															 'Error - Primary key duplicates found in source file ' + '\n\n';		
	
	
									 
  Action1 := IF(NewVersionDate != VersionFile(PkgVariable = pPkgVar)[1].VersionDate,
									SEQUENTIAL(Vault.Build_Automation(pVaultFile, pProdFile, pProdFilename, pVaultLayout, pJoinFields, pCompareLeftFields, pCompareRightFields, pBaseprefix, pBaseSuffix, pBuildDate, pDataSource, pEmailSourceIn), 
														 CreateVersionDs))
									: FAILURE(Fileservices.Sendemail(Vault.EmailAddresses.Vault_EmailAddresses, FailureAutomationsubject, FailureAutomationbody));

										
  Action2 :=    SEQUENTIAL(Vault.Build_Automation(pVaultFile, pProdFile, pProdFilename, pVaultLayout, pJoinFields, pCompareLeftFields, pCompareRightFields, pBaseprefix, pBaseSuffix, pBuildDate, pDataSource, pEmailSourceIn))
                : FAILURE(Fileservices.Sendemail(Vault.EmailAddresses.Vault_EmailAddresses, FailureAutomationsubject, FailureAutomationbody));

	Final_Build := IF(pPkgVar != '', Action1, Action2)
														:FAILURE(Fileservices.Sendemail(Vault.EmailAddresses.Vault_EmailAddresses, SourceDedupFailureAutomationsubject, SourceDedupFailureAutomationbody));

	RETURN 	Final_Build;	

	
ENDMACRO;