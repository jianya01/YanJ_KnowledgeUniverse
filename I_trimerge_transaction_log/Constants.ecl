IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_trimerge';
EXPORT BaseSuffix := 'transaction_log';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_trimerge::qa::transaction_log' ,I_trimerge_transaction_log.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_trimerge::qa::transaction_log';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_trimerge_transaction_log.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,date_added';
EXPORT ModuleName := 'I_trimerge_transaction_log';

END;

