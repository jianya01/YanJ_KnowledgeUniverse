IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_trimerge';
EXPORT BaseSuffix := 'transaction_log_opr';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_trimerge::qa::transaction_log_opr' ,I_trimerge_transaction_log_opr.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_trimerge::qa::transaction_log_opr';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_trimerge_transaction_log_opr.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id';

END;

