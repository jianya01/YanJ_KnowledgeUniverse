IMPORT UT,STD;

EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::base::tobacco';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'vente::vendor';
EXPORT Sourcefile:= DATASET(ut.foreign_production_alpha+'thor::base::tobacco::vente::qa::vendor' , I_Tobacco_Vente.Layout_Source, thor);
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_Tobacco_Vente.Layout_Vault, thor, opt);
EXPORT SourceFileName := '~thor::base::tobacco::vente::qa::vendor';
EXPORT Pkgvar := 'TobaccoVenteKeys';
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::base::tobacco::prod::vente::vendor';

END;

