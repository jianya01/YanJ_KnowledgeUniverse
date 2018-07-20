﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::bankruptcyv3::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'withdrawnstatus';
EXPORT blankDataset := dataset([],I_bankruptcyv3_fcra_withdrawnstatus.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::bankruptcyv3::fcra::qa::withdrawnstatus';
EXPORT Sourcefile:= INDEX(blankDataset,{tmsid,caseid,defendantid},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::bankruptcyv3::fcra::qa::withdrawnstatus';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_bankruptcyv3_fcra_withdrawnstatus.Layout_Vault, thor, opt);
EXPORT SourceKey := 'tmsid';
EXPORT vault_File_Name := '~vault::thor::key::bankruptcyv3::fcra::prod::withdrawnstatus';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_bankruptcyv3_fcra_withdrawnstatus';

END;

