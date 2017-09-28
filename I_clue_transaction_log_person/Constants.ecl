IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CLUE';
EXPORT BaseSuffix := 'transaction_log_person';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::clue::qa::transaction_log_person.txt' , I_clue_transaction_log_person.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::clue::qa::transaction_log_person.txt';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_clue_transaction_log_person.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,date_added';

END;

