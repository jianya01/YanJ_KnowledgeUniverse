﻿Generated by SALT V3.8.0
Command line options: -MI_cc_transaction_log_policy -eC:\Users\garush01\AppData\Local\Temp\TFR6188.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_cc_transaction_log_policy
FILENAME:Vault
INGESTFILE:SRCF:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_uid_hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(DATA16):0,0
FIELD:transaction_id:TYPE(STRING20):0,0
FIELD:sequence:TYPE(STRING4):0,0
FIELD:status:TYPE(STRING1):0,0
FIELD:state:TYPE(STRING2):0,0
FIELD:am_best:TYPE(STRING6):0,0
FIELD:policy_number:TYPE(STRING20):0,0
FIELD:policy_type:TYPE(STRING2):0,0
FIELD:policy_inception_date:TYPE(STRING10):0,0
FIELD:policy_begin_date:TYPE(STRING10):0,0
FIELD:policy_cancel_date:TYPE(STRING10):0,0
FIELD:policy_end_date:TYPE(STRING10):0,0
FIELD:last_cancel_reason:TYPE(STRING4):0,0
FIELD:insurance_type:TYPE(STRING2):0,0
FIELD:suppressed:TYPE(STRING1):0,0
FIELD:naic:TYPE(STRING5):0,0
FIELD:risk_type:TYPE(STRING1):0,0
FIELD:carrier_name:TYPE(STRING30):0,0
FIELD:date_added:TYPE(STRING20):0,0
// CONCEPT statements should be used to group together interellated fields; such as address
// RELATIONSHIP is used to find non-obvious relationships between the clusters
// SOURCEFIELD is used if a field of the file denotes a source of the records in that file
// LINKPATH is used to define access paths for external linking
 
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
 