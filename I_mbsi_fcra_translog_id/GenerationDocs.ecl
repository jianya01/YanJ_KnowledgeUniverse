﻿Generated by SALT V3.8.1
Command line options: -MI_mbsi_fcra_translog_id -eC:\Users\parevi02\AppData\Local\Temp\TFRE5AB.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_mbsi_fcra_translog_id
FILENAME:Vault
INGESTFILE:OFPU:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_UID_Hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(DATA16):0,0
FIELD:transaction_id:TYPE(STRING20):0,0
FIELD:product_id:TYPE(INTEGER4):0,0
FIELD:date_added:TYPE(STRING22):0,0
FIELD:login_id:TYPE(STRING60):0,0
FIELD:billing_code:TYPE(STRING20):0,0
FIELD:function_name:TYPE(STRING30):0,0
FIELD:report_code:TYPE(STRING4):0,0
FIELD:account_base:TYPE(STRING8):0,0
FIELD:account_suffix:TYPE(STRING3):0,0
FIELD:account_id:TYPE(INTEGER4):0,0
FIELD:customer_number:TYPE(INTEGER4):0,0
FIELD:customer_reference_code:TYPE(STRING60):0,0
FIELD:i_date_ordered:TYPE(STRING10):0,0
FIELD:i_person_ssn:TYPE(STRING9):0,0
FIELD:i_person_name_prefix:TYPE(STRING5):0,0
FIELD:i_person_last_name:TYPE(STRING20):0,0
FIELD:i_person_first_name:TYPE(STRING20):0,0
FIELD:i_person_middle_name:TYPE(STRING20):0,0
FIELD:i_person_name_suffix:TYPE(STRING5):0,0
FIELD:i_person_dob:TYPE(STRING8):0,0
FIELD:count_person_in:TYPE(INTEGER3):0,0
FIELD:i_dl1_number:TYPE(STRING5):0,0
FIELD:i_dl1_state:TYPE(STRING2):0,0
FIELD:i_dl1_type:TYPE(INTEGER3):0,0
FIELD:count_dl_in:TYPE(INTEGER3):0,0
FIELD:i_addr_line:TYPE(STRING90):0,0
FIELD:i_addr_street_type:TYPE(INTEGER1):0,0
FIELD:i_addr_state:TYPE(STRING2):0,0
FIELD:i_addr_zip:TYPE(STRING10):0,0
FIELD:i_addr_city:TYPE(STRING50):0,0
FIELD:i_addr_county:TYPE(STRING50):0,0
FIELD:i_addr_country:TYPE(STRING3):0,0
FIELD:i_addr_type:TYPE(INTEGER3):0,0
FIELD:count_addr_in:TYPE(INTEGER3):0,0
FIELD:i_vehicle_vin:TYPE(STRING20):0,0
FIELD:i_vehicle_year:TYPE(UNSIGNED6):0,0
FIELD:i_vehicle_make:TYPE(STRING30):0,0
FIELD:i_vehicle_model:TYPE(STRING30):0,0
FIELD:i_vehicle_plate_data:TYPE(STRING10):0,0
FIELD:i_vehicle_state:TYPE(STRING2):0,0
FIELD:count_vehicle_in:TYPE(INTEGER3):0,0
FIELD:i_unique_id:TYPE(STRING32):0,0
FIELD:i_unique_id_type:TYPE(INTEGER3):0,0
FIELD:record_version:TYPE(REAL4):0,0
FIELD:reference_number:TYPE(STRING20):0,0
FIELD:processing_status:TYPE(STRING6):0,0
FIELD:billing_type_id:TYPE(INTEGER3):0,0
FIELD:price:TYPE(REAL8):0,0
FIELD:currency:TYPE(INTEGER3):0,0
FIELD:pricing_error_code:TYPE(INTEGER4):0,0
FIELD:free:TYPE(INTEGER3):0,0
FIELD:record_count_1:TYPE(INTEGER4):0,0
FIELD:record_count_1_type:TYPE(INTEGER3):0,0
FIELD:record_count_2:TYPE(INTEGER4):0,0
FIELD:record_count_2_type:TYPE(INTEGER3):0,0
FIELD:result_format:TYPE(STRING9):0,0
FIELD:report_options:TYPE(STRING10):0,0
FIELD:transaction_code:TYPE(INTEGER4):0,0
FIELD:return_node_id:TYPE(STRING9):0,0
FIELD:request_node_id:TYPE(STRING9):0,0
FIELD:order_status_code:TYPE(INTEGER4):0,0
FIELD:product_line:TYPE(STRING3):0,0
FIELD:login_history_id:TYPE(INTEGER4):0,0
FIELD:ip_address:TYPE(STRING20):0,0
FIELD:response_time:TYPE(STRING22):0,0
FIELD:esp_method:TYPE(STRING40):0,0
FIELD:batch_job_id:TYPE(INTEGER4):0,0
FIELD:batch_seq_number:TYPE(INTEGER4):0,0
FIELD:user_added:TYPE(STRING60):0,0
FIELD:user_changed:TYPE(STRING60):0,0
FIELD:date_changed:TYPE(STRING22):0,0
 
 
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
 
