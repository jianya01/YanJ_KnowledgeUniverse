IMPORT UT;
  EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'scoring';
	 EXPORT BaseSuffix := 'transaction_log';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_scoring::qa::transaction_log' , I_scoring_transaction_log.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::fcra::log_scoring::qa::transaction_log';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_scoring_transaction_log.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id,date_added';
   EXPORT ModuleName := 'I_scoring_transaction_log';
   
   END;