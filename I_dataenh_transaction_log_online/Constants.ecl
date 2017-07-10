IMPORT UT;
EXPORT Constants := MODULE

EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::fcra_de_trano::transaction_log_online::qa::trans_online_id' , I_dataenh_transaction_log_online.Layout_Source, thor);
EXPORT SourcefileName:= 'base::fcra_de_trano::transaction_log_online::qa::trans_online_id';
EXPORT VaultFile := DATASET('~base::fcra_de_trano::transaction_log_online::prod::trans_online_id', I_dataenh_transaction_log_online.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,transaction_type';
EXPORT BasePrefix := '~base::fcra_de_trano::transaction_log_online';
EXPORT BaseSuffix := 'trans_online_id';
END;

