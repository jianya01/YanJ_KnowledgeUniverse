IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CDSC';
EXPORT BaseSuffix := 'transaction_log_batch';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::cdsc_tranb::transaction_log_batch::qa::trans_batch_id' , I_cdsc_transaction_log_batch.Layout_Source, thor);
EXPORT SourcefileName:= 'base::cdsc_tranb::transaction_log_batch::qa::trans_batch_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_cdsc_transaction_log_batch.Layout_Vault, thor, opt);
EXPORT SourceKey := 'batch_job_id,batch_seq_number,transaction_type,date_added';
EXPORT ModuleName := 'I_cdsc_transaction_log_batch';

END;

