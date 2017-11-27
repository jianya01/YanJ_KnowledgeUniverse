IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CLUE';
EXPORT BaseSuffix := 'transaction_log_report_code';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_clue::qa::transaction_log_report_code' , I_clue_transaction_log_report_code.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::fcra::log_clue::qa::transaction_log_report_code';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_clue_transaction_log_report_code.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,report_code';

END;

