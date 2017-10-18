EXPORT Layout_Source := RECORD
  string60 transaction_id;
  integer4 sequence;
  string4 score_model;
  string1 score_model_version;
  string4 report_code;
  string6 processing_status;
  integer4 score;
  string4 reasoncode_01;
  string255 reasoncode_01_text;
  string4 reasoncode_02;
  string255 reasoncode_02_text;
  string4 reasoncode_03;
  string255 reasoncode_03_text;
  string4 reasoncode_04;
  string255 reasoncode_04_text;
  string19 date_added;
  string1 customer_input_flg;
END;