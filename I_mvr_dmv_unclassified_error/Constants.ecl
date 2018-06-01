IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MVR';
EXPORT BaseSuffix := 'dmv_unclassified_error';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_mvr::qa::dmv_unclassified_error' , I_mvr_dmv_unclassified_error.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::fcra::log_mvr::qa::dmv_unclassified_error';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mvr_dmv_unclassified_error.Layout_Vault, thor, opt);
EXPORT SourceKey := 'record_id';
EXPORT ModuleName := 'I_mvr_dmv_unclassified_error';

END;

