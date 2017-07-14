IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'DataEnhancement';
EXPORT BaseSuffix := 'transaction_log_online';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::fcra_de_trano::transaction_log_online::qa::trans_online_id' , I_dataenh_transaction_log_online.Layout_Source, thor);
EXPORT SourcefileName:= 'base::fcra_de_trano::transaction_log_online::qa::trans_online_id';
EXPORT VaultFile := DATASET(BasePrefix+'::'+BaseSuffix +'::prod', I_dataenh_transaction_log_online.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,transaction_type,date_added';

END;

