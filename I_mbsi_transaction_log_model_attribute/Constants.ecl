IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MBSI';
EXPORT BaseSuffix := 'transaction_log_model_attribute';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_mbsi::qa::transaction_log_model_attribute' , I_mbsi_transaction_log_model_attribute.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_mbsi::qa::transaction_log_model_attribute';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_transaction_log_model_attribute.Layout_Vault, thor, opt);
EXPORT SourceKey := 'date_added,transaction_id,model_sequence,person_sequence,attribute_sequence';

END;

