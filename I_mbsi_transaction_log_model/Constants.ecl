IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MBSI';
EXPORT BaseSuffix := 'transaction_log_model';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_mbsi::qa::transaction_log_model' , I_mbsi_transaction_log_model.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_mbsi::qa::transaction_log_model';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_transaction_log_model.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,date_added';
EXPORT ModuleName := 'I_mbsi_transaction_log_model';

END;

