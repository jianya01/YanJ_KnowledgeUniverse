﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'aid::rawaid_to_acecahe_qa';
EXPORT blankDataset := dataset([],I_fcra_aid_rawaid_to_acecahe.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::aid::rawaid_to_acecahe_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{rawaid},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::aid::rawaid_to_acecahe_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_fcra_aid_rawaid_to_acecahe.Layout_Vault, thor, opt);
EXPORT SourceKey := 'rawaid';
EXPORT vault_File_Name := '~vault::thor::key::fcra::prod::aid::rawaid_to_acecahe_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_fcra_aid_rawaid_to_acecahe';

END;

