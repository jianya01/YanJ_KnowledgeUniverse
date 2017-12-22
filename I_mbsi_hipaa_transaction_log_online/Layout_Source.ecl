EXPORT Layout_Source := RECORD 
  string20 transaction_id,
  integer1 type,
  string   request_data{BLOB},
  string   response_data{BLOB},
  string9  request_format,
  string9  response_format,
  string19 date_added 
  END;
