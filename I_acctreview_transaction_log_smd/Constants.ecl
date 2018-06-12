IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'AcctReview';
EXPORT BaseSuffix := 'transaction_log_smd';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::acctreview_tranl_smd::transaction_log_smd::qa::trans_log_id' , I_acctreview_transaction_log_smd.Layout_Source, thor);
EXPORT SourcefileName:= 'base::acctreview_tranl_smd::transaction_log_smd::qa::trans_log_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_acctreview_transaction_log_smd.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,sequence,date_added';
EXPORT ModuleName := 'I_acctreview_transaction_log_smd';

END;

