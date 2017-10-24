EXPORT Layout_Source := RECORD
  integer4 report_view_log_id;
  string20 transaction_id;
  integer4 consumer_id;
  string2 state;
  string22 date_added;
  string30 user_added;
  string22 date_changed;
  string30 user_changed;
  string100 purpose;
 END;
