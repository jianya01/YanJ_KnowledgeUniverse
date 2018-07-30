IMPORT _Control;
DidNonFCRALayout := RECORD
   unsigned6 did;
	 unsigned6 contact_id;
 END;

blankDataset := dataset([], DidNonFCRALayout);

fileName := '~thor_data400::key::paw::qa::did';

EXPORT NonFCRADidImport := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	   INDEX(blankDataset, {did}, {blankDataset}, fileName),
	   JOIN(DISTRIBUTE(INDEX(blankDataset, {did}, {blankDataset}, fileName), HASH64((UNSIGNED8)DID)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.DID = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));

