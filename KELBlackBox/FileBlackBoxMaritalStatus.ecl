/* BlackBox File for Marital Status Attributes */

IMPORT KELBlackBox, Utilities;

SHARED LayoutMaritalStatus := RECORD
  unsigned4 date_first_seen;
  unsigned4 date_last_seen;
  string1 active_flag;
  unsigned8 rid;
  unsigned8 lexid;
  string2 marital_status_v2;
  boolean name_change;
  boolean rel_vehicle;
  boolean rel_prop_same_lname;
  integer4 ts_sp_recent_dt;
  boolean ts_sp_recent_miss;
  integer4 fm_hhid;
  integer4 parent;
  string1 marital_status_v1;
  integer4 div_dt;
  integer4 mar_dt;
 END;
 
// Note: Need to verify the below location is correct
EXPORT FileBlackBoxMaritalStatus := DATASET(KELBlackBox.FileBlackBoxLocation + 'thor::base::cdw::prod::maritalstatus', LayoutMaritalStatus, THOR);