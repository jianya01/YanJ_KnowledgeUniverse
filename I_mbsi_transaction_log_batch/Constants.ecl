IMPORT UT;
EXPORT Constants := MODULE

	EXPORT VaultNamePrefix := '~vault::thor::translogs';
	EXPORT BasePrefix := VaultNamePrefix+'::'+'MBSI';
	EXPORT BaseSuffix := 'transaction_log_batch';
	EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::mbsi_tranb::transaction_log_batch::qa::trans_batch_id' , I_mbsi_transaction_log_batch.Layout_Source, thor);
	EXPORT SourcefileName:= 'base::mbsi_tranb::transaction_log_batch::qa::trans_batch_id';
	EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_transaction_log_batch.Layout_Vault, thor, opt);
	EXPORT SourceKey := 'transaction_type,date_added,batch_job_id,batch_seq_number';

END;

