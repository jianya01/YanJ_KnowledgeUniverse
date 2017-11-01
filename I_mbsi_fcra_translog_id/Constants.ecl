IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_mbsi_fcra';
EXPORT BaseSuffix := 'transaction_log_id';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::fcra_mbsi_tranl::transaction_log::qa::trans_log_id' , I_mbsi_fcra_translog_id.Layout_Source, thor);
EXPORT SourcefileName:= 'base::fcra_mbsi_tranl::transaction_log::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_fcra_translog_id.Layout_Vault, thor, opt);
EXPORT SourceKey := 'date_added,transaction_id';

END;

