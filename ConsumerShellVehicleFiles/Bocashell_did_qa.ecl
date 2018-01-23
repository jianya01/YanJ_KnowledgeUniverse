layout_veh_info := RECORD
   unsigned2 year_make;
   string10 make;
   string10 model;
   boolean title;
   string25 vin;
   string2 orig_state;
   string2 source_code;
  END;

lay_bocashell_did_qa:= RECORD
  unsigned6 did;
  string30 vehicle_key;
  string15 iteration_key;
  string15 sequence_key;
  unsigned1 current_count;
  unsigned1 historical_count;
  layout_veh_info vehicle1;
  layout_veh_info vehicle2;
  layout_veh_info vehicle3;
  unsigned8 __internal_fpos__;
 END;

BSDQ_Base := DATASET([], lay_bocashell_did_qa);

EXPORT bocashell_did_qa := INDEX(BSDQ_Base, 
							 {did},
							 {BSDQ_Base}, '~thor_data400::key::vehiclev2::bocashell_did_qa');