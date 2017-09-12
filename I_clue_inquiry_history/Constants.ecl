IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CLUE';
EXPORT BaseSuffix := 'inquiry_history';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::clue::inquiry_history::qa::id' , I_clue_inquiry_history.Layout_Source, thor);
EXPORT SourcefileName:= 'base::clue::inquiry_history::qa::id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_clue_inquiry_history.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,product_id,date_added,process_type,processing_time,vendor_code,request_type,product_version,reference_number,LENGTH(TRIM(content_data))';

END;

