﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'NCF';
EXPORT BaseSuffix := 'transaction_log_opr';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::ncf_transopr::transaction_log_opr::qa::trans_log_id' ,I_ncf_transaction_log_opr.Layout_Source, thor);
EXPORT SourcefileName:= 'base::ncf_transopr::transaction_log_opr::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_ncf_transaction_log_opr.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,date_added';

END;

