IMPORT UT,STD;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::base::bankruptcy';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'search_v3';
EXPORT Sourcefile:= DATASET(ut.foreign_production_boca+'thor_data400::base::bankruptcy::search_v3' , I_Bankruptcy_Search.Layout_Source, thor);
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_Bankruptcy_Search.Layout_Vault, thor, opt);
EXPORT SourceFileName := '~thor_data400::base::bankruptcy::search_v3';
EXPORT Pkgvar := 'Bankruptcy_daily';
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::base::bankruptcy::prod::search_v3';
EXPORT ModuleName := 'I_Bankruptcy_Search';

END;

