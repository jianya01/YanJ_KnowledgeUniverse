IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'DataEnhancement';
EXPORT BaseSuffix := 'inquiry_history';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::dataenh::inquiry_history::qa::id' , I_dataenh_inquiry_history.Layout_Source, thor);
EXPORT SourcefileName:= 'base::dataenh::inquiry_history::qa::id';
EXPORT VaultFile := DATASET(BasePrefix+'::'+BaseSuffix +'::prod', I_dataenh_inquiry_history.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,product_id,date_added,process_type,processing_time,vendor_code,request_type,product_version,reference_number';

END;

