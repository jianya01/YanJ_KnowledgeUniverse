IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'LEADMGMT';
EXPORT BaseSuffix := 'transaction_log_online';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::lead_trano::transaction_log_online::qa::trans_online_id' , I_leadmgmt_transaction_log_online.Layout_Source, thor);
EXPORT SourcefileName:= 'base::lead_trano::transaction_log_online::qa::trans_online_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_leadmgmt_transaction_log_online.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,transaction_type,date_added';
EXPORT ModuleName := 'I_leadmgmt_transaction_log_online';

END;

