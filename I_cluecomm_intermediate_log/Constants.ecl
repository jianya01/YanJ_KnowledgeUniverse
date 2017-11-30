IMPORT UT;
   EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'cluecomm';
	 EXPORT BaseSuffix := 'intermediate_log';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_cluecomm::qa::intermediate_log', I_cluecomm_intermediate_log.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::log_cluecomm::qa::intermediate_log';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_cluecomm_intermediate_log.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id, product_id, reference_number, date_added, process_type, processing_time, source_code, content_type,Content_data';

   END;
   
   
   
   

