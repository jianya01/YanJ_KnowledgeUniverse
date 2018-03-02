Base_Layout:= RECORD
  string28 prim_name;
  string10 prim_range;
  string5 zip;
  string2 predir;
  string2 postdir;
  string4 suffix;
  string8 sec_range;
  string1 source_code_2;
  boolean ln_owner;
  boolean owner;
  boolean nofares_owner;
  string1 source_code_1;
  string12 ln_fares_id;
  string20 lname;
  string20 fname;
  string5 name_suffix;
  unsigned8 __internal_fpos__;
END;	



File_Base := DATASET([], Base_Layout); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank

EXPORT AddressSearchFID := INDEX(File_Base, 
							 {prim_name, prim_range, zip, predir, postdir, suffix, sec_range, source_code_2, ln_owner, owner, nofares_owner, source_code_1},
							 {File_Base}, '~thor_data400::key::ln_propertyv2::fcra::qa::addr_search.fid');