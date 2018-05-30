IMPORT UT;
  EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'log_rules';
	 EXPORT BaseSuffix := 'transaction_log_attribute';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_rules::qa::transaction_log_attribute', I_rules_transaction_log_attribute.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::log_rules::qa::transaction_log_attribute';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_rules_transaction_log_attribute.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id,date_added';
   EXPORT ModuleName := 'I_rules_transaction_log_attribute';
   
   END;