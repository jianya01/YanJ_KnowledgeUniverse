﻿Generated by SALT V3.8.1
Command line options: -MI_rules_transaction_log_police -eC:\Users\gadeso01\AppData\Local\Temp\TFR1DB2.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_rules_transaction_log_police
FILENAME:Vault
INGESTFILE:SRTL:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_uid_hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(DATA16):0,0
FIELD:transaction_id:TYPE(STRING60):0,0
FIELD:agency_type:TYPE(STRING40):0,0
FIELD:order_id:TYPE(STRING20):0,0
FIELD:claim_number:TYPE(STRING40):0,0
FIELD:claim_state:TYPE(STRING2):0,0
FIELD:date_loss:TYPE(STRING19):0,0
FIELD:report_type:TYPE(STRING40):0,0
FIELD:policy_number:TYPE(STRING40):0,0
FIELD:return_options:TYPE(STRING40):0,0
FIELD:order_type:TYPE(STRING40):0,0
FIELD:initial_status:TYPE(STRING40):0,0
FIELD:date_returned:TYPE(STRING19):0,0
FIELD:data_elements:TYPE(STRING40):0,0
FIELD:return:TYPE(STRING40):0,0
FIELD:report_available:TYPE(STRING40):0,0
FIELD:date_added:TYPE(STRING25):0,0
FIELD:agency_name:TYPE(STRING200):0,0
 
Total available specificity:0
Search Threshold set at -4
Use of PERSISTs in code set at:3
 
__Glossary__
Edit Distance: An edit distance of (say) one implies that one string can be converted into another by doing one of
  - Changing one character
  - Deleting one character
  - Transposing two characters
 
Forcing Criteria: In addition to the general 'best match' logic it is possible to insist that
one particular field must match to some degree or the whole record is considered a bad match.
The criterial applied to that one field is the forcing criteria.
 
Cascade: Best Type rules are applied in such a way that the rules are applied one by one UNTIL the first rule succeeds; subsequent rules are then skipped.
 
__General Notes__
How is it decided how much to subtract for a bad match?
SALT computes for each field the percentage likelihood that a valid cluster will have two or more values for a given field
this value (called the switch value in the SALT literature) is then used to produce the subtraction value from the match value.
The value in this document is the one typed into the SPC file; the code will use a value computed at run-time.
 
