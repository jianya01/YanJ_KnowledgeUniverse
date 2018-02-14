IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MVR';
EXPORT BaseSuffix := 'import_mvr_reference';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_mvr::qa::import_mvr_reference' , I_mvr_import_mvr_reference.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::fcra::log_mvr::qa::import_mvr_reference';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mvr_import_mvr_reference.Layout_Vault, thor, opt);
EXPORT SourceKey := 'import_ref_value_id';

END;


