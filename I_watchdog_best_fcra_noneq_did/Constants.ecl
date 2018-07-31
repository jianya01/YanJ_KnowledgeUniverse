﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::watchdog_best::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'noneq_did_qa';
EXPORT blankDataset := dataset([],I_watchdog_best_fcra_noneq_did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::watchdog_best::fcra::noneq_did_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::watchdog_best::fcra::noneq_did_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_watchdog_best_fcra_noneq_did.Layout_Vault, thor, opt);
EXPORT SourceKey := 'did';
EXPORT vault_File_Name := '~vault::thor::key::watchdog_best::fcra::prod::noneq_did_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_watchdog_best_fcra_noneq_did';
END;

