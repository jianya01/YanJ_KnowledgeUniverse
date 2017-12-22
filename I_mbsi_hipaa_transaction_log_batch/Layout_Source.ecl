EXPORT Layout_Source := RECORD 
  integer4 batch_job_id,
  integer4 batch_seq_number,
  integer1 type,
  string   request_data{BLOB},
  string   response_data{BLOB},
  string9  request_format,
  string9  response_format,
  string30 user_added,
  string19 date_added 
  END;
