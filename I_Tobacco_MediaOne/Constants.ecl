IMPORT UT,STD;

EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::base::tobacco';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'mediaone::vendor';
EXPORT Sourcefile:= DATASET(ut.foreign_production_alpha+'thor::base::tobacco::mediaone::qa::vendor' , I_Tobacco_MediaOne.Layout_Source, thor);
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_Tobacco_MediaOne.Layout_Vault, thor, opt);
EXPORT SourceFileName := '~thor::base::tobacco::mediaone::qa::vendor';
// EXPORT Pkgvar := 'Bankruptcy_daily';
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::base::tobacco::prod::mediaone::vendor';

END;

