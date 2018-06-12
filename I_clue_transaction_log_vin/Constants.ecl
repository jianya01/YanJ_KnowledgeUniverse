IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CLUE';
EXPORT BaseSuffix := 'transaction_log_vin';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::clue::qa::transaction_log_vin.txt' , I_clue_transaction_log_vin.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::clue::qa::transaction_log_vin.txt';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_clue_transaction_log_vin.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,unit_no,date_added';
EXPORT ModuleName := 'I_clue_transaction_log_vin';

END;

