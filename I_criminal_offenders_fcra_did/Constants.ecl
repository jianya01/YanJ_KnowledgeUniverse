﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::criminal_offenders::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'did';
EXPORT blankDataset := dataset([],I_criminal_offenders_fcra_did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_200::key::criminal_offenders::fcra::qa::did';
EXPORT Sourcefile:= INDEX(blankDataset,{sdid},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_200::key::criminal_offenders::fcra::qa::did';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_criminal_offenders_fcra_did.Layout_Vault, thor, opt);
EXPORT SourceKey := 'offender_persistent_id';
EXPORT vault_File_Name := '~vault::thor::key::criminal_offenders::fcra::prod::did';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_criminal_offenders_fcra_did';

END;

