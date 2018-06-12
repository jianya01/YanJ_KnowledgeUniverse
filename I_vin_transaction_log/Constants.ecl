IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'VIN';
EXPORT BaseSuffix := 'transaction_log';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::vin_tranl::transaction_log::qa::trans_log_id' , I_vin_transaction_log.Layout_Source, thor);
EXPORT SourcefileName:= 'base::vin_tranl::transaction_log::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_vin_transaction_log.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,date_added';
EXPORT ModuleName := 'I_vin_transaction_log';

END;

