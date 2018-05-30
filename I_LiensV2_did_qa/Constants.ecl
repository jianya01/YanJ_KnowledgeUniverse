﻿IMPORT UT;
EXPORT Constants := MODULE
EXPORT VaultNamePrefix := '~vault::thor::key'; 
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'liensv2::did_qa_sar';
EXPORT blankDataset := dataset([], I_LiensV2_did_qa.Layout_Source);
EXPORT fileName := '~thor_data400::key::liensv2::20180327::did';
EXPORT Sourcefile:= DEDUP(SORT(DISTRIBUTE(INDEX(blankDataset,{did},{blankDataset},filename)),RECORD,LOCAL),RECORD,LOCAL);
EXPORT SourcefileName:= '~thor_data400::key::liensv2::20180327::did';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_LiensV2_did_qa.Layout_Vault, thor, opt);
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::key::liensv2::did_qa_sar';
EXPORT Pkgvar := 'LiensV2DidQa';
EXPORT ModuleName := 'I_LiensV2_did_qa';

END;