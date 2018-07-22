﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::advo::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'addr_search1';
EXPORT blankDataset := dataset([],I_advo_fcra_addr_search1.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::advo::fcra::qa::addr_search1';
EXPORT Sourcefile:= INDEX(blankDataset,{zip, prim_range, prim_name,addr_suffix,predir ,postdir,sec_range},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::advo::fcra::qa::addr_search1';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_advo_fcra_addr_search1.Layout_Vault, thor, opt);
EXPORT SourceKey := 'zip_5, prim_range, prim_name, sec_range,advo_key,route_num';
EXPORT vault_File_Name := '~vault::thor::key::advo::fcra::prod::addr_search1';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_advo_fcra_addr_search1';

END;


