IMPORT UT;
   EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'cluecomm';
	 EXPORT BaseSuffix := 'transaction_log_priorpolicyno';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::cclue::qa::transaction_log_priorpolicyno.txt' , I_cluecomm_transaction_log_priorpolicyno.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::cclue::qa::transaction_log_priorpolicyno.txt';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_cluecomm_transaction_log_priorpolicyno.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'sequence,transaction_id';

   END;
   
   
   
   
   
