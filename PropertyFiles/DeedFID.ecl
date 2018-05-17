﻿IMPORT STD, _Control;

Base_Layout:= RECORD
	string12 ln_fares_id;
  unsigned6 proc_date;
  string8 process_date;
  string1 vendor_source_flag;
  string1 current_record;
  string1 from_file;
  string5 fips_code;
  string2 state;
  string18 county_name;
  string1 record_type;
  string45 apnt_or_pin_number;
  string45 fares_unformatted_apn;
  string4 multi_apn_flag;
  string39 tax_id_number;
  string10 excise_tax_number;
  string1 buyer_or_borrower_ind;
  string80 name1;
  string2 name1_id_code;
  string80 name2;
  string2 name2_id_code;
  string2 vesting_code;
  string1 addendum_flag;
  string10 phone_number;
  string40 mailing_care_of;
  string70 mailing_street;
  string6 mailing_unit_number;
  string51 mailing_csz;
  string1 mailing_address_cd;
  string80 seller1;
  string2 seller1_id_code;
  string80 seller2;
  string2 seller2_id_code;
  string1 seller_addendum_flag;
  string70 seller_mailing_full_street_address;
  string6 seller_mailing_address_unit_number;
  string51 seller_mailing_address_citystatezip;
  string70 property_full_street_address;
  string6 property_address_unit_number;
  string51 property_address_citystatezip;
  string1 property_address_code;
  string2 legal_lot_code;
  string10 legal_lot_number;
  string7 legal_block;
  string7 legal_section;
  string7 legal_district;
  string7 legal_land_lot;
  string6 legal_unit;
  string30 legal_city_municipality_township;
  string50 legal_subdivision_name;
  string7 legal_phase_number;
  string10 legal_tract_number;
  string30 legal_sec_twn_rng_mer;
  string100 legal_brief_description;
  string20 recorder_map_reference;
  string1 complete_legal_description_code;
  string8 contract_date;
  string8 recording_date;
  string8 arm_reset_date;
  string20 document_number;
  string3 document_type_code;
  string20 loan_number;
  string10 recorder_book_number;
  string10 recorder_page_number;
  string19 concurrent_mortgage_book_page_document_number;
  string11 sales_price;
  string1 sales_price_code;
  string8 city_transfer_tax;
  string8 county_transfer_tax;
  string8 total_transfer_tax;
  string11 first_td_loan_amount;
  string11 second_td_loan_amount;
  string1 first_td_lender_type_code;
  string5 second_td_lender_type_code;
  string5 first_td_loan_type_code;
  string4 type_financing;
  string5 first_td_interest_rate;
  string8 first_td_due_date;
  string60 title_company_name;
  string3 partial_interest_transferred;
  string5 loan_term_months;
  string5 loan_term_years;
  string40 lender_name;
  string6 lender_name_id;
  string40 lender_dba_aka_name;
  string60 lender_full_street_address;
  string6 lender_address_unit_number;
  string41 lender_address_citystatezip;
  string4 assessment_match_land_use_code;
  string3 property_use_code;
  string1 condo_code;
  string1 timeshare_flag;
  string10 land_lot_size;
  string6 hawaii_tct;
  string4 hawaii_condo_cpr_code;
  string30 hawaii_condo_name;
  string1 filler_except_hawaii;
  string1 rate_change_frequency;
  string4 change_index;
  string15 adjustable_rate_index;
  string1 adjustable_rate_rider;
  string1 graduated_payment_rider;
  string1 balloon_rider;
  string1 fixed_step_rate_rider;
  string1 condominium_rider;
  string1 planned_unit_development_rider;
  string1 rate_improvement_rider;
  string1 assumability_rider;
  string1 prepayment_rider;
  string1 one_four_family_rider;
  string1 biweekly_payment_rider;
  string1 second_home_rider;
  string3 data_source_code;
  string1 main_record_id_code;
  string1 addl_name_flag;
  string1 prop_addr_propagated_ind;
  string3 ln_ownership_rights;
  string2 ln_relationship_type;
  string3 ln_buyer_mailing_country_code;
  string3 ln_seller_mailing_country_code;
  unsigned8 __internal_fpos__;
END;	


SourceCodeExpanded := RECORD
  Base_Layout;
END;

SourceCodeExpanded FillFields(Base_Layout l) := TRANSFORM
  SELF.document_number := STD.Str.Filter(l.document_number, '1234567890');
  SELF := l;
END;


File_Base := DATASET([], Base_Layout); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank

ds := PROJECT(INDEX(File_Base, 
							 {ln_fares_id, proc_date},
							 {File_Base}, '~thor_data400::key::ln_propertyv2::fcra::qa::deed.fid'), FillFields(LEFT));

EXPORT DeedFID := IF(COUNT(_Control.FaresFilterSet) <= 0, ds,
							 JOIN(DISTRIBUTE(ds, HASH64(ln_fares_id)), DISTRIBUTE(_Control.FaresFilterSet, HASH64(LNFaresID)), LEFT.ln_fares_id = RIGHT.LNFaresID, TRANSFORM(LEFT), LOCAL));