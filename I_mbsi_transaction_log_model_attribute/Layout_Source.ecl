EXPORT Layout_Source := RECORD
  string60 transaction_id;
  integer4 attribute_sequence;
  integer4 model_sequence;
  integer4 person_sequence;
  string6 processing_status;
  string256 attribute_source;
  string256 attribute_name;
  string256 attribute_value;
  unsigned8 lex_id;
  string4 model_id;
  string50 claim_number;
  string50 ambest_number;
  string50 policy_number;
  string19 date_added;
END;