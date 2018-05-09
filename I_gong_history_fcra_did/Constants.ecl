﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::gong_history::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'did';
EXPORT blankDataset := dataset([],I_gong_history_fcra_did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::gong_history::fcra::qa::did';
EXPORT Sourcefile:= INDEX(blankDataset,{l_did,current_flag,business_flag},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::gong_history::fcra::qa::did';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_gong_history_fcra_did.Layout_Vault, thor, opt);
EXPORT SourceKey := 'persistent_record_id';
EXPORT vault_File_Name := '~vault::thor::key::gong_history::fcra::prod::did';
 EXPORT Pkgvar := '';
END;



