IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_trimerge';
EXPORT BaseSuffix := 'transaction_log_extension';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_trimerge::qa::transaction_log_extension' ,I_trimerge_transaction_log_extension.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_trimerge::qa::transaction_log_extension';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_trimerge_transaction_log_extension.Layout_Vault, thor, opt);
EXPORT SourceKey := 'extension_type,sequence,date_added,transaction_id,sequence_smd,person_type';

END;

