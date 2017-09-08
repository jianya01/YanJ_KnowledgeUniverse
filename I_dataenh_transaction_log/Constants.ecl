IMPORT UT;
   EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'DataEnhancement';
	 EXPORT BaseSuffix := 'transaction_log';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::fcra_de_tranl::transaction_log::qa::trans_log_id' , I_dataenh_transaction_log.Layout_Source, thor);
   EXPORT SourcefileName:= 'base::fcra_de_tranl::transaction_log::qa::trans_log_id';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_dataenh_transaction_log.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id, date_added';

   END;
   
