EXPORT Layout_Source := RECORD
  unsigned4 batch_job_id;
  unsigned4 batch_seq_number;
  string4 transaction_type;
  string request_data{blob, maxlength(2000000)};
  string response_data{blob, maxlength(3000000)};
  string9 request_format;
  string9 response_format;
  string30 user_added;
  string22 date_added;
  string9 return_node_id;
  string9 broker_node_id;
  string2 handling_option;
 END;
