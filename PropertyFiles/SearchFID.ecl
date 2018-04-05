IMPORT STD;

Base_Layout:= RECORD
 string12 ln_fares_id;
  string1 which_orig;
  string1 source_code_2;
  string1 source_code_1;
  unsigned3 dt_first_seen;
  unsigned3 dt_last_seen;
  unsigned3 dt_vendor_first_reported;
  unsigned3 dt_vendor_last_reported;
  string1 vendor_source_flag;
  string8 process_date;
  string2 source_code;
  string1 conjunctive_name_seq;
  string5 title;
  string20 fname;
  string20 mname;
  string20 lname;
  string5 name_suffix;
  string80 cname;
  string80 nameasis;
  string10 prim_range;
  string2 predir;
  string28 prim_name;
  string4 suffix;
  string2 postdir;
  string10 unit_desig;
  string8 sec_range;
  string25 p_city_name;
  string25 v_city_name;
  string2 st;
  string5 zip;
  string4 zip4;
  string4 cart;
  string1 cr_sort_sz;
  string4 lot;
  string1 lot_order;
  string2 dbpc;
  string1 chk_digit;
  string2 rec_type;
  string5 county;
  string10 geo_lat;
  string11 geo_long;
  string4 msa;
  string7 geo_blk;
  string1 geo_match;
  string4 err_stat;
  string10 phone_number;
  unsigned6 did;
  unsigned6 bdid;
  string9 app_ssn;
  string9 app_tax_id;
  unsigned8 persistent_record_id;
  unsigned6 dotid;
  unsigned2 dotscore;
  unsigned2 dotweight;
  unsigned6 empid;
  unsigned2 empscore;
  unsigned2 empweight;
  unsigned6 powid;
  unsigned2 powscore;
  unsigned2 powweight;
  unsigned6 proxid;
  unsigned2 proxscore;
  unsigned2 proxweight;
  unsigned6 seleid;
  unsigned2 selescore;
  unsigned2 seleweight;
  unsigned6 orgid;
  unsigned2 orgscore;
  unsigned2 orgweight;
  unsigned6 ultid;
  unsigned2 ultscore;
  unsigned2 ultweight;
  string2 ln_party_status;
  string6 ln_percentage_ownership;
  string2 ln_entity_type;
  string8 ln_estate_trust_date;
  string1 ln_goverment_type;
  integer2 xadl2_weight;
  string2 addr_ind;
  string1 best_addr_ind;
  unsigned6 addr_tx_id;
  string1 best_addr_tx_id;
  unsigned8 location_id;
  string1 best_locid;
  unsigned8 __internal_fpos__;
END;	

SourceCodeExpanded := RECORD
  Base_Layout;
  BOOLEAN PartyIsBuyerOrOwner;
	BOOLEAN PartyIsBorrower;
	BOOLEAN PartyIsSeller;
	BOOLEAN PartyIsCareOf;
	BOOLEAN OwnerAddress;
	BOOLEAN SellerAddress;
	BOOLEAN PropertyAddress;
	BOOLEAN BorrowerAddress;
END;

SourceCodeExpanded FillFields(Base_Layout l) := TRANSFORM
  SELF.PartyIsBuyerOrOwner := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'O', TRUE, FALSE);
	SELF.PartyIsBorrower := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'B', TRUE, FALSE);
	SELF.PartyIsSeller := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'S', TRUE, FALSE);
	SELF.PartyIsCareOf := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'C', TRUE, FALSE);
	SELF.OwnerAddress := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'O', TRUE, FALSE);
	SELF.SellerAddress := IF(STD.Str.ToUpperCase(l.source_code[2]) = 'S', TRUE, FALSE);
	SELF.PropertyAddress := IF(STD.Str.ToUpperCase(l.source_code[2]) = 'P', TRUE, FALSE);
	SELF.BorrowerAddress := IF(STD.Str.ToUpperCase(l.source_code[2]) = 'B', TRUE, FALSE);
  SELF := l;
END;

File_Base := DATASET([], Base_Layout); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank

EXPORT SearchFID := PROJECT(INDEX(File_Base, 
							 {ln_fares_id, which_orig, source_code_2, source_code_1},
							 {File_Base}, '~thor_data400::key::ln_propertyv2::fcra::qa::search.fid'),FillFields(LEFT));