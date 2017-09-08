IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'CurrentCarrier';
EXPORT BaseSuffix := 'transaction_log_person';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::cc_tranlperson::transaction_log_person::qa::trans_log_id' , I_cc_transaction_log_person.Layout_Source, thor);
EXPORT SourcefileName:= 'base::cc_tranlperson::transaction_log_person::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_cc_transaction_log_person.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,date_added';

END;

