﻿Generated by SALT V3.8.0
Command line options: -MI_Key_Relatives_V3 -eC:\Users\parevi02\AppData\Local\Temp\TFR2043.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_Key_Relatives_V3
FILENAME:Vault
INGESTFILE:OFPU:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_UID_Hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(INTEGER8):0,0
FIELD:did1:TYPE(UNSIGNED6):0,0
FIELD:type:TYPE(STRING15):0,0
FIELD:confidence:TYPE(STRING10):0,0
FIELD:did2:TYPE(UNSIGNED6):0,0
FIELD:cohabit_score:TYPE(INTEGER2):0,0
FIELD:cohabit_cnt:TYPE(INTEGER2):0,0
FIELD:coapt_score:TYPE(INTEGER2):0,0
FIELD:coapt_cnt:TYPE(INTEGER2):0,0
FIELD:copobox_score:TYPE(INTEGER2):0,0
FIELD:copobox_cnt:TYPE(INTEGER2):0,0
FIELD:cossn_score:TYPE(INTEGER2):0,0
FIELD:cossn_cnt:TYPE(INTEGER2):0,0
FIELD:copolicy_score:TYPE(INTEGER2):0,0
FIELD:copolicy_cnt:TYPE(INTEGER2):0,0
FIELD:coclaim_score:TYPE(INTEGER2):0,0
FIELD:coclaim_cnt:TYPE(INTEGER2):0,0
FIELD:coproperty_score:TYPE(INTEGER2):0,0
FIELD:coproperty_cnt:TYPE(INTEGER2):0,0
FIELD:bcoproperty_score:TYPE(INTEGER2):0,0
FIELD:bcoproperty_cnt:TYPE(INTEGER2):0,0
FIELD:coforeclosure_score:TYPE(INTEGER2):0,0
FIELD:coforeclosure_cnt:TYPE(INTEGER2):0,0
FIELD:bcoforeclosure_score:TYPE(INTEGER2):0,0
FIELD:bcoforeclosure_cnt:TYPE(INTEGER2):0,0
FIELD:colien_score:TYPE(INTEGER2):0,0
FIELD:colien_cnt:TYPE(INTEGER2):0,0
FIELD:bcolien_score:TYPE(INTEGER2):0,0
FIELD:bcolien_cnt:TYPE(INTEGER2):0,0
FIELD:cobankruptcy_score:TYPE(INTEGER2):0,0
FIELD:cobankruptcy_cnt:TYPE(INTEGER2):0,0
FIELD:bcobankruptcy_score:TYPE(INTEGER2):0,0
FIELD:bcobankruptcy_cnt:TYPE(INTEGER2):0,0
FIELD:covehicle_score:TYPE(INTEGER2):0,0
FIELD:covehicle_cnt:TYPE(INTEGER2):0,0
FIELD:coexperian_score:TYPE(INTEGER2):0,0
FIELD:coexperian_cnt:TYPE(INTEGER2):0,0
FIELD:cotransunion_score:TYPE(INTEGER2):0,0
FIELD:cotransunion_cnt:TYPE(INTEGER2):0,0
FIELD:coenclarity_score:TYPE(INTEGER2):0,0
FIELD:coenclarity_cnt:TYPE(INTEGER2):0,0
FIELD:coecrash_score:TYPE(INTEGER2):0,0
FIELD:coecrash_cnt:TYPE(INTEGER2):0,0
FIELD:bcoecrash_score:TYPE(INTEGER2):0,0
FIELD:bcoecrash_cnt:TYPE(INTEGER2):0,0
FIELD:cowatercraft_score:TYPE(INTEGER2):0,0
FIELD:cowatercraft_cnt:TYPE(INTEGER2):0,0
FIELD:coaircraft_score:TYPE(INTEGER2):0,0
FIELD:coaircraft_cnt:TYPE(INTEGER2):0,0
FIELD:comarriagedivorce_score:TYPE(INTEGER2):0,0
FIELD:comarriagedivorce_cnt:TYPE(INTEGER2):0,0
FIELD:coucc_score:TYPE(INTEGER2):0,0
FIELD:coucc_cnt:TYPE(INTEGER2):0,0
FIELD:lname_score:TYPE(INTEGER2):0,0
FIELD:phone_score:TYPE(INTEGER2):0,0
FIELD:dl_nbr_score:TYPE(INTEGER2):0,0
FIELD:total_cnt:TYPE(UNSIGNED2):0,0
FIELD:total_score:TYPE(INTEGER2):0,0
FIELD:cluster:TYPE(STRING10):0,0
FIELD:generation:TYPE(STRING2):0,0
FIELD:gender:TYPE(STRING1):0,0
FIELD:lname_cnt:TYPE(UNSIGNED4):0,0
FIELD:rel_dt_first_seen:TYPE(UNSIGNED4):0,0
FIELD:rel_dt_last_seen:TYPE(UNSIGNED4):0,0
FIELD:overlap_months:TYPE(UNSIGNED2):0,0
FIELD:hdr_dt_first_seen:TYPE(UNSIGNED4):0,0
FIELD:hdr_dt_last_seen:TYPE(UNSIGNED4):0,0
FIELD:age_first_seen:TYPE(UNSIGNED2):0,0
FIELD:isanylnamematch:TYPE(BOOLEAN1):0,0
FIELD:isanyphonematch:TYPE(BOOLEAN1):0,0
FIELD:isearlylnamematch:TYPE(BOOLEAN1):0,0
FIELD:iscurrlnamematch:TYPE(BOOLEAN1):0,0
FIELD:ismixedlnamematch:TYPE(BOOLEAN1):0,0
FIELD:ssn1:TYPE(STRING9):0,0
FIELD:ssn2:TYPE(STRING9):0,0
FIELD:dob1:TYPE(UNSIGNED4):0,0
FIELD:dob2:TYPE(UNSIGNED4):0,0
FIELD:current_lname1:TYPE(STRING28):0,0
FIELD:current_lname2:TYPE(STRING28):0,0
FIELD:early_lname1:TYPE(STRING28):0,0
FIELD:early_lname2:TYPE(STRING28):0,0
FIELD:addr_ind1:TYPE(STRING2):0,0
FIELD:addr_ind2:TYPE(STRING2):0,0
FIELD:r2rdid:TYPE(UNSIGNED6):0,0
FIELD:r2cnt:TYPE(UNSIGNED6):0,0
FIELD:personal:TYPE(BOOLEAN1):0,0
FIELD:business:TYPE(BOOLEAN1):0,0
FIELD:other:TYPE(BOOLEAN1):0,0
FIELD:title:TYPE(UNSIGNED1):0,0
 
 
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
 