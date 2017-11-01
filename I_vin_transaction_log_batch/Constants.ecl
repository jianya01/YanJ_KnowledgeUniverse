﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'VIN';
EXPORT BaseSuffix := 'transaction_log_batch';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_vin::qa::transaction_log_batch' , I_vin_transaction_log_batch.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_vin::qa::transaction_log_batch';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_vin_transaction_log_batch.Layout_Vault, thor, opt);
EXPORT SourceKey := 'batch_job_id,batch_seq_number,type,date_added';

END;

