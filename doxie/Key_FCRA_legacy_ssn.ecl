IMPORT _Control;

Layoutlegacyssn :=  RECORD
    qstring9 ssn;
		unsigned6 did;
 END;

blankDataset := dataset([], Layoutlegacyssn);

fileName := '~thor_data400::key::fcra::header.legacy_ssn_vaultriskviewkeys';

EXPORT Key_FCRA_legacy_ssn := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	  INDEX(blankDataset, {ssn}, {blankDataset}, fileName),
	  JOIN(DISTRIBUTE(INDEX(blankDataset, {ssn}, {blankDataset}, fileName), HASH64((UNSIGNED8)DID)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.DID = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));