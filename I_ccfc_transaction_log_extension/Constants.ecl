IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CCFC';
EXPORT BaseSuffix := 'transaction_log_extension';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_ccfc::qa::transaction_log_extension' , I_CCFC_transaction_log_extension.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_ccfc::qa::transaction_log_extension';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_CCFC_transaction_log_extension.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,extension_type,sequence,date_added';
EXPORT ModuleName := 'I_ccfc_transaction_log_extension';

END;

