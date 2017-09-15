﻿// EXPORT Layout_Source := 'todo';
IMPORT Vault_Layout;

offense_fields := RECORD
   string8 process_date;
   string60 offender_key;
   string8 off_date;
   string8 arr_date;
   string8 arr_disp_date;
   string8 court_disp_date;
   string8 sent_date;
   string8 appeal_date;
   string5 court_off_lev;
   string20 court_off_code;
   string20 court_statute;
   string70 court_statute_desc;
   string75 court_off_desc_1;
   string40 court_disp_desc_1;
   string40 court_disp_desc_2;
   string1 off_typ;
   string5 off_lev;
  END;

EXPORT Layout_Key_Offenders_Vault  := RECORD
	Vault_Layout.Layout_ECLIngest_Prefix;
	unsigned6 sdid;
  string1 traffic_flag;
  string1 conviction_flag;
  string1 offense_score;
  string1 criminal_offender_level;
  string8 process_date;
  string8 file_date;
  string60 offender_key;
  string5 vendor;
  string20 source_file;
  string2 record_type;
  string25 orig_state;
  string15 id_num;
  string56 pty_nm;
  string1 pty_nm_fmt;
  string20 orig_lname;
  string20 orig_fname;
  string20 orig_mname;
  string10 orig_name_suffix;
  string20 lname;
  string20 fname;
  string20 mname;
  string6 name_suffix;
  string1 pty_typ;
  string1 nitro_flag;
  string9 ssn;
  string35 case_num;
  string40 case_court;
  string8 case_date;
  string5 case_type;
  string25 case_type_desc;
  string30 county_of_origin;
  string10 dle_num;
  string9 fbi_num;
  string10 doc_num;
  string10 ins_num;
  string25 dl_num;
  string2 dl_state;
  string2 citizenship;
  string8 dob;
  string8 dob_alias;
  string13 county_of_birth;
  string25 place_of_birth;
  string25 street_address_1;
  string25 street_address_2;
  string25 street_address_3;
  string10 street_address_4;
  string10 street_address_5;
  string13 current_residence_county;
  string13 legal_residence_county;
  string3 race;
  string30 race_desc;
  string7 sex;
  string3 hair_color;
  string15 hair_color_desc;
  string3 eye_color;
  string15 eye_color_desc;
  string3 skin_color;
  string15 skin_color_desc;
  string10 scars_marks_tattoos_1;
  string10 scars_marks_tattoos_2;
  string10 scars_marks_tattoos_3;
  string10 scars_marks_tattoos_4;
  string10 scars_marks_tattoos_5;
  string3 height;
  string3 weight;
  string5 party_status;
  string60 party_status_desc;
  string10 _3g_offender;
  string10 violent_offender;
  string10 sex_offender;
  string10 vop_offender;
  string1 data_type;
  string26 record_setup_date;
  string45 datasource;
  qstring10 prim_range;
  string2 predir;
  qstring28 prim_name;
  qstring4 addr_suffix;
  string2 postdir;
  qstring10 unit_desig;
  qstring8 sec_range;
  qstring25 p_city_name;
  qstring25 v_city_name;
  string2 st;
  qstring5 zip5;
  qstring4 zip4;
  unsigned1 clean_errors;
  string18 county_name;
  string12 did;
  string3 score;
  string9 ssn_appended;
  string1 curr_incar_flag;
  string1 curr_parole_flag;
  string1 curr_probation_flag;
  string8 src_upload_date;
  string3 age;
  string150 image_link;
  offense_fields offense;
	// DATASET(offense_fields) offense;
  string8 earliest_offense_date;
	unsigned8 __internal_fpos__;
 END;