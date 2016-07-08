Base_Layout := RECORD
  string28 prim_name;
  string10 prim_range;
  string9 zip;
  string8 sec_range;
  string2 inst_type;
  string200 institution;
  string240 mail_addr;
  string30 mail_city;
  string10 mail_state;
  string9 mail_zip;
  string240 addr1;
  string30 city;
  string10 state;
  string100 notes;
  string50 name;
  string70 title;
  string20 fname;
  string20 mname;
  string20 lname;
  string5 name_suffix;
  string120 addr2;
  string2 predir;
  string4 addr_suffix;
  string2 postdir;
  string10 unit_desig;
  string25 p_city_name;
  string25 v_city_name;
  string2 st;
  string5 z5;
  string4 zip4;
  string10 phone;
  string10 inst_type_exp;
  string1 addr_type;
END;

ACA_Base := DATASET([], Base_Layout); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank

EXPORT Key_ACA_Addr := INDEX(ACA_Base, 
						{prim_name, prim_range, zip, sec_range}, 
						{ACA_Base}, 
						'~thor::base::key::aca_institutions_addr_qa') (Prim_Name != '');