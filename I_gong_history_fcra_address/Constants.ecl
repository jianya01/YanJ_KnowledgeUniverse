﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::gong_history::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'address';
EXPORT blankDataset := dataset([],I_gong_history_fcra_address.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::gong_history::fcra::qa::address';
EXPORT Sourcefile:= INDEX(blankDataset,{prim_name,st,z5,prim_range,sec_range,current_flag,business_flag},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::gong_history::fcra::qa::address';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_gong_history_fcra_address.Layout_Vault, thor, opt);
EXPORT SourceKey := 'persistent_record_id';
EXPORT vault_File_Name := '~vault::thor::key::gong_history::fcra::prod::address';
// EXPORT Pkgvar := '';
END;

