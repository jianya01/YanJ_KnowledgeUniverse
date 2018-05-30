﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::corrections_offenders_risk';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'bocashell_did_qa';
EXPORT blankDataset := dataset([], I_Key_BocaShell_Did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::corrections_offenders_risk::bocashell_did_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::corrections_offenders_risk::bocashell_did_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_Key_BocaShell_Did.Layout_Vault, thor, opt);
EXPORT SourceKey := 'RECORD';
EXPORT vault_File_Name := '~vault::thor::key::corrections_offenders_risk::prod::bocashell_did_qa';
EXPORT Pkgvar := 'Corrections_Build_Version';
EXPORT ModuleName := 'I_Key_BocaShell_Did';

END;

