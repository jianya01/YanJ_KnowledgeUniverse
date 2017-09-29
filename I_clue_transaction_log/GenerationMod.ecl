﻿// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_clue_transaction_log';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_clue_transaction_log\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:SRCF:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:product_id:TYPE(STRING11):0,0\n'
    + 'FIELD:date_added:TYPE(STRING20):0,0\n'
    + 'FIELD:agent_code:TYPE(STRING1):0,0\n'
    + 'FIELD:service_type:TYPE(STRING1):0,0\n'
    + 'FIELD:safescan_ordered:TYPE(STRING1):0,0\n'
    + 'FIELD:curr_carr_ordered:TYPE(STRING1):0,0\n'
    + 'FIELD:add_ordered:TYPE(STRING1):0,0\n'
    + 'FIELD:hov_rp_ordered:TYPE(STRING1):0,0\n'
    + 'FIELD:inq_process_stat_code:TYPE(STRING1):0,0\n'
    + 'FIELD:hov_process_stat_code:TYPE(STRING1):0,0\n'
    + 'FIELD:online_code:TYPE(STRING1):0,0\n'
    + 'FIELD:secondary_report:TYPE(STRING1):0,0\n'
    + 'FIELD:bill_code_1:TYPE(STRING1):0,0\n'
    + 'FIELD:bill_code_2:TYPE(STRING1):0,0\n'
    + 'FIELD:special_billing_id:TYPE(STRING20):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:account_base:TYPE(STRING6):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:account_id:TYPE(STRING11):0,0\n'
    + 'FIELD:customer_number:TYPE(STRING11):0,0\n'
    + 'FIELD:bill_as:TYPE(STRING1):0,0\n'
    + 'FIELD:type_bill:TYPE(STRING1):0,0\n'
    + 'FIELD:account_type:TYPE(STRING1):0,0\n'
    + 'FIELD:vin_decode:TYPE(STRING1):0,0\n'
    + 'FIELD:full_quote_back:TYPE(STRING60):0,0\n'
    + 'FIELD:i_date_ordered:TYPE(STRING20):0,0\n'
    + 'FIELD:count_person_in:TYPE(STRING3):0,0\n'
    + 'FIELD:count_person_used:TYPE(STRING3):0,0\n'
    + 'FIELD:i_addr1_house_num:TYPE(STRING9):0,0\n'
    + 'FIELD:i_addr1_apt_num:TYPE(STRING5):0,0\n'
    + 'FIELD:i_addr1_line:TYPE(STRING20):0,0\n'
    + 'FIELD:i_addr1_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_addr1_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr1_city:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr1_county:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr1_country:TYPE(STRING3):0,0\n'
    + 'FIELD:i_addr1_type:TYPE(STRING3):0,0\n'
    + 'FIELD:i_addr2_house_num:TYPE(STRING9):0,0\n'
    + 'FIELD:i_addr2_apt_num:TYPE(STRING5):0,0\n'
    + 'FIELD:i_addr2_line:TYPE(STRING20):0,0\n'
    + 'FIELD:i_addr2_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_addr2_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr2_city:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr2_county:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr2_country:TYPE(STRING3):0,0\n'
    + 'FIELD:i_addr2_type:TYPE(STRING3):0,0\n'
    + 'FIELD:i_addr3_line:TYPE(STRING20):0,0\n'
    + 'FIELD:i_addr3_house_num:TYPE(STRING9):0,0\n'
    + 'FIELD:i_addr3_apt_num:TYPE(STRING5):0,0\n'
    + 'FIELD:i_addr3_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_addr3_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr3_city:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr3_county:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr3_country:TYPE(STRING3):0,0\n'
    + 'FIELD:i_addr3_type:TYPE(STRING3):0,0\n'
    + 'FIELD:count_addr_in:TYPE(STRING3):0,0\n'
    + 'FIELD:count_addr_used:TYPE(STRING3):0,0\n'
    + 'FIELD:count_vehicle_in:TYPE(STRING3):0,0\n'
    + 'FIELD:count_vehicle_used:TYPE(STRING3):0,0\n'
    + 'FIELD:vin_d_code:TYPE(STRING1):0,0\n'
    + 'FIELD:jua_ltr_code:TYPE(STRING1):0,0\n'
    + 'FIELD:prc_founds:TYPE(STRING3):0,0\n'
    + 'FIELD:addit_driver_reported:TYPE(STRING3):0,0\n'
    + 'FIELD:prior_inquiry_found:TYPE(STRING3):0,0\n'
    + 'FIELD:dd_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:policy_type:TYPE(STRING2):0,0\n'
    + 'FIELD:policy_number:TYPE(STRING20):0,0\n'
    + 'FIELD:inq_hist_claims:TYPE(STRING3):0,0\n'
    + 'FIELD:count_claims_found:TYPE(STRING6):0,0\n'
    + 'FIELD:count_claims_reported:TYPE(STRING6):0,0\n'
    + 'FIELD:risk_claims:TYPE(STRING6):0,0\n'
    + 'FIELD:insrd_claims:TYPE(STRING6):0,0\n'
    + 'FIELD:subject_claims:TYPE(STRING6):0,0\n'
    + 'FIELD:vin_claims:TYPE(STRING6):0,0\n'
    + 'FIELD:did_count:TYPE(STRING3):0,0\n'
    + 'FIELD:requestor_type:TYPE(STRING1):0,0\n'
    + 'FIELD:test_prod_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:iso_vm:TYPE(STRING10):0,0\n'
    + 'FIELD:line_id:TYPE(STRING10):0,0\n'
    + 'FIELD:inquiry_history_records_added:TYPE(STRING3):0,0\n'
    + 'FIELD:processing_comments:TYPE(STRING40):0,0\n'
    + 'FIELD:record_version:TYPE(STRING5):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING20):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING1):0,0\n'
    + 'FIELD:billing_type_id:TYPE(STRING3):0,0\n'
    + 'FIELD:price:TYPE(STRING27):0,0\n'
    + 'FIELD:currency:TYPE(STRING3):0,0\n'
    + 'FIELD:pricing_error_code:TYPE(STRING11):0,0\n'
    + 'FIELD:free:TYPE(STRING3):0,0\n'
    + 'FIELD:record_count:TYPE(STRING11):0,0\n'
    + 'FIELD:result_format:TYPE(STRING9):0,0\n'
    + 'FIELD:report_options:TYPE(STRING10):0,0\n'
    + 'FIELD:transaction_code:TYPE(STRING11):0,0\n'
    + 'FIELD:return_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:request_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:order_status_code:TYPE(STRING11):0,0\n'
    + 'FIELD:product_line:TYPE(STRING3):0,0\n'
    + 'FIELD:login_history_id:TYPE(STRING11):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:response_time:TYPE(STRING12):0,0\n'
    + 'FIELD:data_enhancement_response_time:TYPE(STRING12):0,0\n'
    + 'FIELD:hov_response_time:TYPE(STRING12):0,0\n'
    + 'FIELD:add_response_time:TYPE(STRING12):0,0\n'
    + 'FIELD:real_prop_response_time:TYPE(STRING12):0,0\n'
    + 'FIELD:safe_scan_response_time:TYPE(STRING12):0,0\n'
    + 'FIELD:deltabase_subj_response_time:TYPE(STRING12):0,0\n'
    + 'FIELD:deltabase_claim_response_time:TYPE(STRING12):0,0\n'
    + 'FIELD:roxie_response_time:TYPE(STRING12):0,0\n'
    + 'FIELD:soap_call_error_msg:TYPE(STRING40):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING40):0,0\n'
    + 'FIELD:batch_job_id:TYPE(STRING11):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(STRING11):0,0\n'
    + 'FIELD:add_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:add_reported:TYPE(STRING11):0,0\n'
    + 'FIELD:hh_add_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:hh_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:hh_vin_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:overage_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:subj_add_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:subj_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:subj_reported:TYPE(STRING11):0,0\n'
    + 'FIELD:vin_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:vin_plus_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:vin_plus_reported:TYPE(STRING11):0,0\n'
    + 'FIELD:vin_reported:TYPE(STRING11):0,0\n'
    + 'FIELD:real_prop_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:secondary_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:verbal_pos_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:agent_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:uw_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:clue_prop_billed:TYPE(STRING11):0,0\n'
    + 'FIELD:clue_prop_recs_b:TYPE(STRING11):0,0\n'
    + 'FIELD:clue_prop_recs_d:TYPE(STRING11):0,0\n'
    + 'FIELD:is_active:TYPE(STRING4):0,0\n'
    + 'FIELD:user_added:TYPE(STRING60):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING60):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING20):0,0\n'
    + 'FIELD:surcharge_possible:TYPE(STRING6):0,0\n'
    + 'FIELD:potentialcorruption:TYPE(STRING1):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;