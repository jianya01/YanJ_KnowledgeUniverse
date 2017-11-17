IMPORT SALT38,STD;

EXPORT BuildAutomation(pModule,
												pBaseprefix,
												pBaseSuffix,
												pVaultFileDS,
												pEmailSource
												) := FUNCTIONMACRO
	
	ingestMod := pModule.Ingest(TRUE); 
	result:= ingestMod.AllRecords;
	final:= project(result, transform(pModule.Layout_Vault,		
																										self.vault_record_status := left.__Tpe ;
																										self:=left;));
	
	pEmailTrim := TRIM(pEmailSource, LEFT, RIGHT);
  Successsubject  := 'The ' + pEmailTrim + ' build Completed for : ' + (STRING8)STD.Date.Today();
	Successbody     := 'The ' + pEmailTrim + ' build Completed for : ' + (STRING8)STD.Date.Today() + '.'+'\n' +
										 'The Workunit is ' + WORKUNIT +'\n';		
										
	Failuresubject  := 'The ' + pEmailTrim + ' build Failed for : ' + (STRING8)STD.Date.Today();
	Failurebody     := 'The ' + pEmailTrim + ' build Failed for : ' + (STRING8)STD.Date.Today() + '.'+'\n' +
										 'The Workunit is ' + WORKUNIT + '\n'+
										 'ErrorMessage is ' + FAILMESSAGE + '\n\n';		
	
	pBuildfilename := pModule.constants.BasePrefix+'::'+WORKUNIT[2..9] + WORKUNIT[11..16]+'::'+pModule.constants.BaseSuffix;
	CreateFile := SEQUENTIAL(VaultIngest.FileUtil.FN_OutputAndPromoteFile(final, pBaseprefix, pBaseSuffix, WORKUNIT[2..9] + WORKUNIT[11..16]),
														ingestMod.DoStats, 
														STD.File.SetFileDescription(pModule.Constants.BasePrefix+'::prod::'+pModule.Constants.BaseSuffix, STD.Str.FilterOut(pModule.Constants.SourceFileName, '~')),
														// STD.File.SetFileDescription(pModule.Constants.BasePrefix+'::'+pModule.Constants.BaseSuffix+'::prod', STD.Str.FilterOut(pModule.Constants.SourceFileName, '~')),
														VaultIngest.Build_LogFile(pBuildfilename,pVaultFileDS, pBaseprefix, pBaseSuffix),
														Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, Successsubject, Successbody)) 
													: FAILURE(Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, Failuresubject, Failurebody));
									
	RETURN CreateFile;									
	
ENDMACRO;