﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'death_master_ssa::ssn_qa';
EXPORT blankDataset := dataset([],I_fcra_death_master_ssa_ssn.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::fcra::death_master_ssa::ssn_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{ssn},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::fcra::death_master_ssa::ssn_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_fcra_death_master_ssa_ssn.Layout_Vault, thor, opt);
EXPORT SourceKey := 'state_death_id';
EXPORT vault_File_Name := '~vault::thor::key::fcra::prod::death_master_ssa::ssn_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_fcra_death_master_ssa_ssn';

END;

