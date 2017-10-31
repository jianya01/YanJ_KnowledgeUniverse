IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_mbsi_fcra';
EXPORT BaseSuffix := 'inquiry_history';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::fcra_mbsi::inquiry_history::qa::id' , I_mbsi_fcra_translog_inquiry.Layout_Source, thor);
EXPORT SourcefileName:= 'base::fcra_mbsi::inquiry_history::qa::id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_fcra_translog_inquiry.Layout_Vault, thor, opt);
EXPORT SourceKey := 'RECORD';

END;

