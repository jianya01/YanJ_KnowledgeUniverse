IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'IVS';
EXPORT BaseSuffix := 'intermediate_log';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_ivs::qa::intermediate_log' , I_ivs_intermediate_log.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_ivs::qa::intermediate_log';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_ivs_intermediate_log.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,product_id,date_added,process_type,processing_time,vendor_code,request_type,product_version,content_data';

END;

