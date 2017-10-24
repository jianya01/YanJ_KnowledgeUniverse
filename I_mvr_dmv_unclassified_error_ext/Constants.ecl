IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MVR';
EXPORT BaseSuffix := 'dmv_unclassified_error_ext';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_mvr::qa::dmv_unclassified_error_ext' , I_mvr_dmv_unclassified_error_ext.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::fcra::log_mvr::qa::dmv_unclassified_error_ext';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mvr_dmv_unclassified_error_ext.Layout_Vault, thor, opt);
EXPORT SourceKey := 'record_id';

END;

