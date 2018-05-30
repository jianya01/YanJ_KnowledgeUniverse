IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MVR';
EXPORT BaseSuffix := 'transaction_report_view_log';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::mvr_tranrv::transaction_log_rv::qa::trans_reportview_id' , I_mvr_transaction_report_view_log.Layout_Source, thor);
EXPORT SourcefileName:= 'base::mvr_tranrv::transaction_log_rv::qa::trans_reportview_id ';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mvr_transaction_report_view_log.Layout_Vault, thor, opt);
EXPORT SourceKey := 'report_view_log_id,date_added';
EXPORT ModuleName := 'I_mvr_transaction_report_view_log';

END;

