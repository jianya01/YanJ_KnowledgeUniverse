IMPORT SALT38,STD;

EXPORT BuildAutomation(pModule,
												pBaseprefix,
												pBaseSuffix,
												pBuildDate,
												pVaultFileDS,
												pEmailSource
												) := FUNCTIONMACRO
	
	ingestMod := pModule.Ingest(TRUE); 
	result:= ingestMod.AllRecords;
	final:= project(result, transform(pModule.Layout_Vault,		
																										self.vault_record_status := left.__Tpe ;
																										self:=left;));
																										
	
	Current_Date := GLOBAL((UNSIGNED4) pBuildDate);	
	Yesterday := GLOBAL((UNSIGNED4)VaultIngest.date_math(pBuildDate, -1));
	
	pEmailSourceTrim := TRIM(pEmailSource, LEFT, RIGHT);
  Successsubject  := 'The ' + pEmailSourceTrim + ' build Completed for : ' + (STRING8)STD.Date.Today();
	Successbody     := 'The ' + pEmailSourceTrim + ' build Completed for : ' + (STRING8)STD.Date.Today() + '.'+'\n' +
										 'The Workunit is ' + WORKUNIT +'\n';		
										
	Failuresubject  := 'The ' + pEmailSourceTrim + ' build Failed for : ' + (STRING8)STD.Date.Today();
	Failurebody     := 'The ' + pEmailSourceTrim + ' build Failed for : ' + (STRING8)STD.Date.Today() + '.'+'\n' +
										 'The Workunit is ' + WORKUNIT + '\n'+
										 'ErrorMessage is ' + FAILMESSAGE + '\n\n';		
	
	CreateFile := SEQUENTIAL(VaultIngest.FileUtil.FN_OutputAndPromoteFile(final, pBaseprefix, pBaseSuffix, WORKUNIT[2..9] + WORKUNIT[11..16]),
														ingestMod.DoStats, 
														VaultIngest.Build_LogFile(pVaultFileDS, Current_Date, Yesterday, pBaseprefix, pBaseSuffix),
														Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, Successsubject, Successbody)) 
													: FAILURE(Fileservices.Sendemail(VaultIngest.EmailAddresses.Vault_EmailAddresses, Failuresubject, Failurebody));
									
	RETURN CreateFile;									
	
ENDMACRO;