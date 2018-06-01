IMPORT UT;
   EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'log_mbsi_fcra';
	 EXPORT BaseSuffix := 'transaction_log_batch';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_mbsi_fcra::qa::transaction_log_batch' , I_mbsi_fcra_transaction_log_batch.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::fcra::log_mbsi_fcra::qa::transaction_log_batch';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_mbsi_fcra_transaction_log_batch.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'type,date_added,batch_job_id,batch_seq_number';
   EXPORT ModuleName := 'I_mbsi_fcra_transaction_log_batch';
   
   END;
   
   
   
