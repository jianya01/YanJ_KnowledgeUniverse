IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'LEADMGMT';
EXPORT BaseSuffix := 'inquiry_history';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::lead::inquiry_history::qa::id' , I_leadmgmt_inquiry_history.Layout_Source, thor);
EXPORT SourcefileName:= 'base::lead::inquiry_history::qa::id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_leadmgmt_inquiry_history.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,product_id,date_added,process_type,processing_time,source_code,content_type,version,reference_number,content_data';
EXPORT ModuleName := 'I_leadmgmt_inquiry_history';

END;

