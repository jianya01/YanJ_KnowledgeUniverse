IMPORT UT;
  EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'log_rules';
	 EXPORT BaseSuffix := 'transaction_log_police';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+' thor::base::log_rules::qa::transaction_log_police' , I_rules_transaction_log_police.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::log_rules::qa::transaction_log_police';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_rules_transaction_log_police.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id, agency_type, order_id, claim_number, claim_state, date_loss, report_type, policy_number, return_options, order_type, initial_status, date_returned, data_elements, return, report_available, date_added, agency_name';
   
   END;