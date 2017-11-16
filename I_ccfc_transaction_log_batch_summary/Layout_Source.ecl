EXPORT Layout_Source := RECORD
  integer4 batch_job_id;
  integer4 product_id;
  string19 start_time;
  string19 end_time;
  string20 total_process_time;
  string9 account;
  integer4 total_order;
  integer4 hits;
  integer4 no_hits;
  integer4 errors;
  string19 date_added;
 END;
