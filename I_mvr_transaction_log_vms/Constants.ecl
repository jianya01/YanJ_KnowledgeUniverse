IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MVR';
EXPORT BaseSuffix := 'transaction_log_vms';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::mvr_tranvm::transaction_log_vms::qa::trans_vms_id' , I_mvr_transaction_log_vms.Layout_Source, thor);
EXPORT SourcefileName:= 'base::mvr_tranvm::transaction_log_vms::qa::trans_vms_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mvr_transaction_log_vms.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,date_added';

END;

