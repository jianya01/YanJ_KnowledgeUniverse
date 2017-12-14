﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_tlmxmbl';
EXPORT BaseSuffix := 'transaction_log';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_tlmxmbl::qa::transaction_log' , I_Telematics_translog.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_tlmxmbl::qa::transaction_log';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_Telematics_translog.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,date_added';

END;

