EXPORT Layout_Source := RECORD
  string16 transaction_id;
  string4 sequence_smd;
  string1 person_type;
  string1 extension_type;
  string4 sequence;
  string100 textvalue{xpath('value')};
  string20 date_added;
 END;
