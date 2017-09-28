IMPORT _Control;

Layoutlegacyssn :=  RECORD
    qstring9 ssn;
		unsigned6 did;
 END;

blankDataset := dataset([], Layoutlegacyssn);

fileName := '~thor_data400::key::fcra::header.legacy_ssn_qa';

EXPORT Key_FCRA_legacy_ssn := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	  INDEX(blankDataset, {ssn}, {blankDataset}, fileName),
	  INDEX(blankDataset, {ssn}, {blankDataset}, fileName) ((unsigned6)did IN _Control.LexIDFilterSet)); //changed from (string9)ssn to (unsigned6)ssn


