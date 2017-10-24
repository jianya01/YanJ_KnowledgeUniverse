IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MVR';
EXPORT BaseSuffix := 'transaction_log_detail';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_mvr::qa::transaction_log_detail' , I_mvr_transaction_log_detail.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::fcra::log_mvr::qa::transaction_log_detail';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mvr_transaction_log_detail.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence_number,date_added';

END;

