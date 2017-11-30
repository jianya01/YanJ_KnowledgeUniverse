﻿Generated by SALT V3.8.1
Command line options: -MI_Tobacco_Vente -eC:\Users\parevi02\AppData\Local\Temp\TFR858B.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_Tobacco_Vente
FILENAME:Vault
INGESTFILE:OFPU:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_UID_Hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(DATA16):0,0
FIELD:lexid:TYPE(UNSIGNED8):0,0
FIELD:receive_date:TYPE(STRING10):0,0
FIELD:member_id:TYPE(STRING):0,0
FIELD:fname:TYPE(STRING):0,0
FIELD:lname:TYPE(STRING):0,0
FIELD:street:TYPE(STRING):0,0
FIELD:city_address:TYPE(STRING):0,0
FIELD:state:TYPE(STRING):0,0
FIELD:zip_code:TYPE(STRING):0,0
FIELD:zip_code4:TYPE(STRING):0,0
FIELD:dob:TYPE(STRING):0,0
FIELD:last_reg_date:TYPE(STRING):0,0
FIELD:isasmoker:TYPE(STRING):0,0
FIELD:sourcerid:TYPE(UNSIGNED8):0,0
FIELD:name_id:TYPE(UNSIGNED8):0,0
FIELD:clean_fname:TYPE(STRING20):0,0
FIELD:clean_lname:TYPE(STRING20):0,0
FIELD:clean_sname:TYPE(STRING25):0,0
FIELD:address_id:TYPE(UNSIGNED8):0,0
FIELD:prim_range:TYPE(STRING10):0,0
FIELD:predir:TYPE(STRING2):0,0
FIELD:prim_name:TYPE(STRING28):0,0
FIELD:addr_suffix:TYPE(STRING4):0,0
FIELD:postdir:TYPE(STRING2):0,0
FIELD:unit_desig:TYPE(STRING10):0,0
FIELD:sec_range:TYPE(STRING8):0,0
FIELD:city:TYPE(STRING20):0,0
FIELD:st:TYPE(STRING2):0,0
FIELD:zip:TYPE(STRING5):0,0
FIELD:zip4:TYPE(STRING4):0,0
FIELD:cart:TYPE(STRING4):0,0
FIELD:cr_sort_sz:TYPE(STRING1):0,0
FIELD:lot:TYPE(STRING4):0,0
FIELD:lot_order:TYPE(STRING1):0,0
FIELD:dbpc:TYPE(STRING2):0,0
FIELD:chk_digit:TYPE(STRING1):0,0
FIELD:rec_type:TYPE(STRING2):0,0
FIELD:fips_state:TYPE(STRING2):0,0
FIELD:fips_county:TYPE(STRING3):0,0
FIELD:geo_lat:TYPE(STRING10):0,0
FIELD:geo_long:TYPE(STRING11):0,0
FIELD:msa:TYPE(STRING4):0,0
FIELD:geo_blk:TYPE(STRING7):0,0
FIELD:geo_match:TYPE(STRING1):0,0
FIELD:error_code:TYPE(STRING4):0,0
 
 
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
 