IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'NCF';
EXPORT BaseSuffix := 'transaction_log_batch';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::ncf_transb::transaction_log_batch::qa::trans_batch_id' , I_ncf_transaction_log_batch.Layout_Source, thor);
EXPORT SourcefileName:= 'base::ncf_transb::transaction_log_batch::qa::trans_batch_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_ncf_transaction_log_batch.Layout_Vault, thor, opt);
EXPORT SourceKey := 'batch_job_id,batch_seq_number,transaction_type,date_added';

END;

