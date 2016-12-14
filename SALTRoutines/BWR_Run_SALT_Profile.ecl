// This script takes in a file (Either as a dataset with a RECORD definition you define, or as an ECL file/index reference), 
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
  string3 d_score;
  string9 best_ssn;
  string12 did_out;
  string12 bdid_out;
  string8 date_first_seen;
  string8 date_last_seen;
  string1 current_flag;
  string8 n_number;
  string30 serial_number;
  string12 mfr_mdl_code;
  string11 eng_mfr_mdl;
  string8 year_mfr;
  string15 type_registrant;
  string50 name;
  string33 street;
  string33 street2;
  string18 city;
  string5 state;
  string10 zip_code;
  string6 region;
  string6 orig_county;
  string7 country;
  string16 last_action_date;
  string15 cert_issue_date;
  string13 certification;
  string13 type_aircraft;
  string11 type_engine;
  string11 status_code;
  string11 mode_s_code;
  string11 fract_owner;
  string30 aircraft_mfr_name;
  string20 model_name;
  string10 prim_range;
  string2 predir;
  string28 prim_name;
  string4 addr_suffix;
  string2 postdir;
  string10 unit_desig;
  string8 sec_range;
  string25 p_city_name;
  string25 v_city_name;
  string2 st;
  string5 zip;
  string4 z4;
  string4 cart;
  string1 cr_sort_sz;
  string4 lot;
  string1 lot_order;
  string2 dpbc;
  string1 chk_digit;
  string2 rec_type;
  string2 ace_fips_st;
  string3 county;
  string10 geo_lat;
  string11 geo_long;
  string4 msa;
  string7 geo_blk;
  string1 geo_match;
  string4 err_stat;
  string5 title;
  string20 fname;
  string20 mname;
  string20 lname;
  string5 name_suffix;
  string50 compname;
  string1 lf;
  unsigned8 source_rec_id;
  unsigned6 dotid;
  unsigned2 dotscore;
  unsigned2 dotweight;
  unsigned6 empid;
  unsigned2 empscore;
  unsigned2 empweight;
  unsigned6 powid;
  unsigned2 powscore;
  unsigned2 powweight;
  unsigned6 proxid;
  unsigned2 proxscore;
  unsigned2 proxweight;
  unsigned6 seleid;
  unsigned2 selescore;
  unsigned2 seleweight;
  unsigned6 orgid;
  unsigned2 orgscore;
  unsigned2 orgweight;
  unsigned6 ultid;
  unsigned2 ultscore;
  unsigned2 ultweight;
 END;


// ---- Step 2.) Change the below Dataset to point at your input file. This can either be in the form of the DATASET, or as an ECL file/index reference (Including any appropriate IMPORT statements): ----
RawInputDataset := DATASET('~' + 'thor_data400::base::faa_aircraft_reg', inputRecordStructure, THOR); 
OUTPUT(CHOOSEN(RawInputDataset, 25), NAMED('Sample_Raw_Input'));

SALTRoutines.Mac_Flatten(RawInputDataset, inputDataset); 
OUTPUT(CHOOSEN(inputDataset, 25), NAMED('Sample_Flattened_Input'));

// ---- Step 3.) Run the BWR Script! Nothing else to change ----
SaltProfileResults := SALTRoutines.mac_profile(inputDataset);

OUTPUT(CHOOSEN(SaltProfileResults, 2000), NAMED('Full_Profile_Results'));
OUTPUT(CHOOSEN(SALTRoutines.SALT_Profile_Poorly_Populated_Fields(SaltProfileResults, 5, 50.0), 2000), NAMED('Poorly_Populated_Fields'));
SALTFieldTypes := SALTRoutines.SALT_Profile_Field_Types(SaltProfileResults, 5, 3);
OUTPUT(CHOOSEN(SALTFieldTypes, 2000), NAMED('Field_Types'));
OUTPUT(CHOOSEN(SALTRoutines.SALT_Profile_Produce_ENTITY(SALTFieldTypes), 6000), NAMED('Field_Types_ENTITY'));
OUTPUT(CHOOSEN(SALTRoutines.SALT_Profile_Characters(SaltProfileResults, 15), 2000), NAMED('Characters'));