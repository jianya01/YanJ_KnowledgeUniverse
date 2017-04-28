IMPORT _Control;

LayoutOffense := RECORD
  unsigned6 did;
  unsigned1 criminal_count;
  unsigned4 last_criminal_date;
  unsigned1 felony_count;
  unsigned4 last_felony_date;
  unsigned1 criminal_count30;
  unsigned1 criminal_count90;
  unsigned1 criminal_count180;
  unsigned1 criminal_count12;
  unsigned1 criminal_count24;
  unsigned1 criminal_count36;
  unsigned1 criminal_count60;
  string35 crim_case_num;
  unsigned1 arrests_count;
  unsigned4 date_last_arrest;
  unsigned1 arrests_count30;
  unsigned1 arrests_count90;
  unsigned1 arrests_count180;
  unsigned1 arrests_count12;
  unsigned1 arrests_count24;
  unsigned1 arrests_count36;
  unsigned1 arrests_count60;
 END;

blankDataset := dataset([], LayoutOffense);

fileName := '~thor_data400::key::corrections_offenders_risk::20160929::bocashell_did';
EXPORT Key_BocaShell_Crim2 := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	INDEX(blankDataset, {did}, {blankDataset}, fileName),
	INDEX(blankDataset, {did}, {blankDataset}, fileName) (KEYED((UNSIGNED8)DID IN _Control.LexIDFilterSet)));