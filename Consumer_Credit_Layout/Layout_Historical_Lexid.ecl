﻿EXPORT Layout_Historical_Lexid := RECORD
	UNSIGNED6 originalrefno;
	STRING16 transaction_id;
  UNSIGNED8 lexid;
  STRING8 date_reported;
  UNSIGNED1 reporttypecounter;
  STRING28 last_name;
  STRING20 first_name;
  STRING15 middle_name;
  STRING3 suffix;
  STRING9 ssn;
  STRING8 dob;
  STRING1 sex;
	STRING9	house_nbr;
	STRING20 street;
	STRING5	apt_nbr;
	STRING20 city;
	STRING2	state;
	STRING5	zip;
	STRING4	zip4;
  STRING10 prim_range;
	STRING2 predir;
  STRING28 prim_name;
	STRING4 addr_suffix;
	STRING2 postdir;
	STRING10 unit_desig;
  STRING8 sec_range;
  STRING30 city_name;
  STRING2 st;
  STRING5	zip5;
  STRING4	err_stat;  
	STRING cleaned_addr;
END;