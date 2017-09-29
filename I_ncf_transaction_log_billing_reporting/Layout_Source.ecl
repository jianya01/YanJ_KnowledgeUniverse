﻿EXPORT Layout_Source := RECORD
  string20 transaction_id;
  integer4 product_id;
  string22 date_added;
  string60 end_user;
  string60 special_billing_id;
  string2 report_service_type;
  string4 eqx_report_code;
  string4 exp_report_code;
  string4 tran_report_code;
  string4 ln_report_code;
  string3 condition_code;
  string8 account_base;
  string3 account_suffix;
  integer4 account_id;
  integer4 consumer_number;
  integer4 customer_number;
  string60 i_full_quote_back;
  string10 i_date_ordered;
  string9 i_individual_ssn;
  string5 i_individual_name_prefix;
  string20 i_individual_last_name;
  string20 i_individual_first_name;
  string20 i_individual_middle_name;
  string5 i_individual_name_suffix;
  string8 i_individual_dob_age;
  string9 o_individual_ssn;
  string9 o_individual_vendor_ssn;
  string5 o_individual_name_prefix;
  string20 o_individual_last_name;
  string20 o_individual_first_name;
  string20 o_individual_middle_name;
  string5 o_individual_name_suffix;
  string8 o_individual_dob_age;
  string1 o_individual_processing_status;
  string8 o_individual_error_code;
  string9 i_spouse_ssn;
  string5 i_spouse_name_prefix;
  string20 i_spouse_last_name;
  string20 i_spouse_first_name;
  string20 i_spouse_middle_name;
  string5 i_spouse_name_suffix;
  string8 i_spouse_dob_age;
  string9 o_spouse_ssn;
  string9 o_spouse_vendor_ssn;
  string5 o_spouse_name_prefix;
  string20 o_spouse_last_name;
  string20 o_spouse_first_name;
  string20 o_spouse_middle_name;
  string5 o_spouse_name_suffix;
  string8 o_spouse_dob_age;
  string1 o_spouse_processing_status;
  string8 o_spouse_error_code;
  integer1 count_person_in;
  string10 o_house_num_current_addr;
  string2 o_quad_current_addr;
  string5 o_apt_current_addr;
  string40 o_street_name_current_addr;
  string2 o_street_type_current_addr;
  string2 o_state_current_addr;
  string40 o_city_current_addr;
  string10 o_zip_current_addr;
  string30 o_county_current_addr;
  string3 o_country_current_addr;
  string10 o_house_num_prior_addr;
  string2 o_quad_prior_addr;
  string5 o_apt_prior_addr;
  string40 o_street_name_prior_addr;
  string2 o_street_type_prior_addr;
  string2 o_state_prior_addr;
  string40 o_city_prior_addr;
  string10 o_zip_prior_addr;
  string30 o_county_prior_addr;
  string3 o_country_prior_addr;
  integer1 count_addr_in;
  string1 order_indicator;
  string1 test_prod_indicator;
  string2 report_usage_code;
  string2 type_of_business;
  string1 i_state_specific_account;
  string1 first_vendor;
  string1 second_vendor;
  string1 final_vendor;
  string1 vendor_switch_condition;
  integer4 dupe_keys_selected;
  string1 enhanced_ssn;
  string1 enhanced_dob;
  string2 override_score_type;
  string1 override_vendor;
  string2 override_state;
  string1 letter_indicator;
  string2 dupe_vendor_flag;
  string1 inquiry_single_order;
  string5 individual_beacon_score;
  string5 spouse_beacon_score;
  string2 score_type_indicator;
  integer1 carrier_cnt;
  decimal4_1 record_version;
  string14 reference_number;
  string14 original_reference_number;
  string1 bill_location_code;
  integer1 billing_type_id;
  decimal18_9 price;
  integer1 currency;
  integer4 pricing_error_code;
  integer1 free;
  string9 result_format;
  unsigned2 report_options;
  integer4 transaction_code;
  string9 return_node_id;
  string9 request_node_id;
  integer4 order_status_code;
  string3 product_line;
  integer4 login_history_id;
  string20 ip_address;
  decimal8_4 response_time;
  string40 esp_method;
  integer4 batch_job_id;
  integer4 batch_seq_number;
  integer1 is_active;
  string60 user_added;
  string60 user_changed;
  string22 date_changed;
  string2 vendor_to_bill;
  integer4 after_dup_order_status_code;
  string1 order_indicator_coded;
  string22 run_date;
  string22 input_start_date;
  string22 input_end_date;
  string4 billable_report_code;
  unsigned8 individual_lex_id;
  unsigned8 spouse_lex_id;
  string1 enhanced_fa;
 END;