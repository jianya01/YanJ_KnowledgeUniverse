﻿Generated by SALT V3.8.1
Command line options: -MI_Telematics_translog -eC:\Users\parevi02\AppData\Local\Temp\TFR8CBB.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_Telematics_translog
FILENAME:Vault
INGESTFILE:OFPU:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_uid_hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(DATA16):0,0
FIELD:transaction_id:TYPE(STRING50):0,0
FIELD:date_added:TYPE(STRING19):0,0
FIELD:submitter:TYPE(STRING60):0,0
FIELD:customer_number:TYPE(INTEGER4):0,0
FIELD:customer_am_best:TYPE(STRING60):0,0
FIELD:account_base:TYPE(STRING9):0,0
FIELD:account_suffix:TYPE(STRING3):0,0
FIELD:reference_number:TYPE(STRING50):0,0
FIELD:account_id:TYPE(INTEGER4):0,0
FIELD:policy_number:TYPE(STRING20):0,0
FIELD:insurance_type:TYPE(STRING10):0,0
FIELD:policy_type:TYPE(STRING10):0,0
FIELD:event_type:TYPE(STRING30):0,0
FIELD:event_status_code:TYPE(STRING5):0,0
FIELD:sent_to_billing:TYPE(INTEGER4):0,0
FIELD:billing_report_code:TYPE(STRING5):0,0
FIELD:quantity:TYPE(INTEGER4):0,0
FIELD:year_one_end_date:TYPE(STRING19):0,0
FIELD:vin:TYPE(STRING25):0,0
FIELD:make:TYPE(STRING30):0,0
FIELD:model:TYPE(STRING30):0,0
FIELD:year:TYPE(INTEGER2):0,0
FIELD:ship_to_address:TYPE(STRING90):0,0
FIELD:ship_to_city:TYPE(STRING50):0,0
FIELD:ship_to_state:TYPE(STRING2):0,0
FIELD:ship_to_zip:TYPE(STRING10):0,0
FIELD:mail_addr_hse:TYPE(STRING90):0,0
FIELD:mail_addr_st_name:TYPE(STRING90):0,0
FIELD:mail_addr_apt_num:TYPE(STRING10):0,0
FIELD:mail_addr_city:TYPE(STRING50):0,0
FIELD:mail_addr_state:TYPE(STRING2):0,0
FIELD:mail_addr_zip5:TYPE(STRING10):0,0
FIELD:carrier_label_branding:TYPE(STRING30):0,0
FIELD:vehicle_primary_driver_mobile_num:TYPE(STRING12):0,0
FIELD:policy_relationship:TYPE(STRING20):0,0
FIELD:last_name:TYPE(STRING30):0,0
FIELD:first_name:TYPE(STRING30):0,0
FIELD:middle_name:TYPE(STRING30):0,0
FIELD:suffix:TYPE(STRING5):0,0
FIELD:dob:TYPE(STRING8):0,0
FIELD:driver_license_num:TYPE(STRING25):0,0
FIELD:email:TYPE(STRING255):0,0
FIELD:mobile_num:TYPE(STRING12):0,0
FIELD:change_effective_date:TYPE(STRING19):0,0
FIELD:user_added:TYPE(STRING60):0,0
FIELD:user_changed:TYPE(STRING60):0,0
FIELD:date_changed:TYPE(STRING19):0,0
FIELD:product_id:TYPE(STRING10):0,0
 
 
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
 
