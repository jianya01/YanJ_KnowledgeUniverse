﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'aca_institutions_addr_qa';
blankDataset := dataset([], I_ACA_Addr.Layout_Source);
fileName := UT.foreign_production_boca+'thor_data400::key::aca_institutions_addr_father';
EXPORT Sourcefile:= INDEX(blankDataset,{prim_name,prim_range,zip,sec_range},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::aca_institutions_addr_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_ACA_Addr.Layout_Vault, thor, opt);
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::key::prod::aca_institutions_addr_qa';
// EXPORT Pkgvar := 'RelativesV3Keys';
END;

