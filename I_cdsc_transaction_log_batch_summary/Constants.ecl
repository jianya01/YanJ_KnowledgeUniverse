IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CDSC';
EXPORT BaseSuffix := 'transaction_log_batch_summary';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_cdsc::qa::transaction_log_batch_summary' , I_cdsc_transaction_log_batch_summary.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_cdsc::qa::transaction_log_batch_summary';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_cdsc_transaction_log_batch_summary.Layout_Vault, thor, opt);
EXPORT SourceKey := 'batch_job_id';
EXPORT ModuleName := 'I_cdsc_transaction_log_batch_summary';

END;

