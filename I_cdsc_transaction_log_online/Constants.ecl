﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CDSC';
EXPORT BaseSuffix := 'transaction_log_online';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::cdsc_trano::transaction_log_online::qa::trans_online_id' , I_cdsc_transaction_log_online.Layout_Source, thor);
EXPORT SourcefileName:= 'base::cdsc_trano::transaction_log_online::qa::trans_online_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_cdsc_transaction_log_online.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,type,date_added';

END;
