﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::proflic_mari::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'did';
EXPORT blankDataset := dataset([],I_proflic_mari_fcra_did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::proflic_mari::fcra::qa::did';
EXPORT Sourcefile:= INDEX(blankDataset,{s_did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::proflic_mari::fcra::qa::did';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_proflic_mari_fcra_did.Layout_Vault, thor, opt);
EXPORT SourceKey := 'persistent_record_id';
EXPORT vault_File_Name := '~vault::thor::key::proflic_mari::fcra::prod::did';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_proflic_mari_fcra_did';

END;

