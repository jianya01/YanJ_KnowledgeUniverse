IMPORT _Control;

append_did_layout := RECORD
  unsigned6 append_did;
  boolean is_minor;
  string30 vehicle_key;
  string15 iteration_key;
  string15 sequence_key;
  unsigned8 __internal_fpos__;
 END;

blankDataset := dataset([], append_did_layout);

fileName := '~thor_data400::key::vehiclev2::did_qa';

EXPORT append_did := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	   INDEX(blankDataset, {append_did,is_minor}, {blankDataset}, fileName),
	   JOIN(DISTRIBUTE(INDEX(blankDataset, {append_did,is_minor}, {blankDataset}, fileName), HASH64((UNSIGNED8)APPEND_DID)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.APPEND_DID = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));
 