EXPORT Layout_Source := RECORD
  string20 transaction_id;
  string19 date_added;
  integer1 compression_type;
  string request_data{blob};
  string response_data{blob};
  string9 request_format;
  string9 response_format;
 END;

