﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::bankruptcyv3::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'search::tmsid_linkids_qa';
EXPORT blankDataset := dataset([],I_bankruptcyv3_fcra_search_tmsid_linkids.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::bankruptcyv3::fcra::search::tmsid_linkids_qa ';
EXPORT Sourcefile:= INDEX(blankDataset,{tmsid},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::bankruptcyv3::fcra::search::tmsid_linkids_qa ';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_bankruptcyv3_fcra_search_tmsid_linkids.Layout_Vault, thor, opt);
EXPORT SourceKey := 'tmsid,orig_addr1,orig_name,orig_company,debtor_type,debtor_seq,orig_county,name_type,seq_number';
EXPORT vault_File_Name := '~vault::thor::key::bankruptcyv3::fcra::prod::search::tmsid_linkids_qa';
 EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_bankruptcyv3_fcra_search_tmsid_linkids';


END;

