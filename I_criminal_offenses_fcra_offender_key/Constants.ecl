﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::criminal_offenses::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'offender_key';
EXPORT blankDataset := dataset([],I_criminal_offenses_fcra_offender_key.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_200::key::criminal_offenses::fcra::qa::offender_key';
EXPORT Sourcefile:= INDEX(blankDataset,{ok},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_200::key::criminal_offenses::fcra::qa::offender_key';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_criminal_offenses_fcra_offender_key.Layout_Vault, thor, opt);
EXPORT SourceKey := 'offense_persistent_id';
EXPORT vault_File_Name := '~vault::thor::key::criminal_offenses::fcra::prod::offender_key';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_criminal_offenses_fcra_offender_key';

END;

