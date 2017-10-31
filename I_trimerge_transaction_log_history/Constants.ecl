IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_trimerge';
EXPORT BaseSuffix := 'transaction_log_history';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_trimerge::qa::transaction_log_history' ,I_trimerge_transaction_log_history.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_trimerge::qa::transaction_log_history';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_trimerge_transaction_log_history.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,event_type';

END;

