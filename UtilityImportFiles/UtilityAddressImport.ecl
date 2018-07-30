IMPORT _Control;
AddressNonFCRALayout := RECORD
  string28 prim_name;
  string2 st;
  string5 zip;
  string10 prim_range;
  string8 sec_range;
  string15 id;
  string10 exchange_serial_number;
  string8 date_added_to_exchange;
  string8 connect_date;
  string8 date_first_seen;
  string8 record_date;
  string10 util_type;
  string25 orig_lname;
  string20 orig_fname;
  string20 orig_mname;
  string5 orig_name_suffix;
  string1 addr_type;
  string1 addr_dual;
  string10 address_street;
  string100 address_street_name;
  string5 address_street_type;
  string2 address_street_direction;
  string10 address_apartment;
  string20 address_city;
  string2 address_state;
  string10 address_zip;
  string9 ssn;
  string10 work_phone;
  string10 phone;
  string8 dob;
  string2 drivers_license_state_code;
  string22 drivers_license;
  string2 predir;
  string4 addr_suffix;
  string2 postdir;
  string10 unit_desig;
  string25 p_city_name;
  string25 v_city_name;
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
  string5 title;
  string20 fname;
  string20 mname;
  string20 lname;
  string5 name_suffix;
  string3 name_score;
  unsigned8 __internal_fpos__;
 END;

blankDataset := dataset([], AddressNonFCRALayout);

fileName := '~thor_data400::key::utility_address_qa';

EXPORT UtilityAddressImport := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	   INDEX(blankDataset, { prim_name,st,zip,prim_range,sec_range}, {blankDataset}, fileName),
	   JOIN(DISTRIBUTE(INDEX(blankDataset, { prim_name,st,zip,prim_range,sec_range}, {blankDataset}, fileName), HASH64((UNSIGNED8)DID)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.DID = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));
		 