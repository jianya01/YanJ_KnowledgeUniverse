IMPORT UT,STD;
EXPORT Constants := MODULE

EXPORT Sourcefile:= DATASET(ut.foreign_production_boca+'thor_data400::base::bankruptcy::search_v3_father' , I_Bankruptcy_Search.Layout_Source, thor);
EXPORT VaultFile := DATASET('~thor_data400::base::bankruptcy::prod::search_v3', I_Bankruptcy_Search.Layout_Vault, thor, opt);
EXPORT BasePrefix := '~thor_data400::base::bankruptcy';
EXPORT BaseSuffix := 'search_v3';
EXPORT SourceFileName := '~thor_data400::base::bankruptcy::search_v3';
EXPORT Pkgvar := 'Bankruptcy_daily';

END;

