IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CurrentCarrier';
EXPORT BaseSuffix := 'transaction_log_policy';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::cc_tranlpolicy::transaction_log_policy::qa::trans_log_id' , I_cc_transaction_log_policy.Layout_Source, thor);
EXPORT SourcefileName:= 'base::cc_tranlpolicy::transaction_log_policy::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix , I_cc_transaction_log_policy.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,date_added';

END;

