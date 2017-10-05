﻿IMPORT UT;
  EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'log_rules';
	 EXPORT BaseSuffix := 'transaction_log_address';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_rules::qa::transaction_log_address' , I_rules_transaction_log_address.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::log_rules::qa::transaction_log_address';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_rules_transaction_log_address.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id, person_seq, business_seq, address_seq, date_added';
   
   END;