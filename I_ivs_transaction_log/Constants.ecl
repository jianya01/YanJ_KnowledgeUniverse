IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'IVS';
EXPORT BaseSuffix := 'transaction_log';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_ivs::qa::transaction_log',I_ivs_transaction_log.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_ivs::qa::transaction_log';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_ivs_transaction_log.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,date_added';
EXPORT ModuleName := 'I_ivs_transaction_log';

END;

