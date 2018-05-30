﻿IMPORT UT;

EXPORT Constants := MODULE
EXPORT VaultNamePrefix := '~vault::thor::base::insuranceheader';
EXPORT BasePrefix := VaultNamePrefix;
EXPORT BaseSuffix := 'idl_policy_header';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor_data400::base::insuranceheader::idl_policy_header' , I_InsuranceHeader_idl_policy_header.Layout_Source, thor);
EXPORT SourcefileName:= '~thor_data400::base::insuranceheader::idl_policy_header';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_InsuranceHeader_idl_policy_header.Layout_Vault, thor, opt);
EXPORT SourceKey := 'rid';
EXPORT vault_File_Name := '~vault::thor::base::insuranceheader::prod::idl_policy_header';
EXPORT ModuleName := 'I_InsuranceHeader_idl_policy_header';

END;


