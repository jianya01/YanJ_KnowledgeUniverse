IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'DataEnhancement';
EXPORT BaseSuffix := 'transaction_log_batch_summary';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::fcra_de_log::batch_summary::qa::batch_sum_batch_id' , I_dataenh_transaction_log_batch_summary.Layout_Source, thor);
EXPORT SourcefileName:= 'base::fcra_de_log::batch_summary::qa::batch_sum_batch_id';
EXPORT VaultFile := DATASET(BasePrefix+'::'+BaseSuffix +'::prod', I_dataenh_transaction_log_batch_summary.Layout_Vault, thor, opt);
EXPORT SourceKey := 'batch_job_id';


END;
