lay_did_qa:= RECORD
  unsigned6 append_did;
  boolean is_minor;
  string30 vehicle_key;
  string15 iteration_key;
  string15 sequence_key;
  unsigned8 __internal_fpos__;
 END;

DQ_Base := DATASET([], lay_did_qa);

EXPORT did_qa := INDEX(DQ_Base, 
							 {append_did,is_minor},
							 {DQ_Base}, '~thor_data400::key::vehiclev2::did_qa');