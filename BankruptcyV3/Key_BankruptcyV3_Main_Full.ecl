﻿IMPORT _Control;

layout_status := RECORD,maxlength(10000)
   string8 status_date;
   string30 status_type;
END;

layout_comments := RECORD,maxlength(10000)
   string8 filing_date;
   string30 description;
END;

LayoutBankruptcy := RECORD,maxlength(32766)
  string8 process_date;
  string50 tmsid;
  string1 source;
  string12 id;
  string10 seq_number;
  string8 date_created;
  string8 date_modified;
  string1 method_dismiss;
  string1 case_status;
  string5 court_code;
  string50 court_name;
  string40 court_location;
  string7 case_number;
  string25 orig_case_number;
  string8 date_filed;
  string12 filing_status;
  string3 orig_chapter;
  string8 orig_filing_date;
  string5 assets_no_asset_indicator;
  string1 filer_type;
  string8 meeting_date;
  string8 meeting_time;
  string90 address_341;
  string8 claims_deadline;
  string8 complaint_deadline;
  string35 judge_name;
  string5 judges_identification;
  string2 filing_jurisdiction;
  string20 assets;
  string20 liabilities;
  string1 casetype;
  string1 assoccode;
  string25 splitcase;
  string25 filedinerror;
  string8 date_last_seen;
  string8 date_first_seen;
  string8 date_vendor_first_reported;
  string8 date_vendor_last_reported;
  string8 reopen_date;
  string8 case_closing_date;
  string8 datereclosed;
  string50 trusteename;
  string90 trusteeaddress;
  string25 trusteecity;
  string2 trusteestate;
  string5 trusteezip;
  string4 trusteezip4;
  string10 trusteephone;
  string12 trusteeid;
  string12 caseid;
  string8 bardate;
  string7 transferin;
  string250 trusteeemail;
  string8 planconfdate;
  string8 confheardate;
  string5 title;
  string20 fname;
  string20 mname;
  string20 lname;
  string5 name_suffix;
  string3 name_score;
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
  string4 zip4;
  string4 cart;
  string1 cr_sort_sz;
  string4 lot;
  string1 lot_order;
  string2 dbpc;
  string1 chk_digit;
  string2 rec_type;
  string5 county;
  string10 geo_lat;
  string11 geo_long;
  string4 msa;
  string7 geo_blk;
  string1 geo_match;
  string4 err_stat;
  string12 did;
  string9 app_ssn;
  string1 delete_flag;
  DATASET(layout_status) status;
  DATASET(layout_comments) comments;
  unsigned8 scrubsbits1;
END;
 
fileName := '~thor::base::bankruptcy::main_v3';
Key_BankruptcyV3_Main_Full_input := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	DATASET(fileName, LayoutBankruptcy, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutBankruptcy, THOR), HASH64((UNSIGNED8)DID)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.DID = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));


normalizedRecord := RECORD
	RECORDOF(key_bankruptcyV3_main_full_input)- Status - Comments;
	STRING8 status_date;
	STRING30 status_type;
	STRING8 comment_filing_date;
	STRING30 comment_description;
END;
normalizedRecord normalizeBankruptcy(key_bankruptcyV3_main_full_input le, UNSIGNED8 cntr) := TRANSFORM
	// Flatten out the Status and Comments child datasets in one round
	SELF.status_date := le.Status[cntr].status_date;
	SELF.status_type := le.Status[cntr].status_type;
	SELF.comment_filing_date := le.Comments[cntr].filing_date;
	SELF.comment_description := le.Comments[cntr].description;
	
	// Keep all of the other fields identical
	SELF := le;
END;

Export key_bankruptcyV3_main_full := NORMALIZE(key_bankruptcyV3_main_full_input, MAX(COUNT(LEFT.Status), COUNT(LEFT.Comments)), normalizeBankruptcy(LEFT, COUNTER));