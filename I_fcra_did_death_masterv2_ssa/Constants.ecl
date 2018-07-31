﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'did_death_masterv2_ssa_qa';
EXPORT blankDataset := dataset([],I_fcra_did_death_masterv2_ssa.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::fcra::did_death_masterv2_ssa_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{l_did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::fcra::did_death_masterv2_ssa_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_fcra_did_death_masterv2_ssa.Layout_Vault, thor, opt);
EXPORT SourceKey := 'state_death_id';
EXPORT vault_File_Name := '~vault::thor::key::fcra::prod::did_death_masterv2_ssa_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_fcra_did_death_masterv2_ssa';

END;

