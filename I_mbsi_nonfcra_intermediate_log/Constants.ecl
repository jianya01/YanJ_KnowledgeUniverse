IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MBSI_NONFCRA';
EXPORT BaseSuffix := 'intermediate_log';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::mbsi::inquiry_history::qa::id' , I_mbsi_nonfcra_intermediate_log.Layout_Source, thor);
EXPORT SourcefileName:= 'base::mbsi::inquiry_history::qa::id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_nonfcra_intermediate_log.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,product_id,date_added,process_type,processing_time,vendor_code,request_type,product_version,reference_number,content_data';

END;

