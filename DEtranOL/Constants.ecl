EXPORT Constants := MODULE
EXPORT Sourcefile:= DATASET('~foreign::10.194.12.1::base::fcra_de_trano::transaction_log_online::qa::trans_online_id' , DEtranOL.Layout_Source, thor);
EXPORT VaultFile := DATASET('~test::base::fcra_de_trano::transaction_log_online::prod::trans_online_id' , DEtranOL.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,transaction_type,date_added';
EXPORT BasePrefix := '~test::base::fcra_de_trano::transaction_log_online';
EXPORT BaseSuffix := 'trans_online_id';
END;