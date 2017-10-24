EXPORT Layout_Source := RECORD
  string36 record_id;
  string255 lookup_text;
  string20 transaction_id;
  string10 error_source;
  string10 transaction_date;
  string2 state_abbr;
  string content_data{blob};
  string19 date_added;
  string30 user_added;
 END;