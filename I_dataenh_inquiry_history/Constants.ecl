IMPORT UT;
EXPORT Constants := MODULE

EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::dataenh::inquiry_history::qa::id' , I_dataenh_inquiry_history.Layout_Source, thor);
EXPORT SourcefileName:= 'base::dataenh::inquiry_history::qa::id';
EXPORT VaultFile := DATASET('~base::dataenh::inquiry_history::prod::id', I_dataenh_inquiry_history.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,product_id,date_added,process_type,processing_time,vendor_code,request_type,product_version,reference_number';
EXPORT BasePrefix := '~base::dataenh::inquiry_history';
EXPORT BaseSuffix := 'id';
END;

