IMPORT UT,Vault_Layout;

EXPORT Files(STRING DataSource = '', STRING FileSuffix = '') := MODULE

	EXPORT base_prefix := '~vault::thor::' + DataSource;
	EXPORT base_prod_vault_file := base_prefix + '::prod::' + FileSuffix;
	
	EXPORT Bankruptcy_Main_File := 'thor_data400::base::bankruptcy::main_v3';	
	EXPORT Bankruptcy_Main := DATASET(UT.foreign_production_boca+Bankruptcy_Main_File, Vault_Layout.Layout_Bankruptcy_Main_Vault - Vault_Layout.Layout_ECLIngest_Prefix, THOR);
	EXPORT Bankruptcy_Main_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_Bankruptcy_Main_Vault, THOR, OPT);

	EXPORT Key_Offenders_File := 'thor_data400::key::corrections_offenders_risk::did_public_qa';	
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_Key_Offenders_Vault - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Key_Offenders_File;
	EXPORT Key_Offenders_Source :=  INDEX(blankDataset_Source, {sdid}, {blankDataset_Source}, Source_fileName);
	EXPORT Key_Offenders := PROJECT(Key_Offenders_Source,TRANSFORM(Vault_Layout.Layout_Key_Offenders_Vault_Projected - Vault_Layout.Layout_ECLIngest_Prefix,SELF.Offense := LEFT.Offense; SELF:=LEFT));
	Vault_fileName := '~thor_data400::key::corrections_offenders_risk::did_public_qa';
	EXPORT Key_Offenders_Vault :=  DATASET(base_prod_vault_file,  Vault_Layout.Layout_Key_Offenders_Vault_Projected, THOR, OPT);





END;