﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::sexoffender::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'didpublic_qa';
EXPORT blankDataset := dataset([],I_sexoffender_fcra_didpublic.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::sexoffender::fcra::didpublic_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::sexoffender::fcra::didpublic_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_sexoffender_fcra_didpublic.Layout_Vault, thor, opt);
EXPORT SourceKey := 'seisint_primary_key';
EXPORT vault_File_Name := '~vault::thor::key::sexoffender::fcra::prod::didpublic_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_sexoffender_fcra_didpublic';

END;

