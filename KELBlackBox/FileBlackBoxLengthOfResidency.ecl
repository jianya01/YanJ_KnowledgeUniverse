/* BlackBox File for Length of Residency Attributes */

IMPORT _Control, KELBlackBox;

LayoutLengthOfResidency := RECORD
  unsigned4 date_first_seen;
  unsigned4 date_last_seen;
  string1 active_flag;
  unsigned8 rid;
  unsigned8 lexid;
  unsigned2 length_of_residency;
  unsigned4 addr_dt_first_seen;
  unsigned4 addr_dt_last_seen;
END;

fileName := KELBlackBox.FileBlackBoxLocation + 'thor::base::ar::prod::length_of_residency';
EXPORT FileBlackBoxLengthOfResidency := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	DATASET(fileName, LayoutLengthOfResidency, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs),
	DATASET(fileName, LayoutLengthOfResidency, THOR, __COMPRESSED__) ((UNSIGNED8)LexID IN _Control.LexIDFilterSet));