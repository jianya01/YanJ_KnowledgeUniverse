﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::Insurance_Prescreen';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'final';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'out::insurance::prescreen::201804::final' , I_Insurance_Prescreen.Layout_Source, thor);
//EXPORT Sourcefile:= DATASET('~out::insurance::prescreen::201711::final' , I_Insurance_Prescreen.Layout_Source, thor);
//EXPORT SourcefileName:= 'out::insurance::prescreen::qa::final';
EXPORT SourcefileName:= 'out::insurance::prescreen::201804::final';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_Insurance_Prescreen.Layout_Vault, thor, opt);
EXPORT SourceKey := 'Lexid,encrypted_pin';
EXPORT vault_File_Name := '~vault::thor::Insurance_Prescreen::prod::final';
END;

