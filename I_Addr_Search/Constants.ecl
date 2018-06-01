﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::advo';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'addr_search1';
blankDataset := dataset([], I_Addr_Search.Layout_Source);
fileName := UT.foreign_production_boca+'thor_data400::key::advo::fcra::qa::addr_search1';
EXPORT Sourcefile:= INDEX(blankDataset,{zip,prim_range,prim_name,addr_suffix,predir,postdir,sec_range},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::advo::fcra::qa::addr_search1';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_Addr_Search.Layout_Vault, thor, opt);
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::key::advo::prod::addr_search1';
EXPORT ModuleName := 'I_Addr_Search';
END;

