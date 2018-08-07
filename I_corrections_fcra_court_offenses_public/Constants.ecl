﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::corrections::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'court_offenses_public_qa';
EXPORT blankDataset := dataset([],I_corrections_fcra_court_offenses_public.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::corrections::fcra::court_offenses_public_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{ofk},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::corrections::fcra::court_offenses_public_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_corrections_fcra_court_offenses_public.Layout_Vault, thor, opt);
EXPORT SourceKey := 'offense_persistent_id';
EXPORT vault_File_Name := '~vault::thor::key::corrections::fcra::prod::court_offenses_public_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_corrections_fcra_court_offenses_public';

END;

