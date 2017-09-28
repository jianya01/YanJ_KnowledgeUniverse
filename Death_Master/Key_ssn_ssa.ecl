IMPORT _Control;

LayoutSSN_SSA := RECORD
  string9 ssn;
  string12 did;
  unsigned1 did_score;
  string8 filedate;
  string1 rec_type;
  string1 rec_type_orig;
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
  string16 state_death_id;
  string2 src;
  string1 glb_flag;
  unsigned8 __internal_fpos__;
 END;

blankDataset := dataset([], LayoutSSN_SSA);

fileName := '~thor_data400::key::fcra::death_master_ssa::ssn_qa';

EXPORT Key_ssn_ssa := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	 INDEX(blankDataset, {ssn}, {blankDataset}, fileName),
	 INDEX(blankDataset, {ssn}, {blankDataset}, fileName) ((unsigned6)did IN _Control.LexIDFilterSet)); //changed from (string9)ssn to (unsigned6)ssn
 




