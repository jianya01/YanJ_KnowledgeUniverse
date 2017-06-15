IMPORT SALT38,STD;

EXPORT BuildAutomation(pModule,
												pBaseprefix,
												pBaseSuffix,
												pVaultFileDS,
												pEmailSource
												) := FUNCTIONMACRO
	
	ingestMod := pModule.Ingest(true); 
	result:= ingestMod.AllRecords;
	final:= project(result, transform(pModule.Layout_Vault,		
																										self.vault_record_status := left.__Tpe ;
																										self:=left;));
	pEmailSourceTrim := TRIM(pEmailSource, LEFT, RIGHT);
  Successsubject  := 'The ' + pEmailSourceinTrim + ' build Completed for : ' + (STRING8)STD.Date.Today();
	Successbody     := 'The ' + pEmailSourceinTrim + ' build Completed for : ' + (STRING8)STD.Date.Today() + '.'+'\n' +
										 'The Workunit is ' + WORKUNIT +'\n';		
										
	Failuresubject  := 'The ' + pEmailSourceinTrim + ' build Failed for : ' + (STRING8)STD.Date.Today();
	Failurebody     := 'The ' + pEmailSourceinTrim + ' build Failed for : ' + (STRING8)STD.Date.Today() + '.'+'\n' +
										 'The Workunit is ' + WORKUNIT + '\n'+
										 'ErrorMessage is ' + FAILMESSAGE + '\n\n';		
	
	CreateFile := SEQUENTIAL(VaultIngest.FileUtil.FN_OutputAndPromoteFile(final, pBaseprefix, pBaseSuffix, WORKUNIT[2..9] + WORKUNIT[11..16]),
														ingestMod.DoStats, 
														STD.File.SetFileDescription(pModule.Constants.BasePrefix+'::prod::'+pModule.Constants.BaseSuffix, STD.Str.FilterOut(pModule.Constants.SourceFileName, '~')),
														VaultIngest.Build_LogFile(pVaultFileDS, pBaseprefix, pBaseSuffix),
														Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, Successsubject, Successbody)) 
													: FAILURE(Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, Failuresubject, Failurebody));
									
	RETURN CreateFile;									
	
ENDMACRO;