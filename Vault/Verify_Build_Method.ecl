IMPORT ut;

EXPORT Verify_Build_Method(pOldFile, pNewFile, pJoinFields, pCompareLeftFields, pCompareRightFields, pSuffix) := FUNCTIONMACRO
	
	RecLayout := RECORD
		BOOLEAN Added_Record; 
		BOOLEAN Expired_Record; 
		BOOLEAN Updated_Record; 
	END;

	RecLayout Take_Record(pOldFile vault_le, pNewFile vault_ri) := TRANSFORM
    SELF.Added_Record 	:= #EXPAND(pCompareLeftFields);
    SELF.Expired_Record := #EXPAND(pCompareRightFields);
    SELF.Updated_Record := NOT SELF.Added_Record AND NOT SELF.Expired_Record;
  END;

  re := JOIN(pOldFile, pNewFile,
						#EXPAND(pJoinFields),
						Take_Record(LEFT,RIGHT), HASH, FULL OUTER);
										
  Successsubject := 'The ' + pSuffix + ' Build Method Verification Completed for ' + ut.GetDate;
	Successbody    := 'The ' + pSuffix + ' Build Method Verification Completed for ' + ut.GetDate + '\n' +
										'The Workunit is  : ' + WORKUNIT + '\n' +
										'Old File Records : ' + COUNT(pOldFile) + '\n' +
										'New File Records : ' + COUNT(pNewFile) + '\n' +
										'Added Records		: ' + COUNT(re(Added_Record)) + '\n' +
										'Expired Records	: ' + COUNT(re(Expired_Record)) + '\n' +
										'Updated Records	: ' + COUNT(re(Updated_Record)) + '\n';		
										
	Failuresubject := 'The ' + pSuffix + ' Build Method Verification Failed for ' + ut.GetDate;
	Failurebody    := 'The ' + pSuffix + ' Build Method Verification Failed for ' + ut.GetDate + '\n' +
										'The Workunit is ' + WORKUNIT + '\n'+
										'ErrorMessage is ' + FAILMESSAGE + '\n\n';		
	
	CreateFile := Fileservices.Sendemail(Vault.EmailAddresses.Vault_EmailAddresses, Successsubject, Successbody)
								: FAILURE(Fileservices.Sendemail(Vault.EmailAddresses.Vault_EmailAddresses, Failuresubject, Failurebody));
									
	RETURN CreateFile;									
	
ENDMACRO;