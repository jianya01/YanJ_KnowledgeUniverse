/* BlackBox File for Insurance Header Attributes */

IMPORT KELBlackBox, Utilities;

LayoutInsuranceHeader := RECORD
  unsigned8 lexid;
  unsigned4 date_first_seen;
  unsigned4 date_last_seen;
  unsigned4 ih_date_first_seen;
  unsigned4 ih_date_last_seen;
  string1 active_flag;
  string10 adl_segmentation;
  string1 gender;
  string1 derived_gender;
  unsigned4 dob;
  string9 ssn;
  string25 dl_nbr;
  string2 dl_state;
  string20 first_name;
  string20 middle_name;
  string28 last_name;
  string2 suffix;
  string2 predir;
  string10 prim_range;
  string28 prim_name;
  string4 addr_suffix;
  string2 postdir;
  string10 unit_desig;
  string8 sec_range;
  string25 city;
  string2 state;
  string5 zip;
  string4 zip4;
  string3 addrtype;
  unsigned6 hhid;
  unsigned6 hhid_indiv;
  unsigned6 hhid_relat;
  unsigned8 rid;
 END;
 
EXPORT FileBlackBoxInsuranceHeader := DATASET(KELBlackBox.FileBlackBoxLocation + 'thor::base::cdw::prod::insuranceheader', LayoutInsuranceHeader, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs);
//EXPORT FileBlackBoxInsuranceHeader := DATASET('~bpahl::base::cdw::prod::insuranceheaderslim', LayoutInsuranceHeader, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs);