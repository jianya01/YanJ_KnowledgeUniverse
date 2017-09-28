IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'NCF';
EXPORT BaseSuffix := 'transaction_log_smd';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::ncf::qa::transaction_log_smd.txt' ,I_ncf_transaction_log_smd.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::ncf::qa::transaction_log_smd.txt';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_ncf_transaction_log_smd.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,date_added';

END;

