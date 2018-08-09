﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'citystzip_qa';
EXPORT blankDataset := dataset([],I_fcra_citystzip_qa.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::citystzip_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{zip5},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::citystzip_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_fcra_citystzip_qa.Layout_Vault, thor, opt);
EXPORT SourceKey := 'zip5,city,state,county';
EXPORT vault_File_Name := '~vault::thor::key::fcra::prod::citystzip_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_fcra_citystzip_qa';

END;

