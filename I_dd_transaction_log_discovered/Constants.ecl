IMPORT UT;
EXPORT Constants := MODULE

		EXPORT VaultNamePrefix := '~vault::thor::translogs';
		EXPORT BasePrefix := VaultNamePrefix+'::'+'DD';
		EXPORT BaseSuffix := 'transaction_log_discovered';
		EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_dd::qa::transaction_log_discovered' , I_dd_transaction_log_discovered.Layout_Source, thor);
		EXPORT SourcefileName:= 'thor::base::log_dd::qa::transaction_log_discovered';
		EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_dd_transaction_log_discovered.Layout_Vault, thor, opt);
		EXPORT SourceKey := 'transaction_id,date_added,account_number,dd_lexid,dd_inqstate,dd_datelastreported,product_id,dd_last_name,dd_first_name,dd_dob,dd_dln,dd_dln_state,dd_ssn';
		EXPORT ModuleName := 'I_dd_transaction_log_discovered';
		
END;

