﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::gong_history::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'phone';
EXPORT blankDataset := dataset([],I_gong_history_fcra_phone.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::gong_history::fcra::qa::phone';
EXPORT Sourcefile:= INDEX(blankDataset,{p7,p3,st,current_flag,business_flag},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::gong_history::fcra::qa::phone';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_gong_history_fcra_phone.Layout_Vault, thor, opt);
EXPORT SourceKey := 'persistent_record_id';
EXPORT vault_File_Name := '~vault::thor::key::gong_history::fcra::prod::phone';
 //EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_gong_history_fcra_phone';

END;



