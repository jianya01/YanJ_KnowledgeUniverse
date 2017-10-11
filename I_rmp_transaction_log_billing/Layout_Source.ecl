EXPORT Layout_Source := RECORD
  string20 transaction_id;
  string20 billed_report_code;
  integer4 position;
  decimal18_6 amount;
  string10 billing_id;
  integer4 transaction_code;
  integer4 account_id;
  string19 transaction_date_added;
  string19 date_added;
  string30 user_added;
  integer1 is_active;
  string19 date_changed;
  string30 user_changed;
  integer4 pricing_error_code;
 END;
