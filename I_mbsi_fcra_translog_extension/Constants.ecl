﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_mbsi_fcra';
EXPORT BaseSuffix := 'transaction_log_extension';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_mbsi_fcra::qa::transaction_log_extension' , I_mbsi_fcra_translog_extension.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::fcra::log_mbsi_fcra::qa::transaction_log_extension';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_fcra_translog_extension.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,extension_type,date_added';
EXPORT ModuleName := 'I_mbsi_fcra_translog_extension';

END;

