﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'override::pii::qa::did';
EXPORT blankDataset := dataset([],I_fcra_override_pii_did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::fcra::override::pii::qa::did';
EXPORT Sourcefile:= INDEX(blankDataset,{s_did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::fcra::override::pii::qa::did';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_fcra_override_pii_did.Layout_Vault, thor, opt);
EXPORT SourceKey := 's_did';
EXPORT vault_File_Name := '~vault::thor::key::fcra::prod::override::pii::qa::did';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_fcra_override_pii_did';

END;

