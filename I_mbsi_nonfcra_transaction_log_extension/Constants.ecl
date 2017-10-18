﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MBSI_NONFCRA';
EXPORT BaseSuffix := 'transaction_log_extension';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_mbsi::qa::transaction_log_extension' , I_mbsi_nonfcra_transaction_log_extension.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_mbsi::qa::transaction_log_extension';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_nonfcra_transaction_log_extension.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,extension_type,date_added';

END;

