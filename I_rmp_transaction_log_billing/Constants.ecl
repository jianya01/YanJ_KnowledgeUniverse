IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'RMP';
EXPORT BaseSuffix := 'transaction_log_billing';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_rmp::qa::transaction_log_billing' , I_rmp_transaction_log_billing.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_rmp::qa::transaction_log_billing';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_rmp_transaction_log_billing.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,billed_report_code';
EXPORT ModuleName := 'I_rmp_transaction_log_billing';

END;

