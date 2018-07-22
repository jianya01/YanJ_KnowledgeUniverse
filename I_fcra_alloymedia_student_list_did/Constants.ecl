﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'alloymedia_student_list::qa::did';
EXPORT blankDataset := dataset([],I_fcra_alloymedia_student_list_did.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::fcra::alloymedia_student_list::qa::did';
EXPORT Sourcefile:= INDEX(blankDataset,{did},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::fcra::alloymedia_student_list::qa::did';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_fcra_alloymedia_student_list_did.Layout_Vault, thor, opt);
EXPORT SourceKey := 'sequence_number, key_code, clean_addr_code';
EXPORT vault_File_Name := '~vault::thor::key::fcra::prod::alloymedia_student_list::qa::did';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_fcra_alloymedia_student_list_did';

END;

