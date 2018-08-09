IMPORT _Control;

layout_date := RECORD
  unsigned4 date;
  string60 offender_key;
  string35 case_num;
  string1 fcra_conviction_flag;
  string1 fcra_traffic_flag;
  string2 offense_score;
 END;

layout := RECORD
	unsigned6 did;
	DATASET(layout_date) criminal_count{maxcount(100)};
	unsigned8 __internal_fpos__;
END;

layout_final := RECORD
	unsigned6 did;
	unsigned4 date;
  string60 offender_key;
  string35 case_num;
  string1 fcra_conviction_flag;
  string1 fcra_traffic_flag;
  string2 offense_score;
	unsigned8 __internal_fpos__;
END;

blankDataset := DATASET([], layout);

fileName := '~thor_data400::key::corrections_offenders::fcra::bocashell_did_qa';

ds := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	INDEX(blankDataset, {did}, {blankDataset}, fileName),
	JOIN(DISTRIBUTE(INDEX(blankDataset, {did}, {blankDataset}, fileName), HASH64((UNSIGNED)did)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.did = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));

layout_final NormIt(layout L, layout_date R) := TRANSFORM
	SELF := l;
	SELF := R;
END;

EXPORT FCRABocashellDID := NORMALIZE(ds, LEFT.criminal_count, NormIt(LEFT, RIGHT));