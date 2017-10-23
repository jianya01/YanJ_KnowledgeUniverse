IMPORT UT,STD;

EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::base::tobacco';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'realsource::vendor';
EXPORT Sourcefile:= DATASET(ut.foreign_production_alpha+'thor::base::tobacco::realsource::qa::vendor' , I_Tobacco_Realsource.Layout_Source, thor);
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_Tobacco_Realsource.Layout_Vault, thor, opt);
EXPORT SourceFileName := '~thor::base::tobacco::realsource::qa::vendor';
EXPORT Pkgvar := 'TobaccoRealsourceKeys';
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::base::tobacco::prod::realsource::vendor';

END;

