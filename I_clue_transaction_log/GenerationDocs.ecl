﻿Generated by SALT V3.8.0
Command line options: -MI_clue_transaction_log -eC:\Users\garush01\AppData\Local\Temp\TFR6FA0.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_clue_transaction_log
FILENAME:Vault
INGESTFILE:SRCF:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_uid_hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(DATA16):0,0
FIELD:transaction_id:TYPE(STRING20):0,0
FIELD:product_id:TYPE(STRING11):0,0
FIELD:date_added:TYPE(STRING20):0,0
FIELD:agent_code:TYPE(STRING1):0,0
FIELD:service_type:TYPE(STRING1):0,0
FIELD:safescan_ordered:TYPE(STRING1):0,0
FIELD:curr_carr_ordered:TYPE(STRING1):0,0
FIELD:add_ordered:TYPE(STRING1):0,0
FIELD:hov_rp_ordered:TYPE(STRING1):0,0
FIELD:inq_process_stat_code:TYPE(STRING1):0,0
FIELD:hov_process_stat_code:TYPE(STRING1):0,0
FIELD:online_code:TYPE(STRING1):0,0
FIELD:secondary_report:TYPE(STRING1):0,0
FIELD:bill_code_1:TYPE(STRING1):0,0
FIELD:bill_code_2:TYPE(STRING1):0,0
FIELD:special_billing_id:TYPE(STRING20):0,0
FIELD:report_code:TYPE(STRING4):0,0
FIELD:account_base:TYPE(STRING6):0,0
FIELD:account_suffix:TYPE(STRING3):0,0
FIELD:account_id:TYPE(STRING11):0,0
FIELD:customer_number:TYPE(STRING11):0,0
FIELD:bill_as:TYPE(STRING1):0,0
FIELD:type_bill:TYPE(STRING1):0,0
FIELD:account_type:TYPE(STRING1):0,0
FIELD:vin_decode:TYPE(STRING1):0,0
FIELD:full_quote_back:TYPE(STRING60):0,0
FIELD:i_date_ordered:TYPE(STRING20):0,0
FIELD:count_person_in:TYPE(STRING3):0,0
FIELD:count_person_used:TYPE(STRING3):0,0
FIELD:i_addr1_house_num:TYPE(STRING9):0,0
FIELD:i_addr1_apt_num:TYPE(STRING5):0,0
FIELD:i_addr1_line:TYPE(STRING20):0,0
FIELD:i_addr1_state:TYPE(STRING2):0,0
FIELD:i_addr1_zip:TYPE(STRING10):0,0
FIELD:i_addr1_city:TYPE(STRING50):0,0
FIELD:i_addr1_county:TYPE(STRING50):0,0
FIELD:i_addr1_country:TYPE(STRING3):0,0
FIELD:i_addr1_type:TYPE(STRING3):0,0
FIELD:i_addr2_house_num:TYPE(STRING9):0,0
FIELD:i_addr2_apt_num:TYPE(STRING5):0,0
FIELD:i_addr2_line:TYPE(STRING20):0,0
FIELD:i_addr2_state:TYPE(STRING2):0,0
FIELD:i_addr2_zip:TYPE(STRING10):0,0
FIELD:i_addr2_city:TYPE(STRING50):0,0
FIELD:i_addr2_county:TYPE(STRING50):0,0
FIELD:i_addr2_country:TYPE(STRING3):0,0
FIELD:i_addr2_type:TYPE(STRING3):0,0
FIELD:i_addr3_line:TYPE(STRING20):0,0
FIELD:i_addr3_house_num:TYPE(STRING9):0,0
FIELD:i_addr3_apt_num:TYPE(STRING5):0,0
FIELD:i_addr3_state:TYPE(STRING2):0,0
FIELD:i_addr3_zip:TYPE(STRING10):0,0
FIELD:i_addr3_city:TYPE(STRING50):0,0
FIELD:i_addr3_county:TYPE(STRING50):0,0
FIELD:i_addr3_country:TYPE(STRING3):0,0
FIELD:i_addr3_type:TYPE(STRING3):0,0
FIELD:count_addr_in:TYPE(STRING3):0,0
FIELD:count_addr_used:TYPE(STRING3):0,0
FIELD:count_vehicle_in:TYPE(STRING3):0,0
FIELD:count_vehicle_used:TYPE(STRING3):0,0
FIELD:vin_d_code:TYPE(STRING1):0,0
FIELD:jua_ltr_code:TYPE(STRING1):0,0
FIELD:prc_founds:TYPE(STRING3):0,0
FIELD:addit_driver_reported:TYPE(STRING3):0,0
FIELD:prior_inquiry_found:TYPE(STRING3):0,0
FIELD:dd_flag:TYPE(STRING1):0,0
FIELD:policy_type:TYPE(STRING2):0,0
FIELD:policy_number:TYPE(STRING20):0,0
FIELD:inq_hist_claims:TYPE(STRING3):0,0
FIELD:count_claims_found:TYPE(STRING6):0,0
FIELD:count_claims_reported:TYPE(STRING6):0,0
FIELD:risk_claims:TYPE(STRING6):0,0
FIELD:insrd_claims:TYPE(STRING6):0,0
FIELD:subject_claims:TYPE(STRING6):0,0
FIELD:vin_claims:TYPE(STRING6):0,0
FIELD:did_count:TYPE(STRING3):0,0
FIELD:requestor_type:TYPE(STRING1):0,0
FIELD:test_prod_indicator:TYPE(STRING1):0,0
FIELD:iso_vm:TYPE(STRING10):0,0
FIELD:line_id:TYPE(STRING10):0,0
FIELD:inquiry_history_records_added:TYPE(STRING3):0,0
FIELD:processing_comments:TYPE(STRING40):0,0
FIELD:record_version:TYPE(STRING5):0,0
FIELD:reference_number:TYPE(STRING20):0,0
FIELD:processing_status:TYPE(STRING1):0,0
FIELD:billing_type_id:TYPE(STRING3):0,0
FIELD:price:TYPE(STRING27):0,0
FIELD:currency:TYPE(STRING3):0,0
FIELD:pricing_error_code:TYPE(STRING11):0,0
FIELD:free:TYPE(STRING3):0,0
FIELD:record_count:TYPE(STRING11):0,0
FIELD:result_format:TYPE(STRING9):0,0
FIELD:report_options:TYPE(STRING10):0,0
FIELD:transaction_code:TYPE(STRING11):0,0
FIELD:return_node_id:TYPE(STRING9):0,0
FIELD:request_node_id:TYPE(STRING9):0,0
FIELD:order_status_code:TYPE(STRING11):0,0
FIELD:product_line:TYPE(STRING3):0,0
FIELD:login_history_id:TYPE(STRING11):0,0
FIELD:ip_address:TYPE(STRING20):0,0
FIELD:response_time:TYPE(STRING12):0,0
FIELD:data_enhancement_response_time:TYPE(STRING12):0,0
FIELD:hov_response_time:TYPE(STRING12):0,0
FIELD:add_response_time:TYPE(STRING12):0,0
FIELD:real_prop_response_time:TYPE(STRING12):0,0
FIELD:safe_scan_response_time:TYPE(STRING12):0,0
FIELD:deltabase_subj_response_time:TYPE(STRING12):0,0
FIELD:deltabase_claim_response_time:TYPE(STRING12):0,0
FIELD:roxie_response_time:TYPE(STRING12):0,0
FIELD:soap_call_error_msg:TYPE(STRING40):0,0
FIELD:esp_method:TYPE(STRING40):0,0
FIELD:batch_job_id:TYPE(STRING11):0,0
FIELD:batch_seq_number:TYPE(STRING11):0,0
FIELD:add_billed:TYPE(STRING11):0,0
FIELD:add_reported:TYPE(STRING11):0,0
FIELD:hh_add_billed:TYPE(STRING11):0,0
FIELD:hh_billed:TYPE(STRING11):0,0
FIELD:hh_vin_billed:TYPE(STRING11):0,0
FIELD:overage_billed:TYPE(STRING11):0,0
FIELD:subj_add_billed:TYPE(STRING11):0,0
FIELD:subj_billed:TYPE(STRING11):0,0
FIELD:subj_reported:TYPE(STRING11):0,0
FIELD:vin_billed:TYPE(STRING11):0,0
FIELD:vin_plus_billed:TYPE(STRING11):0,0
FIELD:vin_plus_reported:TYPE(STRING11):0,0
FIELD:vin_reported:TYPE(STRING11):0,0
FIELD:real_prop_billed:TYPE(STRING11):0,0
FIELD:secondary_billed:TYPE(STRING11):0,0
FIELD:verbal_pos_billed:TYPE(STRING11):0,0
FIELD:agent_billed:TYPE(STRING11):0,0
FIELD:uw_billed:TYPE(STRING11):0,0
FIELD:clue_prop_billed:TYPE(STRING11):0,0
FIELD:clue_prop_recs_b:TYPE(STRING11):0,0
FIELD:clue_prop_recs_d:TYPE(STRING11):0,0
FIELD:is_active:TYPE(STRING4):0,0
FIELD:user_added:TYPE(STRING60):0,0
FIELD:user_changed:TYPE(STRING60):0,0
FIELD:date_changed:TYPE(STRING20):0,0
FIELD:surcharge_possible:TYPE(STRING6):0,0
FIELD:potentialcorruption:TYPE(STRING1):0,0
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
 