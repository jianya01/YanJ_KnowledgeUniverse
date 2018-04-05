EXPORT Layout_Source := RECORD
  string transaction_id;
  string11 product_id;
  string19 date_added;
  string4 process_type;
  string8 processing_time;
  string20 vendor_code;
  string20 request_type;
  string20 product_version;
  string20 reference_number;
  string content_data{blob, maxlength(2000000)};
  string19 date_processed;
 END;

