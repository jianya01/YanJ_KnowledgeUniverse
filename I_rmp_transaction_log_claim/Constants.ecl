IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'RMP';
EXPORT BaseSuffix := 'transaction_log_claim';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_rmp::qa::transaction_log_claim' , I_rmp_transaction_log_claim.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_rmp::qa::transaction_log_claim';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_rmp_transaction_log_claim.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,transaction_date_added';

END;

