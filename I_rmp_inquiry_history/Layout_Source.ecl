EXPORT Layout_Source := RECORD
  string transaction_id;
  string11 product_id;
  string19 date_added;
  string4 process_type;
  string8 processing_time;
  string20 source_code;
  string20 content_type;
  string20 version;
  string20 reference_number;
  string content_data{blob, maxlength(2000000)};
 END;