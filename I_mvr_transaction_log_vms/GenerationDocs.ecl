﻿Generated by SALT V3.8.0
Command line options: -MI_mvr_transaction_log_vms -eC:\Users\garush01\AppData\Local\Temp\TFRFABC.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_mvr_transaction_log_vms
FILENAME:Vault
INGESTFILE:SRCF:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_uid_hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(DATA16):0,0
FIELD:transaction_id:TYPE(STRING20):0,0
FIELD:product_id:TYPE(INTEGER4):0,0
FIELD:reference_number:TYPE(STRING20):0,0
FIELD:date_added:TYPE(STRING22):0,0
FIELD:report_code:TYPE(STRING4):0,0
FIELD:state_postal_code:TYPE(STRING2):0,0
FIELD:account_base:TYPE(STRING6):0,0
FIELD:account_suffix:TYPE(STRING3):0,0
FIELD:account_id:TYPE(INTEGER4):0,0
FIELD:customer_number:TYPE(INTEGER4):0,0
FIELD:drivers_license_number:TYPE(STRING23):0,0
FIELD:dfs_number:TYPE(STRING7):0,0
FIELD:full_quote_back:TYPE(STRING60):0,0
FIELD:name_prefix:TYPE(STRING5):0,0
FIELD:last_name:TYPE(STRING20):0,0
FIELD:first_name:TYPE(STRING20):0,0
FIELD:middle_name:TYPE(STRING20):0,0
FIELD:name_suffix:TYPE(STRING5):0,0
FIELD:record_version:TYPE(REAL4):0,0
FIELD:dob:TYPE(STRING8):0,0
FIELD:special_billing_id:TYPE(STRING20):0,0
FIELD:processing_status:TYPE(STRING2):0,0
FIELD:report_usage_code:TYPE(STRING2):0,0
FIELD:billing_type_id:TYPE(INTEGER3):0,0
FIELD:billing_report_code:TYPE(STRING4):0,0
FIELD:price:TYPE(REAL8):0,0
FIELD:pricing_error_code:TYPE(INTEGER4):0,0
FIELD:free:TYPE(INTEGER3):0,0
FIELD:request_format:TYPE(STRING9):0,0
FIELD:result_format:TYPE(STRING9):0,0
FIELD:result_fullfilling_product:TYPE(STRING10):0,0
FIELD:report_options:TYPE(STRING512):0,0
FIELD:transaction_code:TYPE(INTEGER4):0,0
FIELD:return_node_id:TYPE(STRING9):0,0
FIELD:request_node_id:TYPE(STRING9):0,0
FIELD:order_received_date:TYPE(STRING22):0,0
FIELD:result_returned_date:TYPE(STRING22):0,0
FIELD:order_status_code:TYPE(INTEGER4):0,0
FIELD:login_history_id:TYPE(INTEGER4):0,0
FIELD:ip_address:TYPE(STRING20):0,0
FIELD:response_time:TYPE(STRING22):0,0
FIELD:esp_method:TYPE(STRING20):0,0
FIELD:batch_job_id:TYPE(INTEGER4):0,0
FIELD:batch_seq_number:TYPE(INTEGER4):0,0
FIELD:is_migrated:TYPE(INTEGER3):0,0
FIELD:is_active:TYPE(INTEGER3):0,0
FIELD:user_added:TYPE(STRING30):0,0
FIELD:user_changed:TYPE(STRING30):0,0
FIELD:date_changed:TYPE(STRING22):0,0
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
 
