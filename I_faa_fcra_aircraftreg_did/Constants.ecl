﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::faa::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'aircraftreg_did_qa';
EXPORT blankDataset := dataset([],I_faa_fcra_aircraftreg_did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::faa::fcra::aircraftreg_did_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::faa::fcra::aircraftreg_did_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_faa_fcra_aircraftreg_did.Layout_Vault, thor, opt);
EXPORT SourceKey := 'persistent_record_id';
EXPORT vault_File_Name := '~vault::thor::key::faa::fcra::prod::aircraftreg_did_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_faa_fcra_aircraftreg_did';

END;

