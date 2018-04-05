﻿IMPORT STD;
layout_fares := RECORD
   string12 ln_fare_id;
  END;

Base_Layout:= RECORD
 unsigned6 did;
  string1 ad;
  boolean isrelat;
  unsigned4 seq;
  string1 property_status_applicant;
  string1 property_status_family;
  unsigned1 property_count;
  unsigned1 property_total;
  unsigned5 property_owned_purchase_total;
  unsigned2 property_owned_purchase_count;
  unsigned5 property_owned_assessed_total;
  unsigned2 property_owned_assessed_count;
  unsigned3 address_score;
  boolean house_number_match;
  boolean isbestmatch;
  unsigned4 unit_count;
  decimal5_2 geo12_fc_index;
  decimal5_2 geo11_fc_index;
  decimal5_2 fips_fc_index;
  unsigned1 source_count;
  string50 sources;
  boolean credit_sourced;
  boolean eda_sourced;
  boolean dl_sourced;
  boolean voter_sourced;
  boolean utility_sourced;
  boolean applicant_owned;
  boolean occupant_owned;
  boolean family_owned;
  boolean family_sold;
  boolean applicant_sold;
  boolean family_sale_found;
  boolean family_buy_found;
  boolean applicant_sale_found;
  boolean applicant_buy_found;
  unsigned1 naprop;
  unsigned4 purchase_date;
  unsigned4 built_date;
  unsigned4 purchase_amount;
  unsigned4 mortgage_amount;
  unsigned4 mortgage_date;
  string5 mortgage_type;
  string4 type_financing;
  string8 first_td_due_date;
  unsigned4 assessed_amount;
  unsigned4 assessed_total_value;
  unsigned4 date_first_seen;
  unsigned4 date_last_seen;
  string4 standardized_land_use_code;
  unsigned8 building_area;
  unsigned8 no_of_buildings;
  unsigned8 no_of_stories;
  unsigned8 no_of_rooms;
  unsigned8 no_of_bedrooms;
  unsigned8 no_of_baths;
  unsigned8 no_of_partial_baths;
  string3 garage_type_code;
  unsigned8 parking_no_of_cars;
  string5 style_code;
  string4 assessed_value_year;
  boolean hr_address;
  string100 hr_company;
  string10 prim_range;
  string2 predir;
  string28 prim_name;
  string4 addr_suffix;
  string2 postdir;
  string10 unit_desig;
  string8 sec_range;
  string25 city_name;
  string2 st;
  string5 zip5;
  string3 county;
  string7 geo_blk;
  string10 lat;
  string11 long;
  string5 census_age;
  string9 census_income;
  string9 census_home_value;
  string5 census_education;
  boolean full_match;
  boolean census_loose;
  string1 datasrce;
  unsigned4 purchase_date_by_did;
  unsigned4 sale_date_by_did;
  unsigned8 sale_price1;
  unsigned8 sale_date1;
  unsigned8 prev_purch_price1;
  unsigned8 prev_purch_date1;
  unsigned8 sale_price2;
  unsigned8 sale_date2;
  unsigned8 prev_purch_price2;
  unsigned8 prev_purch_date2;
  string20 fname;
  string20 lname;
  DATASET(layout_fares) fares;
  unsigned8 __internal_fpos__;
END;	

File_Base := DATASET([], Base_Layout); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank

ds1 := INDEX(File_Base, 
							 {did},
							 {File_Base}, '~thor_data400::key::ln_propertyv2::fcra::qa::did.ownership_v4');
							 
SourceCodeExpanded := RECORD
  Base_Layout - fares;
	string12 ln_fare_id;
  Boolean IsAssessment;
	Boolean IsDeed;
END;

SourceCodeExpanded FillFields(RECORDOF(ds1) l, layout_fares r) := TRANSFORM
  SELF.IsAssessment := IF(STD.Str.ToUpperCase(l.AD) = 'A', TRUE, FALSE);
	SELF.IsDeed := IF(STD.Str.ToUpperCase(l.AD) = 'D' OR STD.Str.ToUpperCase(l.AD) = 'M', TRUE, FALSE);
	SELF.ln_fare_id := r.ln_fare_id;
  SELF := l;
END;



EXPORT Ownership := NORMALIZE(ds1, LEFT.fares, FillFields(LEFT, RIGHT));