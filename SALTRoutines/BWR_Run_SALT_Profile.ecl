IMPORT SALT34, SALTRoutines; 

// ---- Step 1.) Change the below record structure to Match your input file: ----
inputRecordStructure :=  RECORD
  string8 process_date;
  string60 offender_key;
  string8 event_dt;
  string5 vendor;
  string20 source_file;
  string2 record_type;
  string2 orig_state;
  string50 offense_key;
  string1 punishment_type;
  string8 sent_date;
  string15 sent_length;
  string60 sent_length_desc;
  string8 cur_stat_inm;
  string50 cur_stat_inm_desc;
  string8 cur_loc_inm_cd;
  string60 cur_loc_inm;
  string8 inm_com_cty_cd;
  string25 inm_com_cty;
  string8 cur_sec_class_dt;
  string25 cur_loc_sec;
  string3 gain_time;
  string8 gain_time_eff_dt;
  string8 latest_adm_dt;
  string8 sch_rel_dt;
  string8 act_rel_dt;
  string8 ctl_rel_dt;
  string8 presump_par_rel_dt;
  string8 mutl_part_pgm_dt;
  string4 release_type;
  string2 office_region;
  string8 par_cur_stat;
  string50 par_cur_stat_desc;
  string8 par_status_dt;
  string8 par_st_dt;
  string8 par_sch_end_dt;
  string8 par_act_end_dt;
  string8 par_cty_cd;
  string50 par_cty;
  string30 supv_office;
  string30 supv_officer;
  string14 office_phone;
  string2 tdcjid_unit_type;
  string15 tdcjid_unit_assigned;
  string1 tdcjid_admit_date;
  string1 prison_status;
  string2 recv_dept_code;
  string10 recv_dept_date;
  string1 parole_active_flag;
  string10 casepull_date;
  string8 pro_st_dt;
  string8 pro_end_dt;
  string50 pro_status;
  string8 conviction_override_date;
  string1 conviction_override_date_type;
  unsigned8 punishment_persistent_id;
  string8 fcra_date;
  string1 fcra_date_type;
END;

// ---- Step 2.) Change the below Dataset to point at your input file: ----
inputDataset := DATASET('~' + 'thor::base::crim::corrections_punishment_public', inputRecordStructure, THOR); 
 
// ---- Step 3.) Run the BWR Script! Nothing else to change ----
SaltProfileResults := SALTRoutines.mac_profile(inputDataset);

SaltProfileResults;