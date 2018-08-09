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


  EXPORT Key_death_master_ssn_table_qa_File := 'thor_data400::key::death_master::fcra::qa::ssn_table_v4_filtered';	//sourcefilename
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_SSN_table_qa_vault - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Key_death_master_ssn_table_qa_File;
	//Source_fileName := Key_death_master_ssn_table_qa_File;// if the source file is already copied on vault then we can refer the definition name
	EXPORT Death_master_ssn_qa_Source :=  INDEX(blankDataset_Source, {ssn}, {blankDataset_Source}, Source_fileName);
	EXPORT Death_master_ssn_qa := PROJECT(Death_master_ssn_qa_Source,TRANSFORM(Vault_Layout.Layout_SSN_table_qa_vault_projected- Vault_Layout.Layout_ECLIngest_Prefix,self.combo := left.combo;SELF.eq := LEFT.eq;SELF.en := LEFT.en;SELF.tn := LEFT.tn; SELF:=LEFT)); //source file
	Vault_fileName := '~vault::thor::key::prod::death_master::fcra::qa::ssn_table_v4_filtered';
	EXPORT Death_master_ssn_qa_Vault :=  DATASET(base_prod_vault_file, Vault_Layout.Layout_SSN_table_qa_vault_projected, THOR, OPT); // vault file


  EXPORT Key_death_master_adl_risk_table_qa_File := 'thor_data400::key::death_master::fcra::qa::adl_risk_table_v4_filtered';	//sourcefilename
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_adl_risk_table_qa_vault - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Key_death_master_adl_risk_table_qa_File;
	//Source_fileName := Key_death_master_adl_risk_table_qa_File;// if the source file is already copied on vault then we can refer the definition name
	EXPORT Death_master_adl_risk_qa_Source :=  INDEX(blankDataset_Source, {did}, {blankDataset_Source}, Source_fileName);
	EXPORT Death_master_adl_risk_qa := PROJECT(Death_master_adl_risk_qa_Source,TRANSFORM(Vault_Layout.Layout_adl_risk_table_qa_vault_projected - Vault_Layout.Layout_ECLIngest_Prefix,self.combo := left.combo;SELF.eq := LEFT.eq;SELF.en := LEFT.en;SELF.tn := LEFT.tn; SELF:=LEFT)); //source file
	Vault_fileName := '~vault::thor::key::prod::death_master::fcra::qa::adl_risk_table_v4_filtered';
	EXPORT Death_master_adl_risk_qa_Vault :=  DATASET(base_prod_vault_file,  Vault_Layout.Layout_adl_risk_table_qa_vault_projected, THOR, OPT); // vault file	
	
	
	EXPORT Key_email_data_did := 'thor_200::key::email_data::fcra::qa::did';	
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_email_data_fcra_did_vault - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Key_email_data_did;
	EXPORT Key_email_data_Source :=  INDEX(blankDataset_Source, {did}, {blankDataset_Source}, Source_fileName);
	EXPORT Key_email_data := PROJECT(Key_email_data_Source,TRANSFORM(Vault_Layout.Layout_email_data_fcra_vault_projected - Vault_Layout.Layout_ECLIngest_Prefix,SELF.clean_name := LEFT.clean_name;SELF.clean_address := LEFT.clean_address; SELF:=LEFT));
	Vault_fileName := '~vault::thor::key::prod::email_data::fcra::qa::did';
	EXPORT Key_email_data_Vault :=  DATASET(base_prod_vault_file,  Vault_Layout.Layout_email_data_fcra_vault_projected, THOR, OPT);
	
	
	EXPORT Liensv2_main_qa_File := 'thor_data400::key::liensv2::fcra::main::tmsid.rmsid_qa';	//sourcefilename
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_liensv2_main_qa_vault - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Liensv2_main_qa_File;
	EXPORT Liensv2_main_qa_Source :=  INDEX(blankDataset_Source, {tmsid,rmsid}, {blankDataset_Source}, Source_fileName);
	//EXPORT Liensv2_main_qa := PROJECT(Liensv2_main_qa_Source,TRANSFORM(Vault_Layout.Layout_liensv2_main_qa_vault - Vault_Layout.Layout_ECLIngest_Prefix,SELF.filing_status := LEFT.filing_status; SELF:=LEFT)); //source file
	Vault_fileName := '~vault::thor::key::prod::liensv2::main_qa';
	EXPORT Liensv2_main_qa_Vault :=  DATASET(base_prod_vault_file,  Vault_Layout.Layout_liensv2_main_qa_vault, THOR, OPT); // vault file
	
	
	EXPORT Key_avm_v2_fcra_address_file := 'thor_data400::key::avm_v2::fcra::qa::address';	//sourcefilename
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_avm_v2_fcra_address_vault - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Key_avm_v2_fcra_address_file;
	EXPORT Key_avm_v2_address_Source :=  INDEX(blankDataset_Source, {prim_name,st,zip,prim_range,sec_range}, {blankDataset_Source}, Source_fileName);
	Vault_fileName := '~vault::thor::key::prod::avm_v2::fcra::qa::address';
	EXPORT Key_avm_v2_address_Vault :=  DATASET(base_prod_vault_file,  Vault_Layout.Layout_avm_v2_fcra_address_vault, THOR, OPT); // vault file


 EXPORT Key_avm_v2_fcra_medians_file := 'thor_data400::key::avm_v2::fcra::qa::medians';	//sourcefilename
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_avm_v2_fcra_medians_Vault - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Key_avm_v2_fcra_medians_file;
	EXPORT Key_avm_v2_medians_Source :=  INDEX(blankDataset_Source, {fips_geo_12}, {blankDataset_Source}, Source_fileName);
	Vault_fileName := '~vault::thor::key::prod::avm_v2::fcra::qa::medians';
	EXPORT Key_avm_v2_medians_Vault :=  DATASET(base_prod_vault_file,  Vault_Layout.Layout_avm_v2_fcra_medians_Vault, THOR, OPT); // vault file


 EXPORT Key_inquiry_table_fcra_did_qa_File := 'thor_data400::key::inquiry_table::fcra::did_qa';	//sourcefilename
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_inquiry_table_did_qa_Vault - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Key_inquiry_table_fcra_did_qa_File;
	EXPORT Key_inquiry_table_did_qa_Source :=  INDEX(blankDataset_Source, {appended_adl}, {blankDataset_Source}, Source_fileName);
	EXPORT Key_inquiry_table_did_qa := PROJECT(Key_inquiry_table_did_qa_Source,TRANSFORM(Vault_Layout.Layout_inquiry_table_did_qa_Vault_Projected - Vault_Layout.Layout_ECLIngest_Prefix,self.mbs := left.mbs;SELF.allow_flags := LEFT.allow_flags;SELF.bus_intel := LEFT.bus_intel;SELF.person_q := LEFT.person_q;SELF.bus_q := LEFT.bus_q;SELF.bususer_q := LEFT.bususer_q;SELF.bususer_q2 := LEFT.bususer_q2;SELF.bususer_q3 := LEFT.bususer_q3;SELF.bususer_q4 := LEFT.bususer_q4;SELF.bususer_q5 := LEFT.bususer_q5;SELF.bususer_q6 := LEFT.bususer_q6;SELF.bususer_q7 := LEFT.bususer_q7;SELF.bususer_q8 := LEFT.bususer_q8;self.permissions := left.permissions;self.search_info := left.search_info; SELF:=LEFT)); //source file
	Vault_fileName := '~vault::thor::key::prod::inquiry_table::fcra::did_qa';
	EXPORT Key_inquiry_table_did_qa_Vault :=  DATASET(base_prod_vault_file,  Vault_Layout.Layout_inquiry_table_did_qa_Vault_Projected, THOR, OPT); // vault file	
	
	
	EXPORT Key_corrections_offenders_fcra_bocashell_did_File := 'thor_data400::key::corrections_offenders::fcra::bocashell_did_qa';	//sourcefilename
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_corrections_offenders_bocashell_did_vault - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Key_corrections_offenders_fcra_bocashell_did_File;
	EXPORT Key_corrections_offenders_bocashell_did_Source :=  INDEX(blankDataset_Source, {did}, {blankDataset_Source}, Source_fileName);
	Vault_fileName := '~vault::thor::key::prod::corrections_offenders_fcra_bocashell_did';
	EXPORT Key_corrections_offenders_bocashell_did_Vault :=  DATASET(base_prod_vault_file,  Vault_Layout.Layout_corrections_offenders_bocashell_did_vault, THOR, OPT); // vault file
	
	
	EXPORT Key_fcra_telcordia_tpm_slim_qa := 'thor_data400::key::fcra::telcordia_tpm_slim_qa';	//sourcefilename
	
	blankDataset_Source := dataset([], Vault_Layout.Layout_fcra_telcordia_tpm_slim - Vault_Layout.Layout_ECLIngest_Prefix);
	Source_fileName := UT.foreign_production_boca+Key_fcra_telcordia_tpm_slim_qa;
	EXPORT Key_telcordia_tpm_slim_Source :=  INDEX(blankDataset_Source, {npa,nxx,tb}, {blankDataset_Source}, Source_fileName);
	Vault_fileName := '~vault::thor::key::prod::fcra::telcordia_tpm_slim_qa';
	EXPORT Key_telcordia_tpm_slim_Vault :=  DATASET(base_prod_vault_file,  Vault_Layout.Layout_fcra_telcordia_tpm_slim, THOR, OPT); // vault file
	
 END;

