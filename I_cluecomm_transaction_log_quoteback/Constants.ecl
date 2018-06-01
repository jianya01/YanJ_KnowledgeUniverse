IMPORT UT;
   EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'cluecomm';
	 EXPORT BaseSuffix := 'transaction_log_quoteback';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::cclue::qa::transaction_log_quoteback.txt' , I_cluecomm_transaction_log_quoteback.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::cclue::qa::transaction_log_quoteback.txt';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_cluecomm_transaction_log_quoteback.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id,sequence';
   EXPORT ModuleName := 'I_cluecomm_transaction_log_quoteback';
   
   END;
   
   
   
   

