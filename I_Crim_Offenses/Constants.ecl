IMPORT UT;

EXPORT Constants := MODULE


EXPORT VaultNamePrefix := '~vault::thor::base';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'corrections_court_offenses_public';
EXPORT Sourcefile:= DEDUP(SORT(DISTRIBUTE(DATASET(UT.foreign_production_boca+'thor_data400::base::corrections_court_offenses_public' , I_Crim_Offenses.Layout_Source, thor)),RECORD,LOCAL),RECORD,LOCAL);
EXPORT SourcefileName:= 'thor_data400::base::corrections_court_offenses_public';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_Crim_Offenses.Layout_Vault, thor, opt);
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::base::prod::corrections_court_offenses_public';
EXPORT Pkgvar := 'Corrections_Build_Version';
END;

