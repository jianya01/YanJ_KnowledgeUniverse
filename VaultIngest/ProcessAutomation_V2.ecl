IMPORT STD,UT,Vault_Layout;

EXPORT ProcessAutomation_V2(pModule,pEmailSourcein,pPkgVar = ' ',pRoxieIP = ' ') := FUNCTIONMACRO
	
	// Define the components required for Build
	pSourcefile := pModule.Constants.Sourcefile;
	pBaseprefix:= pModule.Constants.BasePrefix;
	pBaseSuffix:= pModule.Constants.BaseSuffix;
	pVaultFileDS:= pModule.Constants.VaultFile;

	//Check for record duplicates
	
	Source_dedup := COUNT(DEDUP(SORT(DISTRIBUTE(pSourcefile),RECORD,local),RECORD,local));
	
	// Set version date through dops/idops
	
	VersionFileName := pBaseprefix + '::' + pBaseSuffix + '::VersionFile';
	VersionFile := DATASET(VersionFileName, Vault_Layout.Layout_Version, THOR, OPT);
	
	NewVersionDate := VaultIngest.get_EnvVariable(pPkgVar, pRoxieIP);

	UpdateVersionDs := DATASET([{NewVersionDate, pPkgVar}], Vault_Layout.Layout_Version);
	
	CreateVersionDs := OUTPUT(UpdateVersionDs,, VersionFileName, OVERWRITE, COMPRESSED);
	
	pEmailSourceinTrim := TRIM(pEmailSourceIn,LEFT,RIGHT);
										
	FailureAutomationsubject  := 'The ' + pEmailSourceinTrim + ' Automation Failed for ' + (STRING)std.date.today();
	FailureAutomationbody     := 'The ' + pEmailSourceinTrim + ' Automation Failed for ' + (STRING)std.date.today() + '\n' +
															 'The Workunit is ' + WORKUNIT + '\n'+
															 'ErrorMessage is ' + FAILMESSAGE + '\n\n';				
															 
	DedupFailureAutomationsubject  := 'The ' + pEmailSourceinTrim + ' Automation Failed for ' + (STRING)std.date.today();
	DedupFailureAutomationbody     := 'The ' + pEmailSourceinTrim + ' Automation Failed for ' + (STRING)std.date.today() + '\n' +
															 'The Workunit is ' + WORKUNIT + '\n'+
															 'Error - Record level duplicates found in source file ' + '\n\n';		
	
	Action1 := IF( NewVersionDate != VersionFile(PkgVariable = pPkgVar)[1].VersionDate,
								IF( COUNT(pSourcefile) = Source_dedup, 
   										SEQUENTIAL(VaultIngest.BuildAutomation(pModule,pBaseprefix,pBaseSuffix,pVaultFileDS,pEmailSourceIn),CreateVersionDs),
											Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, DedupFailureAutomationsubject, DedupFailureAutomationbody)))
												:FAILURE(Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, FailureAutomationsubject, FailureAutomationbody)); //failure email
												
	Action2 := IF(COUNT(pSourcefile) = Source_dedup,
								SEQUENTIAL(VaultIngest.BuildAutomation(pModule,pBaseprefix,pBaseSuffix,pVaultFileDS,pEmailSourceIn)),
								Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, DedupFailureAutomationsubject, DedupFailureAutomationbody))
								:FAILURE(Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, FailureAutomationsubject, FailureAutomationbody));
	
	Final_Build := IF(pPkgVar != '', Action1, Action2);
	
	RETURN 	Final_Build;
	
ENDMACRO;