﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::thrive::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'did';
EXPORT blankDataset := dataset([],I_thrive_fcra_did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::thrive::fcra::qa::did';
EXPORT Sourcefile:= INDEX(blankDataset,{did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::thrive::fcra::qa::did';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_thrive_fcra_did.Layout_Vault, thor, opt);
EXPORT SourceKey := 'persistent_record_id';
EXPORT vault_File_Name := '~vault::thor::key::thrive::fcra::prod::did';
// EXPORT Pkgvar := '';
END;

