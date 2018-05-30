IMPORT UT;
   EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'mbsi_hipaa';
	 EXPORT BaseSuffix := 'transaction_log_billing_tracking';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_mbsi_hipaa::qa::transaction_log_billing_tracking' , I_mbsi_hipaa_transaction_log_billing_tracking.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::log_mbsi_hipaa::qa::transaction_log_billing_tracking';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_mbsi_hipaa_transaction_log_billing_tracking.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'request_id';
   EXPORT ModuleName := 'I_mbsi_hipaa_transaction_log_billing_tracking';
   
   END;
   
   
   
