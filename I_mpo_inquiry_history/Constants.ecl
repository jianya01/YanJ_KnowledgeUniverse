IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MPO';
EXPORT BaseSuffix := 'inquiry_history';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::mpo::inquiry_history::qa::id' , I_mpo_inquiry_history.Layout_Source, thor);
EXPORT SourcefileName:= 'base::mpo::inquiry_history::qa::id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mpo_inquiry_history.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,product_id,date_added,process_type,processing_time,vendor_code,request_type,product_version,reference_number,content_data';
EXPORT ModuleName := 'I_mpo_inquiry_history';

END;

