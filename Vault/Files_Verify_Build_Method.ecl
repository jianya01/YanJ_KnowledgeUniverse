IMPORT Vault_Layout;

EXPORT Files_Verify_Build_Method(STRING DataSource = '', STRING FileSuffix = '') := MODULE

	EXPORT base_prefix := '~thor::base::' + DataSource;
	EXPORT base_prod_vault_file := base_prefix + '::prod::' + FileSuffix;

  EXPORT PublicRecord_Offenders_Public_File := '~foreign::10.241.20.205::thor_data400::base::corrections_offenders_public';	
	EXPORT PublicRecord_Offenders_Public := DATASET(PublicRecord_Offenders_Public_File, {Vault_Layout.Layout_PublicRecord_Offenders_Public_Vault - Vault_Layout.Layout_Prefix_Vault}, THOR);

  EXPORT PublicRecord_Offenders_Public_File_Father := '~foreign::10.241.20.205::thor_data400::base::corrections_offenders_public_father';	
	EXPORT PublicRecord_Offenders_Public_Father := DATASET(PublicRecord_Offenders_Public_File_Father, {Vault_Layout.Layout_PublicRecord_Offenders_Public_Vault - Vault_Layout.Layout_Prefix_Vault}, THOR);
		
END;