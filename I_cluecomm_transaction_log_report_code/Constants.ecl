IMPORT UT;
   EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'cluecomm';
	 EXPORT BaseSuffix := 'transaction_log_report_code';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_cluecomm::qa::transaction_log_report_code' , I_cluecomm_transaction_log_report_code.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::log_cluecomm::qa::transaction_log_report_code';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_cluecomm_transaction_log_report_code.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id,report_code';
   EXPORT ModuleName := 'I_cluecomm_transaction_log_report_code';
   
   END;
   
   
   
   
   

