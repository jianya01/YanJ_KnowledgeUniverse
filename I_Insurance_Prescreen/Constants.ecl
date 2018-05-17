﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::Insurance_Prescreen';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'final';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'out::insurance::prescreen::qa::final' , I_Insurance_Prescreen.Layout_Source, thor);
EXPORT SourcefileName:= 'out::insurance::prescreen::qa::final';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_Insurance_Prescreen.Layout_Vault, thor, opt);
EXPORT SourceKey := 'Lexid,encrypted_pin';
EXPORT vault_File_Name := '~vault::thor::Insurance_Prescreen::prod::final';
END;

