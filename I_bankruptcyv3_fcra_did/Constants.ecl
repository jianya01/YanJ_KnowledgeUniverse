﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::bankruptcyv3::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'did_qa';
EXPORT blankDataset := dataset([],I_bankruptcyv3_fcra_did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::bankruptcyv3::fcra::did_qa ';
EXPORT Sourcefile:= INDEX(blankDataset,{did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::bankruptcyv3::fcra::did_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_bankruptcyv3_fcra_did.Layout_Vault, thor, opt);
EXPORT SourceKey := 'did,tmsid';
EXPORT vault_File_Name := '~vault::thor::key::bankruptcyv3::fcra::prod::did_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_bankruptcyv3_fcra_did';

END;

