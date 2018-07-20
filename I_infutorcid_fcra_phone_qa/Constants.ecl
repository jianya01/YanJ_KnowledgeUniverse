﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::infutorcid::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'phone_qa';
EXPORT blankDataset := dataset([],I_infutorcid_fcra_phone_qa.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::infutorcid::fcra::phone_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{phone},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::infutorcid::fcra::phone_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_infutorcid_fcra_phone_qa.Layout_Vault, thor, opt);
EXPORT SourceKey := 'persistent_record_id';
EXPORT vault_File_Name := '~vault::thor::key::infutorcid::fcra::prod::phone_qa';
 //EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_infutorcid_fcra_phone_qa';

END;



