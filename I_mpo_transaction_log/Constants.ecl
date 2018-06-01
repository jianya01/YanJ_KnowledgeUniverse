IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MPO';
EXPORT BaseSuffix := 'transaction_log';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::cluempo_tranl::transaction_log::qa::trans_log_id' , I_mpo_transaction_log.Layout_Source, thor);
EXPORT SourcefileName:= 'base::cluempo_tranl::transaction_log::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mpo_transaction_log.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,date_added';
EXPORT ModuleName := 'I_mpo_transaction_log';

END;

