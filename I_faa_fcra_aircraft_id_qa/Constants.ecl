﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::key::faa::fcra'; 
EXPORT BasePrefix := VaultNamePrefix ;
EXPORT BaseSuffix := 'aircraft_id_qa';
EXPORT blankDataset := dataset([],I_faa_fcra_aircraft_id_qa.Layout_Source);
EXPORT fileName := UT.foreign_production_boca+'thor_data400::key::faa::fcra::aircraft_id_qa';
EXPORT Sourcefile:= INDEX(blankDataset,{aircraft_id},{blankDataset},filename);
EXPORT SourcefileName:= 'thor_data400::key::faa::fcra::aircraft_id_qa';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix ,I_faa_fcra_aircraft_id_qa.Layout_Vault, thor, opt);
EXPORT SourceKey := 'persistent_record_id';
EXPORT vault_File_Name := '~vault::thor::key::faa::fcra::prod::aircraft_id_qa';
// EXPORT Pkgvar := '';
EXPORT ModuleName := 'I_faa_fcra_aircraft_id_qa';

END;


