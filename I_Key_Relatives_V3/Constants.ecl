﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'relatives_v3_qa';
blankDataset := dataset([], I_Key_Relatives_V3.Layout_Source);
fileName := UT.foreign_production_Alpha+'thor_data400::key::relatives_v3_qa';
EXPORT Sourcefile:= DEDUP(SORT(DISTRIBUTE(INDEX(blankDataset,{did1},{blankDataset},filename)),RECORD,LOCAL),RECORD,LOCAL);
EXPORT SourcefileName:= 'thor_data400::key::relatives_v3_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_Key_Relatives_V3.Layout_Vault, thor, opt);
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::key::prod::relatives_v3_qa';
EXPORT Pkgvar := 'RelativesV3Keys';
END;

