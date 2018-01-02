IMPORT UT;
   EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'mbsi_hipaa';
	 EXPORT BaseSuffix := 'transaction_log';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_mbsi_hipaa::qa::transaction_log' , I_mbsi_hipaa_transaction_log.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::log_mbsi_hipaa::qa::transaction_log';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_mbsi_hipaa_transaction_log.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id,date_added';

   END;
   
   
   
