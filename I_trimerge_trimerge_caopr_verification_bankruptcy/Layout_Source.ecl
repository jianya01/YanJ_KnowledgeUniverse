EXPORT Layout_Source := RECORD
  integer4 verification_id;
  string50 debtor_name;
  string200 debtor_address;
  string20 debtor_ssn;
  string50 bankruptcy_petition_number;
  string19 file_date;
  integer1 bankruptcy_type;
  integer1 is_voluntary;
  string150 status;
  string19 released_date;
  string50 released_document_number;
  string19 date_added;
  string30 user_added;
  string19 date_changed;
  string30 user_changed;
 END;
