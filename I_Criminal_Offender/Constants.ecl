IMPORT UT;

EXPORT Constants := MODULE


EXPORT VaultNamePrefix := '~vault::thor::base';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'corrections_offenders_public';
EXPORT Sourcefile:= DEDUP(SORT(DISTRIBUTE(DATASET(UT.foreign_production_boca+'thor_data400::base::corrections_offenders_public' , I_Criminal_Offender.Layout_Source, thor)),RECORD,LOCAL),RECORD,LOCAL);
EXPORT SourcefileName:= 'thor_data400::base::corrections_offenders_public_father';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_Criminal_Offender.Layout_Vault, thor, opt);
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::base::prod::corrections_offenders_public';
EXPORT Pkgvar := 'Corrections_Build_Version';
END;

