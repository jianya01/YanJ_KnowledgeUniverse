IMPORT ut, Vault_Layout;

EXPORT Process_Automation(pVaultFile, pProdFile, pProdFilename, pVaultLayout, pJoinFields, pCompareLeftFields, pCompareRightFields, pBaseprefix, pBaseSuffix, pBuildDate, pDataSource, pEmailSourceIn, pPkgVar, pRoxieIP) := FUNCTIONMACRO
	
	VersionFileName := Vault.Files(pDataSource).base_prefix + '::' + pBaseSuffix + '::VersionFile';
	VersionFile := DATASET(VersionFileName, Vault_Layout.Layout_Version, THOR, OPT);
	
	NewVersionDate := Vault.get_EnvVariable(pPkgVar, pRoxieIP);

	UpdateVersionDs := DATASET([{NewVersionDate, pPkgVar}], Vault_Layout.Layout_Version);
	
	CreateVersionDs := OUTPUT(UpdateVersionDs,, VersionFileName, OVERWRITE, COMPRESSED);

	pEmailSourceInTrim := TRIM(pEmailSourceIn, LEFT, RIGHT);		
	FailureAutomationsubject  := 'The ' + pEmailSourceInTrim + ' Automation Failed for ' + (STRING)std.date.today();
	FailureAutomationbody     := 'The ' + pEmailSourceInTrim + ' Automation Failed for ' + (STRING)std.date.today() + '\n' +
															 'The Workunit is ' + WORKUNIT + '\n'+
															 'ErrorMessage is ' + FAILMESSAGE + '\n\n';		
								 
  ProcessBuild := IF(NewVersionDate != VersionFile(PkgVariable = pPkgVar)[1].VersionDate,
									SEQUENTIAL(Vault.Build_Automation(pVaultFile, pProdFile, pProdFilename, pVaultLayout, pJoinFields, pCompareLeftFields, pCompareRightFields, pBaseprefix, pBaseSuffix, pBuildDate, pDataSource, pEmailSourceIn), 
														 CreateVersionDs))
									: FAILURE(Fileservices.Sendemail(Vault.EmailAddresses.Vault_EmailAddresses, FailureAutomationsubject, FailureAutomationbody));

	RETURN ProcessBuild;

ENDMACRO;