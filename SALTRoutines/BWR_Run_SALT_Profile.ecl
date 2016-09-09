﻿// This script takes in a file (Either as a dataset with a RECORD definition you define, or as an ECL file/index reference), 
// and then performs a full SALT profile.  It will then take that profile and infer potential data types, show the least populated fields, etc.

// To use:
// Step 1 - Change the inputRecordStructure to match your input file.  NOTE: If you are just going to use a predefined ECL file/index reference such as ADVO.Key_Addr1 you DO NOT need to do this step.
// Step 2 - Change the inputDataset to consume your input file.  This can either be in the form of the DATASET, or as an ECL file/index reference (Including any appropriate IMPORT statements).
// Step 3 - Pick your Target THOR and Submit!

// For future Workunit Identification it is suggested that you update this WORKUNIT name to something specific to the file you are profiling
#WORKUNIT('name', 'SALT_Profile');

IMPORT SALT35, SALTRoutines; 


// ---- Step 1.) Change the below record structure to Match your input file. NOTE: If you are just going to use a predefined ECL file/index reference such as ADVO.Key_Addr1 you DO NOT need to do this step: ----
inputRecordStructure :=  RECORD
  string8 process_date;
  string60 offender_key;
  string5 vendor;
  string2 state_origin;
  string20 source_file;
  string1 data_type;
  string4 off_comp;
  string1 off_delete_flag;
  string8 off_date;
  string8 arr_date;
  string3 num_of_counts;
  string10 le_agency_cd;
  string50 le_agency_desc;
  string35 le_agency_case_number;
  string35 traffic_ticket_number;
  string25 traffic_dl_no;
  string2 traffic_dl_st;
  string20 arr_off_code;
  string75 arr_off_desc_1;
  string50 arr_off_desc_2;
  string5 arr_off_type_cd;
  string30 arr_off_type_desc;
  string5 arr_off_lev;
  string20 arr_statute;
  string70 arr_statute_desc;
  string8 arr_disp_date;
  string5 arr_disp_code;
  string30 arr_disp_desc_1;
  string30 arr_disp_desc_2;
  string10 pros_refer_cd;
  string50 pros_refer;
  string10 pros_assgn_cd;
  string50 pros_assgn;
  string1 pros_chg_rej;
  string20 pros_off_code;
  string75 pros_off_desc_1;
  string50 pros_off_desc_2;
  string5 pros_off_type_cd;
  string30 pros_off_type_desc;
  string5 pros_off_lev;
  string30 pros_act_filed;
  string35 court_case_number;
  string10 court_cd;
  string40 court_desc;
  string1 court_appeal_flag;
  string30 court_final_plea;
  string20 court_off_code;
  string75 court_off_desc_1;
  string50 court_off_desc_2;
  string5 court_off_type_cd;
  string30 court_off_type_desc;
  string5 court_off_lev;
  string20 court_statute;
  string50 court_additional_statutes;
  string70 court_statute_desc;
  string8 court_disp_date;
  string5 court_disp_code;
  string40 court_disp_desc_1;
  string40 court_disp_desc_2;
  string8 sent_date;
  string50 sent_jail;
  string50 sent_susp_time;
  string8 sent_court_cost;
  string9 sent_court_fine;
  string9 sent_susp_court_fine;
  string50 sent_probation;
  string5 sent_addl_prov_code;
  string40 sent_addl_prov_desc_1;
  string40 sent_addl_prov_desc_2;
  string2 sent_consec;
  string10 sent_agency_rec_cust_ori;
  string50 sent_agency_rec_cust;
  string8 appeal_date;
  string40 appeal_off_disp;
  string40 appeal_final_decision;
  string8 convict_dt;
  string30 offense_town;
  string30 cty_conv;
  string12 restitution;
  string30 community_service;
  string20 parole;
  string30 addl_sent_dates;
  string60 probation_desc2;
  string8 court_dt;
  string40 court_county;
  string35 arr_off_lev_mapped;
  string35 court_off_lev_mapped;
  string60 fcra_offense_key;
  string1 fcra_conviction_flag;
  string1 fcra_traffic_flag;
  string8 fcra_date;
  string1 fcra_date_type;
  string8 conviction_override_date;
  string1 conviction_override_date_type;
  string2 offense_score;
  unsigned8 offense_persistent_id;
  unsigned8 offense_category;
 END;


// ---- Step 2.) Change the below Dataset to point at your input file. This can either be in the form of the DATASET, or as an ECL file/index reference (Including any appropriate IMPORT statements): ----
inputDataset := DATASET('~' + 'thor_data400::base::corrections_court_offenses_public', inputRecordStructure, THOR); 

//IMPORT ADVO;
//inputDataset := ADVO.Key_Addr1; 


// ---- Step 3.) Run the BWR Script! Nothing else to change ----
SaltProfileResults := SALTRoutines.mac_profile(inputDataset);

OUTPUT(SaltProfileResults, NAMED('Full_Profile_Results'));
OUTPUT(SALTRoutines.SALT_Profile_Poorly_Populated_Fields(SaltProfileResults, 5, 50.0), NAMED('Poorly_Populated_Fields'));
OUTPUT(SALTRoutines.SALT_Profile_Field_Types(SaltProfileResults, 10), NAMED('Field_Types'));
OUTPUT(SALTRoutines.SALT_Profile_Characters(SaltProfileResults, 15), NAMED('Characters'));