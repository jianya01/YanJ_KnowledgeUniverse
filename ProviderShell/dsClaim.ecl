Layout_Claim := RECORD
		STRING ClaimTransactionKey; //LABEL(Transaction ID),DESCRIPTION(The key is used to identify a unique transaction),OPTIONAL,NULL();	
		STRING ClaimRenderingProviderKey; //LABEL(Rendering Provider Key),DESCRIPTION(Provider Key used to identify the Rendering Provider),OPTIONAL,NULL();
		STRING ClaimPatientKey; //LABEL(Patient Key),DESCRIPTION(Patient Key),OPTIONAL,NULL();								
		STRING ClaimNumber; //LABEL(Claim Number),DESCRIPTION(Internal Claim Number To Identify Unique Claims),OPTIONAL,NULL();										
		STRING ClaimLineNumber; //LABEL(Claim Line Number),DESCRIPTION(Uniquely Identifier Individual Claim Line),OPTIONAL,NULL();									
		STRING ClaimBeginningDateOfService; //LABEL(Begging Date Of Service),DESCRIPTION(The Initial Date Of When A Service Was Provided),OPTIONAL,NULL();										
		STRING ClaimEndingDateOfService; //LABEL(Ending Date Of Service),DESCRIPTION(The Completion Date Of When A Service Was Provided),OPTIONAL,NULL();										
		STRING ClaimServiceDate; //LABEL(Service Date),DESCRIPTION(The Completion Date Of When A Service Was Provided),OPTIONAL,NULL();											
		STRING ClaimChargeAmount; //LABEL(Charge Amount),DESCRIPTION(Amount Charged For The Item),OPTIONAL,NULL();																
		STRING ClaimPaidAmount; //LABEL(Paid Amount),DESCRIPTION(Claim Amount Paid),OPTIONAL,NULL();
END;

EXPORT dsClaim := DATASET([],Layout_Claim);