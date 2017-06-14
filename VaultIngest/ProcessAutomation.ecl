EXPORT ProcessAutomation(	pModule,
													pBuildDate, 
													pEmailSourceIn
													) := FUNCTIONMACRO
															
															
	// Define the components required for Build
	pSourcefile := pModule.Constants.Sourcefile;
	pBaseprefix:= pModule.Constants.BasePrefix;
	pBaseSuffix:= pModule.Constants.BaseSuffix;
	pVaultFileDS:= pModule.Constants.VaultFile;
	SourceDSKey := pModule.Constants.SourceKey;
	
	// Verify the source file for duplicates
	in_ds := pSourcefile;
	sortedDS:=sort(in_ds,SourceDSKey);
	UniqueCnt := count(VaultIngest.Macros.CountUnique(sortedDS,SourceDSKey));
	TotalCnt := count(in_ds);
	
	Boolean VerifyUniqueCount := (UniqueCnt = TotalCnt); 
	
	pEmailSourceinTrim := TRIM(pEmailSourceIn, LEFT, RIGHT);
										
	FailureProcessSubject  := 'The ' + pEmailSourceinTrim + ' build Failed for : ' + (STRING8)STD.Date.Today();
	FailureProcessBody     := 'The ' + pEmailSourceinTrim + ' build Failed for : ' + (STRING8)STD.Date.Today() + '.'+'\n' +
										 '**Sourcefile may have duplicate records**. The Workunit is ' + WORKUNIT + '.'+ '\n'+
										 'Vault Ingest build was NOT processed for ' + (STRING8)STD.Date.Today() + '.'+'\n';		
	
	ProcessBuild := IF (VerifyUniqueCount, 
   											SEQUENTIAL(VaultIngest.BuildAutomation(pModule,pBaseprefix,pBaseSuffix,pBuildDate,pVaultFileDS,pEmailSourceIn)),
												Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, FailureProcessSubject, FailureProcessBody)); //failure email
	
	RETURN ProcessBuild;				
	
ENDMACRO;