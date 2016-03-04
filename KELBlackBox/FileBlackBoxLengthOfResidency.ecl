/* BlackBox File for Length of Residency Attributes */

IMPORT KELBlackBox, Utilities;

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

EXPORT FileBlackBoxLengthOfResidency := DATASET(KELBlackBox.FileBlackBoxLocation + 'thor::base::ar::prod::length_of_residency', LayoutLengthOfResidency, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs);
//EXPORT FileBlackBoxLengthOfResidency := DATASET('~bpahl::base::ar::prod::length_of_residencyslim', LayoutLengthOfResidency, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs);