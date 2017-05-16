IMPORT _Control;

LayoutDeathMaster := RECORD
  string12 did;
  unsigned1 did_score;
  string8 filedate;
  string1 rec_type;
  string1 rec_type_orig;
  string9 ssn;
  string20 lname;
  string4 name_suffix;
  string15 fname;
  string15 mname;
  string1 vorp_code;
  string8 dod8;
  string8 dob8;
  string2 st_country_code;
  string5 zip_lastres;
  string5 zip_lastpayment;
  string2 state;
  string3 fipscounty;
  string2 crlf;
  string1 state_death_flag;
  string3 death_rec_src;
END;

fileName := '~thor::base::did_death_master_ssa_20160709';
EXPORT File_Did_Death_Master_ssa := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	DATASET(fileName, LayoutDeathMaster, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutDeathMaster, THOR), HASH64((UNSIGNED8)DID)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.DID = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));