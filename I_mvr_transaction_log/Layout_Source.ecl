﻿EXPORT Layout_Source := RECORD
  string20 transaction_id;
  integer4 product_id;
  string20 reference_number;
  string22 date_added;
  string4 report_code;
  string2 state_postal_code;
  string6 account_base;
  string3 account_suffix;
  integer4 account_id;
  integer4 customer_number;
  string23 drivers_license_number;
  string7 dfs_number;
  string60 full_quote_back;
  string5 name_prefix;
  string20 last_name;
  string20 first_name;
  string20 middle_name;
  string5 name_suffix;
  real8 record_version;
  string8 dob;
  string20 special_billing_id;
  string2 processing_status;
  string2 report_usage_code;
  integer3 billing_type_id;
  string4 billing_report_code;
  real8 price;
  integer3 pricing_error_code;
  integer3 free;
  string9 request_format;
  string10 result_format;
  string10 result_fullfilling_product;
  string512 report_options;
  integer3 transaction_code;
  string9 return_node_id;
  string9 request_node_id;
  string22 order_received_date;
  string22 result_returned_date;
  integer3 order_status_code;
  integer3 login_history_id;
  string20 ip_address;
  string22 response_time;
  string20 esp_method;
  integer3 batch_job_id;
  integer3 batch_seq_number;
  integer3 is_migrated;
  integer3 is_active;
  string30 user_added;
  string30 user_changed;
  string22 date_changed;
 END;
