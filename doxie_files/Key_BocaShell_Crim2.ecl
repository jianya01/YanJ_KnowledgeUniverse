IMPORT _Control;

LayoutOffense := RECORD
  unsigned8 vault_rid;
  unsigned4 vault_date_first_seen;
  unsigned4 vault_date_last_seen;
  unsigned1 vault_record_status;
  data16 vault_uid_hash;
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

fileName := '~vault::thor::key::corrections_offenders_risk::prod::bocashell_did_qa';
EXPORT Key_BocaShell_Crim2 := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	DATASET(fileName, LayoutOffense, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutOffense, THOR), HASH64((UNSIGNED8)DID)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.DID = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));