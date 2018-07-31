﻿Generated by SALT V3.11.2
Command line options: -MI_fcra_did_death_masterv2_ssa -eC:\Users\gadeso01\AppData\Local\Temp\TFRAE3B.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_fcra_did_death_masterv2_ssa
FILENAME:Vault
INGESTFILE:OFPU:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_uid_hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(DATA16):0,0
FIELD:l_did:TYPE(UNSIGNED6):0,0
FIELD:did:TYPE(STRING12):0,0
FIELD:did_score:TYPE(UNSIGNED1):0,0
FIELD:filedate:TYPE(STRING8):0,0
FIELD:rec_type:TYPE(STRING1):0,0
FIELD:rec_type_orig:TYPE(STRING1):0,0
FIELD:ssn:TYPE(STRING9):0,0
FIELD:lname:TYPE(STRING20):0,0
FIELD:name_suffix:TYPE(STRING4):0,0
FIELD:fname:TYPE(STRING15):0,0
FIELD:mname:TYPE(STRING15):0,0
FIELD:vorp_code:TYPE(STRING1):0,0
FIELD:dod8:TYPE(STRING8):0,0
FIELD:dob8:TYPE(STRING8):0,0
FIELD:st_country_code:TYPE(STRING2):0,0
FIELD:zip_lastres:TYPE(STRING5):0,0
FIELD:zip_lastpayment:TYPE(STRING5):0,0
FIELD:state:TYPE(STRING2):0,0
FIELD:fipscounty:TYPE(STRING3):0,0
FIELD:crlf:TYPE(STRING2):0,0
FIELD:state_death_flag:TYPE(STRING1):0,0
FIELD:death_rec_src:TYPE(STRING3):0,0
FIELD:state_death_id:TYPE(STRING16):0,0
FIELD:src:TYPE(STRING2):0,0
FIELD:glb_flag:TYPE(STRING1):0,0
FIELD:county_name:TYPE(STRING18):0,0
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
 
