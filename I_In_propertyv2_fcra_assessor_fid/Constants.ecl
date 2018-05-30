﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::ln_propertyv2::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'assessor.fid';
EXPORT blankDataset := dataset([],I_In_propertyv2_fcra_assessor_fid.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::ln_propertyv2::fcra::qa::assessor.fid';
EXPORT Sourcefile:= INDEX(blankDataset,{ln_fares_id,proc_date},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::ln_propertyv2::fcra::qa::assessor.fid';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_In_propertyv2_fcra_assessor_fid.Layout_Vault, thor, opt);
EXPORT SourceKey := 'ln_fares_id';
EXPORT vault_File_Name := '~vault::thor::key::ln_propertyv2::fcra::prod::assessor.fid';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_In_propertyv2_fcra_assessor_fid';

END;

