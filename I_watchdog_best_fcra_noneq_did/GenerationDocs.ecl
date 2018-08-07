﻿Generated by SALT V3.11.2
Command line options: -MI_watchdog_best_fcra_noneq_did -eC:\Users\gadeso01\AppData\Local\Temp\TFR811F.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_watchdog_best_fcra_noneq_did
FILENAME:Vault
INGESTFILE:OFPU:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_uid_hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(DATA16):0,0
FIELD:did:TYPE(UNSIGNED6):0,0
FIELD:phone:TYPE(QSTRING8):0,0
FIELD:ssn:TYPE(QSTRING7):0,0
FIELD:dob:TYPE(INTEGER4):0,0
FIELD:title:TYPE(QSTRING4):0,0
FIELD:fname:TYPE(QSTRING15):0,0
FIELD:mname:TYPE(QSTRING15):0,0
FIELD:lname:TYPE(QSTRING15):0,0
FIELD:name_suffix:TYPE(QSTRING4):0,0
FIELD:prim_range:TYPE(QSTRING8):0,0
FIELD:predir:TYPE(STRING2):0,0
FIELD:prim_name:TYPE(QSTRING21):0,0
FIELD:suffix:TYPE(QSTRING3):0,0
FIELD:postdir:TYPE(STRING2):0,0
FIELD:unit_desig:TYPE(QSTRING8):0,0
FIELD:sec_range:TYPE(QSTRING6):0,0
FIELD:city_name:TYPE(QSTRING19):0,0
FIELD:st:TYPE(STRING2):0,0
FIELD:zip:TYPE(QSTRING4):0,0
FIELD:zip4:TYPE(QSTRING3):0,0
FIELD:addr_dt_last_seen:TYPE(UNSIGNED3):0,0
FIELD:dod:TYPE(QSTRING6):0,0
FIELD:prpty_deed_id:TYPE(QSTRING13):0,0
FIELD:vehicle_vehnum:TYPE(QSTRING17):0,0
FIELD:bkrupt_crtcode_caseno:TYPE(QSTRING17):0,0
FIELD:main_count:TYPE(INTEGER4):0,0
FIELD:search_count:TYPE(INTEGER4):0,0
FIELD:dl_number:TYPE(QSTRING12):0,0
FIELD:bdid:TYPE(QSTRING9):0,0
FIELD:run_date:TYPE(INTEGER4):0,0
FIELD:total_records:TYPE(INTEGER4):0,0
FIELD:rawaid:TYPE(UNSIGNED8):0,0
FIELD:addr_dt_first_seen:TYPE(UNSIGNED3):0,0
FIELD:adl_ind:TYPE(STRING10):0,0
FIELD:valid_ssn:TYPE(STRING1):0,0
FIELD:__internal_fpos__:TYPE(UNSIGNED8):0,0
 
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
 
