IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CLUE';
EXPORT BaseSuffix := 'transaction_log_claim';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::clue::qa::transaction_log_claim.txt' , I_clue_transaction_log_claim.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::clue::qa::transaction_log_claim.txt';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_clue_transaction_log_claim.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,date_added';
EXPORT ModuleName := 'I_clue_transaction_log_claim';

END;

