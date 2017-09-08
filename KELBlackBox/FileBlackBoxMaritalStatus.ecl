/* BlackBox File for Marital Status Attributes */

IMPORT _Control, KELBlackBox;

LayoutMaritalStatus := RECORD
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

fileName := KELBlackBox.FileBlackBoxLocation + 'thor::base::ar::prod::maritalstatus';
EXPORT FileBlackBoxMaritalStatus := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	DATASET(fileName, LayoutMaritalStatus, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutMaritalStatus, THOR, __COMPRESSED__), HASH64((UNSIGNED8)LexID)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.LexID = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));