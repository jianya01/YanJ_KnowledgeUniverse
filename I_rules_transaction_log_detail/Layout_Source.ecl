EXPORT Layout_Source := RECORD
  string60 transaction_id;
  string20 client_order_id;
  integer4 rules_product_id;
  string60 ruleplan_transaction_id;
  integer4 ruleplan_id;
  string19 date_added;
  integer1 sequence;
  integer4 product_id;
  string60 product_transaction_id;
  string12 product_transaction_id_type;
  string6 processing_status;
  string4 model_id;
  string1 duplicate_report;
 END;