IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CurrentCarrier';
EXPORT BaseSuffix := 'transaction_log_policy_vehicle';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::cc_tranlpolicyveh::transaction_log_policyvehicle::qa::trans_log_id' , I_cc_transaction_log_policy_vehicle.Layout_Source, thor);
EXPORT SourcefileName:= 'base::cc_tranlpolicyveh::transaction_log_policyvehicle::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix , I_cc_transaction_log_policy_vehicle.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,policy_sequence,sequence,date_added';
EXPORT ModuleName := 'I_cc_transaction_log_policy_vehicle';

END;

