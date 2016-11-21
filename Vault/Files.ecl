IMPORT Vault_Layout;

EXPORT Files(STRING DataSource = '', STRING FileSuffix = '') := MODULE

	EXPORT base_prefix := '~thor::base::' + DataSource;
	EXPORT base_prod_vault_file := base_prefix + '::' + FileSuffix +'::prod';
	
	EXPORT PublicRecord_Offenders_File := '~foreign::10.241.20.205::thor_data400::base::corrections_offenders_public';	
	EXPORT PublicRecord_Offenders := DATASET(PublicRecord_Offenders_File, {Vault_Layout.Layout_PublicRecord_Offenders_Public_Vault - Vault_Layout.Layout_Prefix_Vault}, THOR);
	EXPORT PublicRecord_Offenders_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_PublicRecord_Offenders_Public_Vault, THOR, OPT);
	
	// EXPORT Bankruptcy_Main_File := '~foreign::10.241.20.205::thor_data400::base::bankruptcy::main_v3';	
	// EXPORT Bankruptcy_Main := DATASET(Bankruptcy_Main_File, Vault_Layout.Layout_Bankruptcy_Main_Vault - Vault_Layout.Layout_Prefix_Vault, THOR);
	// EXPORT Bankruptcy_Main_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_Bankruptcy_Main_Vault, THOR, OPT);

	EXPORT Automationtest_File := '~thor::temp::vault_test3';	
	EXPORT Automationtest := DATASET(Automationtest_File, {Vault_Layout.Layout_test - Vault_Layout.Layout_Prefix_Vault}, THOR);
	EXPORT Automationtest_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_test, THOR, OPT);
	
	// EXPORT sample_File := '~thor::base::ar::sample_child1';	
	// EXPORT sampletest := DATASET(sample_File, {Vault_Layout.Layout_Automation_Vault - Vault_Layout.Layout_Prefix_Vault}, THOR);
	// EXPORT sampletest_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_Automation_Vault, THOR, OPT);	
	
	// EXPORT PublicRecord_CourtOffenses_File := '~foreign::10.241.20.205::thor_data400::base::corrections_court_offenses_public';	
	// EXPORT PublicRecord_CourtOffensesc := DATASET(PublicRecord_CourtOffenses_File, {Vault_Layout.Layout_CRIM_Court_Offenses - Vault_Layout.Layout_Prefix_Vault}, THOR);
	// EXPORT PublicRecord_CourtOffenses_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_CRIM_Court_Offenses, THOR, OPT);
	
	// EXPORT PublicRecord_CorrectionsOffenses_File := '~foreign::10.241.20.205::thor_data400::base::corrections_offenses_public';	
	// EXPORT PublicRecord_CorrectionsOffenses := DATASET(PublicRecord_CorrectionsOffenses_File, {Vault_Layout.Layout_CRIM_Corrections_Offenses - Vault_Layout.Layout_Prefix_Vault}, THOR);
	// EXPORT PublicRecord_CorrectionsOffenses_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_CRIM_Corrections_Offenses, THOR, OPT);	
	
	// EXPORT PublicRecord_Punishments_File := '~foreign::10.241.20.205::thor_data400::base::corrections_punishment_public';	
	// EXPORT PublicRecord_Punishments := DATASET(PublicRecord_Punishments_File, {Vault_Layout.Layout_CRIM_Punishments - Vault_Layout.Layout_Prefix_Vault}, THOR);
	// EXPORT PublicRecord_Punishments_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_CRIM_Punishments, THOR, OPT);
	
	// EXPORT PublicRecord_Punishments_File := '~foreign::10.241.20.205::thor_data400::base::insuranceheader::idl_policy_header';	
	// EXPORT PublicRecord_Punishments := DATASET(PublicRecord_Punishments_File, {Vault_Layout.Layout_CRIM_Punishments - Vault_Layout.Layout_Prefix_Vault}, THOR);
	// EXPORT PublicRecord_Punishments_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_CRIM_Punishments, THOR, OPT);
	
	// EXPORT PublicRecord_InsuranceHeader_File := '~foreign::10.241.20.205::thor_data400::base::insuranceheader::idl_policy_header';	
	// EXPORT PublicRecord_InsuranceHeader := DATASET(PublicRecord_InsuranceHeader_File, {Vault_Layout.Layout_Insurance_Header - Vault_Layout.Layout_Prefix_Vault}, THOR);
	// EXPORT PublicRecord_InsuranceHeader_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_Insurance_Header, THOR, OPT);	
	
	// EXPORT PublicRecord_Relatives_File := '~foreign::10.241.20.205::thor_data400::base::insurance_header::relative';	
	// EXPORT PublicRecord_Relatives := DATASET(PublicRecord_Relatives_File, {Vault_Layout.Layout_InsuranceHeader_Relatives - Vault_Layout.Layout_Prefix_Vault}, THOR);
	// EXPORT PublicRecord_Relatives_Vault := DATASET(base_prod_vault_file, Vault_Layout.Layout_InsuranceHeader_Relatives, THOR, OPT);	
END;