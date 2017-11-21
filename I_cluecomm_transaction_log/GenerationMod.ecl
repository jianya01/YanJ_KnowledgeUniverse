// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_cluecomm_transaction_log';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
  EXPORT spc_CONFIG := 'Config';
  EXPORT spc_FILEPREFIX := 'In_';
  EXPORT spc_FILENAME := 'Vault';
  EXPORT spc_INGESTSTATUS := '';
  EXPORT spc_HAS_TWOSTEP := FALSE;
  EXPORT spc_HAS_PARTITION := FALSE;
  EXPORT spc_HAS_FIELDTYPES := FALSE;
  EXPORT spc_HAS_INCREMENTAL := FALSE;
  EXPORT spc_HAS_ASOF := FALSE;
  EXPORT spc_HAS_NONCONTIGUOUS := TRUE;
  EXPORT spc_HAS_SUPERFILES := FALSE;
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_cluecomm_transaction_log\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:product_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:date_added:TYPE(STRING20):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING20):0,0\n'
    + 'FIELD:date_ordered:TYPE(STRING20):0,0\n'
    + 'FIELD:date_received:TYPE(STRING20):0,0\n'
    + 'FIELD:date_completed:TYPE(STRING20):0,0\n'
    + 'FIELD:search_type:TYPE(STRING2):0,0\n'
    + 'FIELD:secondary_report:TYPE(STRING1):0,0\n'
    + 'FIELD:secondary_lob:TYPE(STRING15):0,0\n'
    + 'FIELD:special_billing_id:TYPE(STRING20):0,0\n'
    + 'FIELD:account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:account_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:customer_number:TYPE(INTEGER8):0,0\n'
    + 'FIELD:bill_as:TYPE(STRING1):0,0\n'
    + 'FIELD:report_as:TYPE(STRING1):0,0\n'
    + 'FIELD:reporting_months:TYPE(INTEGER3):0,0\n'
    + 'FIELD:addl_reporting_months:TYPE(INTEGER3):0,0\n'
    + 'FIELD:bi_allowed_with_sb:TYPE(STRING2):0,0\n'
    + 'FIELD:bi_claims_found:TYPE(STRING2):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING1):0,0\n'
    + 'FIELD:processing_comments:TYPE(STRING40):0,0\n'
    + 'FIELD:count_business:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_individual:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_address:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_lob:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_prior_policy_number:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_prior_ins_carrier:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_claims_found:TYPE(INTEGER6):0,0\n'
    + 'FIELD:count_claims_loss_summ:TYPE(INTEGER6):0,0\n'
    + 'FIELD:count_claims_addl_open:TYPE(INTEGER6):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:billing_type:TYPE(STRING20):0,0\n'
    + 'FIELD:billing_type_id:TYPE(INTEGER3):0,0\n'
    + 'FIELD:billed_date:TYPE(STRING20):0,0\n'
    + 'FIELD:pricing_error_code:TYPE(INTEGER8):0,0\n'
    + 'FIELD:result_format:TYPE(STRING9):0,0\n'
    + 'FIELD:return_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:request_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:order_status_code:TYPE(STRING11):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:roxie_response_time:TYPE(DECIMAL7):0,0\n'
    + 'FIELD:response_time:TYPE(DECIMAL7):0,0\n'
    + 'FIELD:soap_call_error_msg:TYPE(STRING40):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING40):0,0\n'
    + 'FIELD:batch_job_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(INTEGER8):0,0\n'
    + 'FIELD:subj_billed:TYPE(INTEGER8):0,0\n'
    + 'FIELD:subj_reported:TYPE(INTEGER8):0,0\n'
    + 'FIELD:secondary_billed:TYPE(INTEGER8):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING20):0,0\n'
    + 'FIELD:user_added:TYPE(STRING60):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING60):0,0\n'
    + 'FIELD:potentialcorruption:TYPE(STRING1):0,0\n'
    + '\n'
    + '\n'
    + '\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
