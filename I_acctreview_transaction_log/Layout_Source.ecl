﻿EXPORT Layout_Source := RECORD
  string20 transaction_id;
  integer4 product_id;
  string20 reference_number;
  string3 status;
  string1 reorder_status;
  string22 review_date;
  string20 i_person_first_name;
  string20 i_person_last_name;
  string20 i_person_middle_name;
  string5 i_person_name_suffix;
  string90 i_addr_line;
  string50 i_addr_city;
  string2 i_addr_state;
  string10 i_addr_zip;
  string4 i_addr_zip_ext;
  string9 i_person_ssn;
  string8 i_person_dob;
  integer4 customer_number;
  string3 vendor;
  string15 member_number;
  string20 i_spouse_first_name;
  string20 i_spouse_last_name;
  string20 i_spouse_middle_name;
  string5 i_spouse_name_suffix;
  string60 login_id;
  integer3 is_active;
  string30 user_added;
  string30 user_changed;
  string22 date_added;
  string30 date_changed;
 END;
