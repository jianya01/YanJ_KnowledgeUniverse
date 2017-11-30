﻿IMPORT UT;
EXPORT Constants := MODULE

		EXPORT VaultNamePrefix := '~vault::thor::translogs';
		EXPORT BasePrefix := VaultNamePrefix+'::'+'DD';
		EXPORT BaseSuffix := 'transaction_log_online';
		EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_dd::qa::transaction_log_online' , I_dd_transaction_log_online.Layout_Source, thor);
		EXPORT SourcefileName:= 'thor::base::log_dd::qa::transaction_log_online';
		EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_dd_transaction_log_online.Layout_Vault, thor, opt);
		EXPORT SourceKey := 'transaction_id,type,date_added';

END;
