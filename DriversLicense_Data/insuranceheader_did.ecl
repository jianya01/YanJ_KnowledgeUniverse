IMPORT _Control;

Layout_insuranceheader_did := RECORD
  unsigned8 did;
  string5 title;
  string20 fname;
  string20 mname;
  string28 lname;
  string5 sname;
  unsigned4 dob;
  string25 dl_nbr;
  string2 dl_state;
  string9 src;
  unsigned4 dt_first_seen;
  unsigned4 dt_last_seen;
 END;

blankDataset := DATASET([],Layout_insuranceheader_did);

fileName := '~thor_data400::key::insuranceheader::qa::did';

EXPORT insuranceheader_did := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
		INDEX(blankDataset, {did}, {blankDataset}, fileName),
	  JOIN(DISTRIBUTE(INDEX(blankDataset, {did}, {blankDataset}, fileName), HASH64((UNSIGNED6)did)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED6)LEFT.did = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));