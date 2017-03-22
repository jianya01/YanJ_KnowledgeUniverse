  EXPORT Layout_Log_NCF_Transaction_Log_Liens_Judgements := RECORD
  UNSIGNED8   Vault_Rid;	
	UNSIGNED8		LexID := 0 ;						
	STRING20		TransactionID;				
	STRING 		  Date_Last_Seen;																	
	STRING		  VendorLiensAndJudgements;	
	STRING20    Vendor;
	STRING4     ProcessType;
	STRING20    ContentType;
	END;
	
	
	
	
	
	
	
		