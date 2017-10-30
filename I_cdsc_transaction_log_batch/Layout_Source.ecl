EXPORT Layout_Source := RECORD
  string20 batch_job_id;
  string16 batch_seq_number;
  string4 transaction_type;
  string request_data{blob, maxlength(2000000)};
  string response_data{blob, maxlength(3000000)};
  string9 request_format;
  string9 response_format;
  string8 user_added;
  string22 date_added;
 END;
