EXPORT Layout_Source := RECORD
  string transaction_id;
  string11 product_id;
  string20 reference_number;
  string19 date_added;
  string4 process_type;
  string8 processing_time;
  string10 source_code;
  string20 content_type;
  string content_data{blob};
 END;
