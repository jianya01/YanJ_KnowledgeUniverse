LayoutCorrections := RECORD
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
 
fileName := '~thor_data400::key::corrections_offenders_risk::bocashell_did_qa';

EXPORT corrections_offenders_fcra_bocashell_did_qa := DATASET(fileName, LayoutCorrections, THOR);