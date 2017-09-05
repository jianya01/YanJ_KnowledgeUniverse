IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CurrentCarrier';
EXPORT BaseSuffix := 'transaction_log_policy_lien';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::cc_tranlpolicylien::transaction_log_policylien::qa::trans_log_id' , I_cc_transaction_log_policy_lien.Layout_Source, thor);
EXPORT SourcefileName:= '~base::cc_tranlpolicylien::transaction_log_policylien::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix , I_cc_transaction_log_policy_lien.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,policy_sequence,vehicle_or_property_sequence,sequence,date_added';

END;

