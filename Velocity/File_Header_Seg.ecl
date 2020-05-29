filePath := '~thor_data400::key::insuranceheader_segmentation::did_qa';


// rec := recordof(filePath, lookup);

rec := RECORD
  unsigned8 did;
  unsigned4 dt_last_seen;
  unsigned4 dt_first_seen;
  unsigned8 cnt;
  string10 ind;
  string3 lexid_type;
  unsigned8 death_record_cnt;
  string9 ssn;
  unsigned4 dob;
  string25 dl_nbr;
  string2 dl_state;
  string20 fname;
  string20 mname;
  string28 lname;
  string2 sname;
  string1 gender;
  string1 derived_gender;
  string10 prim_range;
  string2 predir;
  string28 prim_name;
  string4 addr_suffix;
  string2 postdir;
  string10 unit_desig;
  string8 sec_range;
  string25 city;
  string2 st;
  string5 zip;
  string4 zip4;
  unsigned8 __internal_fpos__;
 END;

emptyDs := dataset([],rec);

EXPORT File_Header_Seg := index(emptyDs, {did}, {emptyDs}, filePath);//[1..10000];