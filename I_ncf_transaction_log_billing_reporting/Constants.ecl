IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'NCF';
EXPORT BaseSuffix := 'transaction_log_billing_reporting';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::ncf_transr::transaction_log_billing_reporting::qa::trans_log_id' , I_ncf_transaction_log_billing_reporting.Layout_Source, thor);
EXPORT SourcefileName:= 'base::ncf_transr::transaction_log_billing_reporting::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_ncf_transaction_log_billing_reporting.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,date_added,vendor_to_bill';

END;

