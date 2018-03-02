Base_Layout:= RECORD
  unsigned8 s_did;
  string1 source_code_2;
  string12 ln_fares_id;
  string2 source_code;
  string20 lname;
  string20 fname;
  string10 prim_range;
  string2 predir;
  string28 prim_name;
  string4 suffix;
  string2 postdir;
  string8 sec_range;
  string2 st;
  string25 p_city_name;
  string5 zip;
  string5 county;
  string7 geo_blk;
  unsigned8 __internal_fpos__;
END;	



File_Base := DATASET([], Base_Layout); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank

EXPORT SearchDID := INDEX(File_Base, 
							 {s_did, source_code_2},
							 {File_Base}, '~thor_data400::key::ln_propertyv2::fcra::qa::search.did');