EXPORT Constants := MODULE


EXPORT Sourcefile:= DATASET('~base::cc_tranlpolicy::transaction_log_policy::qa::trans_log_id_SLIM' , CCtlogPol.Layout_Source, thor);
EXPORT VaultFile := DATASET('~testLog::base::cc_tranlpolicy::tlog_policy::Prod::trans_log_id', CCtlogPol.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,date_added';
EXPORT BasePrefix := '~testLog::base::cc_tranlpolicy::tlog_policy';
EXPORT BaseSuffix := 'trans_log_id';
END;

