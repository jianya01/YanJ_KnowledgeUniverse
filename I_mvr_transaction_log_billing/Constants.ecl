IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MVR';
EXPORT BaseSuffix := 'transaction_log_billing';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_mvr::qa::transaction_log_billing' , I_mvr_transaction_log_billing.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::fcra::log_mvr::qa::transaction_log_billing';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mvr_transaction_log_billing.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,date_added';

END;

