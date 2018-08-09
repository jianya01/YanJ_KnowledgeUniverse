IMPORT _Control;

layout_veh_info := RECORD
   unsigned2 year_make;
   string10 make;
   string10 model;
   boolean title;
   string25 vin;
   string2 orig_state;
   string2 source_code;
  END;

raw_did_layout := RECORD
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
 
 
blankDataset := dataset([], raw_did_layout);

fileName := '~thor_data400::key::vehiclev2::bocashell_did_qa';

raw_did := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	   INDEX(blankDataset, {did}, {blankDataset}, fileName),
	   JOIN(DISTRIBUTE(INDEX(blankDataset, {did}, {blankDataset}, fileName), HASH64((UNSIGNED8)DID)), DISTRIBUTE(_Control.LexIDFilterSet(LexID > 0), HASH64(LexID)), (UNSIGNED8)LEFT.DID = RIGHT.LexID, TRANSFORM(LEFT), LOCAL));
// raw_did := INDEX(blankDataset, {did}, {blankDataset}, fileName);
 
 
did_layout := RECORD
  unsigned6 did;
  string30 vehicle_key;
  string15 iteration_key;
  string15 sequence_key;
  unsigned1 current_count;
  unsigned1 historical_count;
	unsigned2 year_make;
	string10 make;
	string10 model;
	boolean title;
	string25 vin;
	string2 orig_state;
	string2 source_code;
	unsigned1 veh; //Track whether record comes from Vehicle1, Vehicle2, or Vehicle3
  unsigned8 __internal_fpos__;
 END;
 
did_layout SplitVeh1(raw_did l) := TRANSFORM
	SELF.year_make := l.vehicle1.year_make;
	SELF.make := l.vehicle1.make;
	SELF.model := l.vehicle1.model;
	SELF.title := l.vehicle1.title;
	SELF.vin := l.vehicle1.vin;
	SELF.orig_state := l.vehicle1.orig_state;
	SELF.source_code := l.vehicle1.source_code;
	SELF.veh := 1;
	SELF := l;
END;

did_layout SplitVeh2(raw_did l) := TRANSFORM
	SELF.year_make := l.vehicle2.year_make;
	SELF.make := l.vehicle2.make;
	SELF.model := l.vehicle2.model;
	SELF.title := l.vehicle2.title;
	SELF.vin := l.vehicle2.vin;
	SELF.orig_state := l.vehicle2.orig_state;
	SELF.source_code := l.vehicle2.source_code;
	SELF.veh := 2;
	SELF := l;
END;

did_layout SplitVeh3(raw_did l) := TRANSFORM
	SELF.year_make := l.vehicle3.year_make;
	SELF.make := l.vehicle3.make;
	SELF.model := l.vehicle3.model;
	SELF.title := l.vehicle3.title;
	SELF.vin := l.vehicle3.vin;
	SELF.orig_state := l.vehicle3.orig_state;
	SELF.source_code := l.vehicle3.source_code;
	SELF.veh := 3;
	SELF := l;
END;

Veh1 := PROJECT(raw_did, SplitVeh1(LEFT));
Veh2 := PROJECT(raw_did, SplitVeh2(LEFT));
Veh3 := PROJECT(raw_did, SplitVeh3(LEFT));

EXPORT did := veh1+veh2+veh3;