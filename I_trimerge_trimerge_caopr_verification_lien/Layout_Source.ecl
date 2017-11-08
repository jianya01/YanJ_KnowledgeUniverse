EXPORT Layout_Source := RECORD
  integer4 verification_id;
  string50 grantor_name;
  string200 grantor_address;
  string20 grantor_ssn;
  string100 grantee;
  integer1 document_type;
  string50 document_number;
  string19 file_date;
  decimal15_2 amount;
  string150 status;
  string19 satisfied_date;
  string50 satisfaction_document_number;
  string19 date_added;
  string30 user_added;
  string19 date_changed;
  string30 user_changed;
 END;
