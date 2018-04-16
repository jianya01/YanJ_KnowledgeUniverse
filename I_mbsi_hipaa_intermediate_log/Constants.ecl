﻿IMPORT UT;
   EXPORT Constants := MODULE
   
   EXPORT VaultNamePrefix := '~vault::thor::translogs';
	 EXPORT BasePrefix := VaultNamePrefix+'::'+'mbsi_hipaa';
	 EXPORT BaseSuffix := 'intermediate_log';
	 EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_mbsi_hipaa::qa::intermediate_log' , I_mbsi_hipaa_intermediate_log.Layout_Source, thor);
   EXPORT SourcefileName:= 'thor::base::log_mbsi_hipaa::qa::intermediate_log';
   EXPORT VaultFile := DATASET(BasePrefix +'::prod::'+BaseSuffix, I_mbsi_hipaa_intermediate_log.Layout_Vault, thor, opt);
   EXPORT SourceKey := 'transaction_id,product_id,date_added,process_type,processing_time,source_code,content_type,version,reference_number,content_data';

   END;
   
   
   