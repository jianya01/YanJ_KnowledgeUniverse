﻿EXPORT Layout_Source := RECORD
  string20 transaction_id;
  integer4 product_id;
  string22 date_added;
  string1 service_type;
  string20 special_billing_id;
  string4 report_code;
  integer4 customer_number;
  string9 order_point_company_number;
  string60 full_quote_back;
  string20 i_date_ordered;
  integer3 count_person_in;
  integer3 count_person_used;
  string9 i_addr1_house_num;
  string5 i_addr1_apt_num;
  string20 i_addr1_line;
  string2 i_addr1_state;
  string10 i_addr1_zip;
  string50 i_addr1_city;
  string50 i_addr1_county;
  string3 i_addr1_country;
  integer3 i_addr1_type;
  string9 i_addr2_house_num;
  string5 i_addr2_apt_num;
  string20 i_addr2_line;
  string2 i_addr2_state;
  string10 i_addr2_zip;
  string50 i_addr2_city;
  string50 i_addr2_county;
  string3 i_addr2_country;
  integer3 i_addr2_type;
  string20 i_addr3_line;
  string9 i_addr3_house_num;
  string5 i_addr3_apt_num;
  string2 i_addr3_state;
  string10 i_addr3_zip;
  string50 i_addr3_city;
  string50 i_addr3_county;
  string3 i_addr3_country;
  integer3 i_addr3_type;
  integer3 count_addr_in;
  integer3 count_addr_used;
  integer3 count_vehicle_in;
  integer3 count_vehicle_used;
  string1 vin_d_code;
  string1 jua_ltr_code;
  unsigned3 prc_founds;
  unsigned3 addit_driver_reported;
  integer3 prior_inquiry_found;
  string1 dd_flag;
  string20 policy_number;
  integer3 inq_hist_claims;
  integer3 count_claims_found;
  integer3 count_claims_reported;
  string1 requestor_type;
  string1 test_prod_indicator;
  string10 iso_vm;
  string10 line_id;
  unsigned3 inquiry_history_records_added;
  string40 processing_comments;
  real8 record_version;
  string20 reference_number;
  string2 processing_status;
  integer3 billing_type_id;
  real8 price;
  integer3 currency;
  integer3 pricing_error_code;
  integer3 free;
  real8 record_count;
  string20 result_format;
  string255 report_options;
  integer3 transaction_code;
  string9 return_node_id;
  string9 request_node_id;
  integer3 order_status_code;
  string3 product_line;
  integer3 login_history_id;
  string20 ip_address;
  string22 response_time;
  string22 esp_method;
  integer3 batch_job_id;
  integer3 batch_seq_number;
  integer3 is_active;
  string30 user_added;
  string30 user_changed;
  string30 date_changed;
 END;