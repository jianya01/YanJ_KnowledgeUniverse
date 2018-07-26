﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'datecorrect::hval_qa';
EXPORT blankDataset := dataset([],I_fcra_datecorrect_hval.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::datecorrect::hval_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{hval},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::datecorrect::hval_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_fcra_datecorrect_hval.Layout_Vault, thor, opt);
EXPORT SourceKey := 'hval';
EXPORT vault_File_Name := '~vault::thor::key::fcra::prod::datecorrect::hval_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_fcra_datecorrect_hval';

END;

