﻿IMPORT _Control, KELBlackBox;

LayoutMarketMagnifier := RECORD
  unsigned8 file_seq;
  string11 uak;
  string15 uhk;
  string15 uik;
  unsigned8 lexid;
  unsigned8 lexhhid;
  unsigned2 xlink_weight;
  unsigned2 xlink_distance;
  unsigned2 xlink_score;
  string20 xlink_segmentation;
  unsigned1 source_code;
  string1 source1_flag;
  string1 source2_flag;
  string1 source3_flag;
  string1 source4_flag;
  string1 source5_flag;
  unsigned1 number_of_sources;
  string1 mailable_flag;
  unsigned2 exclusion_code;
  string10 header_ind;
  string8 dt_last_seen;
  unsigned1 name_ind;
  string15 first_name;
  string20 middle_name;
  string20 last_name;
  string6 name_suffix;
  string6 name_title;
  string25 p_city_name;
  string25 v_city_name;
  string1 cr_sort_sz;
  string2 fips_state;
  string10 geo_lat;
  string11 geo_long;
  string4 msa;
  string7 geo_blk;
  string1 geo_match;
  string25 address1;
  string25 address2;
  string28 city;
  string2 state;
  string5 zip;
  string4 zip4;
  string10 prim_range;
  string2 predir;
  string28 prim_name;
  string4 addr_suffix;
  string2 postdir;
  string10 unit_desig;
  string8 sec_range;
  string9 rr_umber;
  string9 rr_box;
  string2 ace_z4_record_type;
  string3 ace_county;
  string20 np_secaddr;
  string1 dpbc_check_digit;
  string2 dpbc;
  string4 carrier_rt_code;
  string1 trunc_flag;
  string1 dns_flag;
  string6 err_stat;
  string4 lot;
  string1 lot_order;
  string28 extraneous;
  string10 addr_numerics;
  string10 address_id;
  string1 address_quality_indicator;
  string3 county_code;
  string25 county_name;
  string9 latitude;
  string10 longitude;
  string1 level_latitude_longitude;
  string1 time_zone;
  unsigned8 uid;
  string1 phone_pander_flag;
  string10 unscrubbed_do_not_use_phone;
  string10 second_phone_number;
  string1 special_usage_flag;
  string2 pander_source_flags;
  string1 dwelling_unit_size;
  string1 dwelling_type_drv;
  string3 homeowner_probability_model;
  string1 ownership_code_drv;
  string1 income_code_drv;
  string1 move_update_code;
  string8 move_update_date;
  string1 recipient_reliability_code;
  string1 cppm_mail_order_buyer;
  string1 dma_pander_flag;
  string1 home_business;
  unsigned2 lor_drv_numeric;
  string1 number_of_persons_in_living_unit;
  string1 number_of_adults_in_household;
  string1 rural_urban_county_size_code;
  string8 last_activity_date_of_lu;
  unsigned8 pid;
  string1 name_type;
  string2 ethnic_detail_code;
  string1 ethnic_religion_code;
  string2 ethnic_language_pref;
  string1 ethnic_grouping_code;
  string2 ethnic_country_of_origin_code;
  string2 p1_occupation_group_v2;
  string1 gender_code_drv;
  string8 exact_dob_drv_orig;
  string2 estimated_age_p1;
  string2 exact_age_p1;
  string1 combined_age_indicator;
  unsigned2 age_in_years_drv_numeric;
  string2 education_p1;
  string1 marital_status_confidence_flag;
  string1 marital_code_drv;
  string2 occupation_code;
  string1 business_owner_p1;
  string1 presence_of_email;
  string30 email_id_number;
  string1 number_children_drv;
  string1 mor_bank_upscale_merch_buyer;
  string1 mor_bank_male_merch_buyer;
  string1 mor_bank_female_merch_buyer;
  string1 mor_bank_crafts_hobb_merch_buyer;
  string1 mor_bank_gardening_farming_buyer;
  string1 mor_bank_book_buyer;
  string1 mor_bank_collect_special_foods_buyer;
  string1 mor_bank_gifts_and_gadgets_buyer;
  string1 mor_bank_general_merch_buyer;
  string1 mor_bank_family_and_general_magazine;
  string1 mor_bank_female_oriented_magazine;
  string1 mor_bank_male_sports_magazine;
  string1 mor_bank_religious_magazine;
  string1 mor_bank_gardening_farming_magazine;
  string1 mor_bank_culinary_interests_magazine;
  string1 mor_bank_health_and_fitness_magazine;
  string1 mor_bank_do_it_yourselfers;
  string1 mor_bank_news_and_financial;
  string1 mor_bank_photography;
  string1 mor_bank_opportunity_seekers_and_ce;
  string1 mor_bank_religious_contributor;
  string1 mor_bank_political_contributor;
  string1 mor_bank_health_and_institution_contributor;
  string1 mor_bank_general_contributor;
  string1 mor_bank_miscellaneous;
  string1 mor_bank_odds_and_ends;
  string3 mor_bank_deduped_category_hit_count;
  string3 mor_bank_non_deduped_category_hit_count;
  string4 home_purch_price;
  string8 home_purch_date_char;
  string4 year_built_fam2;
  string4 home_land_value;
  string2 home_property_ind;
  string4 enh_mktval_drv_orig;
  string3 estimated_current_home_value_rest;
  string1 year_built_new_confidence_flag;
  string4 eff_year_built;
  string1 auto_in_the_market_new;
  string1 auto_in_the_market_used;
  string1 auto_in_the_market_used_0_5;
  string1 auto_in_the_market_used_6_10;
  string1 auto_in_the_market_used_11_plus;
  string1 donates_to_environmental_causes;
  string1 contributes_to_charities;
  string1 presence_of_credit_card;
  string1 presence_of_premium_credit_card;
  string1 interest_in_reading;
  string1 computer_owner;
  string3 mosaic_household_2011;
  string3 mosaic_z4_2011;
  string1 mosaic_household_global_2011;
  string1 mosaic_z4_global_2011;
  string1 household_composition;
  string5 core_based_statistical_areas_cbsa;
  string1 core_based_statistical_area_type;
  string4 home_total_value;
  string4 total_tax;
  string4 home_improvement_value;
  string4 home_land_square_footage;
  string4 home_land_front_footage;
  string4 home_land_depth_footage;
  string3 home_stories;
  string1 home_swimming_pool_indicator;
  string2 home_total_rooms;
  string3 home_building_square_footage;
  string2 home_bedrooms;
  string3 home_bath;
  string3 home_base_square_footage;
  string1 home_fireplaces;
  string1 home_floor_cover_indicator;
  string1 home_heat_indicator;
  string1 home_air_conditioning;
  string2 home_exterior_wall_type;
  string2 home_building_construction_indicator;
  string1 interest_in_gardening;
  string1 interest_in_automotive;
  string1 interest_in_gourmet_cooking;
  string1 home_decorating_furnishing;
  string1 dog_enthusiasts;
  string1 cat_enthusiast;
  string1 pet_enthusiast;
  string1 interest_in_travel;
  string1 interest_in_fitness;
  string1 interest_in_the_outdoors;
  string1 interest_in_sports;
  string1 investor_flag;
  string1 purchased_through_the_mail;
  string1 cruise_enthusiasts;
  string1 invest_in_mutual_funds_annuities;
  string1 internet_online_subscriber;
  string1 purchase_via_on_line;
  string1 interest_in_domestic_travel;
  string1 interest_in_foreign_travel;
  string1 type_of_purchase;
  string4 oo_home_mortgage_amt;
  string25 mortgage_lender_name;
  string1 mortgage_rate_type;
  string4 mortgage_term_in_months;
  string1 home_mortgage_type;
  string3 down_payment_pct;
  string8 deed_date_of_equity_loan;
  string4 equity_amount_in_thousands;
  string25 equity_lender_name;
  string1 equity_rate_type;
  string4 equity_term;
  string1 equity_loan_type;
  string8 deed_date_of_refi_loan;
  string4 refi_mortgage_amt;
  string25 refinance_lender_name;
  string1 refinance_rate_type;
  string4 refinance_term_in_months;
  string1 refinance_loan_type;
  string5 zip_code2;
  string2 fips_1990_state_code;
  string10 primary_house_number;
  string2 street_pre_directional;
  string28 street_name2;
  string4 street_suffix2;
  string2 street_post_directional;
  string8 secondary_unit_designator_number;
  string6 secondary_unit_designator;
  string28 city_name2;
  string1 type_of_investment;
  string8 date_of_warranty_deed;
  string4 purchase_amount_in_thousands;
  string1 type_of_purchase2;
  string4 mortgage_amount_in_thousands2;
  string25 home_lender_name_old;
  string1 mortgage_rate_type2;
  string4 dl_cppm_mortgage_term;
  string1 i_home_mortgage_type;
  string8 deed_date_of_equity_loan2;
  string4 equity_amount_in_thousands2;
  string25 equity_lender_name2;
  string1 equity_rate_type2;
  string4 equity_term_in_months;
  string1 equity_loan_type2;
  string8 deed_date_of_refinance_loan2;
  string4 refinance_amount_in_thousands2;
  string25 refinance_lender_name2;
  string1 refinance_rate_type2;
  string4 refinance_term;
  string1 refinance_loan_type2;
  string1 landlord_flag;
  string6 mortgage_home_purchase_estimated_current_mortgage_amount_new;
  string6 mortgage_home_purchase_estimated_current_monthly_mortgage_payment_new;
  string1 enh_ltv_drv_confidence_flag;
  string3 enh_ltv_drv;
  string6 mortgage_home_purchase_estimated_available_equity_new;
  string2 children_0_18_v3;
  string2 children_0_3_v3;
  string3 children_0_3_score_v3;
  string1 children_0_3_gender;
  string2 children_4_6_v3;
  string3 children_4_6_score_v3;
  string1 children_4_6_gender;
  string2 children_7_9_v3;
  string3 children_7_9_score_v3;
  string1 children_7_9_gender;
  string2 children_10_12_v3;
  string3 children_10_12_score_v3;
  string1 children_10_12_gender;
  string2 children_13_15_v3;
  string3 children_13_15_score_v3;
  string1 children_13_15_gender;
  string2 children_16_18_v3;
  string3 children_16_18_score_v3;
  string1 children_16_18_gender;
  string7 census_2010_tract_and_block_code;
  string4 census_median_age_2010;
  string4 census_pct_population_age_under_18_2010;
  string4 census_pct_population_age_18plus_2010;
  string4 census_pct_population_age_65plus_2010;
  string4 census_pct_white_only_2010;
  string4 census_pct_black_only_2010;
  string4 census_pct_asian_only_2010;
  string4 census_pct_hispanic_2010;
  string4 census_persons_per_household_2010;
  string3 census_average_household_size_2010;
  string4 census_pct_households_married_couples_2010;
  string4 census_pct_households_with_children_2010;
  string4 census_married_couple_families_with_any_person_under18_2010;
  string4 census_married_couple_families_wo_any_person_under18_2010;
  string4 census_pct_households_spanish_speaking_2010;
  string4 census_pct_25plus_median_years_school_completed_2010;
  string4 census_pct_25plus_25plus_with_a_degree_2010;
  string7 census_median_housing_value_2010;
  string4 census_units_in_structure_mobile_home_2010;
  string2 census_median_dwelling_age_2010;
  string4 census_pct_dwelling_units_owner_occupied_2010;
  string4 census_pct_dwelling_units_renter_occupied_2010;
  string4 cape_ispsa;
  string1 cape_ispsa_decile_within_state;
  string1 census_wealth_rating_2010;
  string6 census_state_median_family_income_2010;
  string3 census_income_index_2010;
  string1 cfi_household_deposits_score;
  string1 cfi_investable_assets_score;
  string1 cfi_investment_balances_score;
  string1 cfi_mortgage_refinance_score;
  string1 cfi_net_asset_score;
  string1 truetouch_buyamerican;
  string1 truetouch_showmethemoney;
  string1 truetouch_gowiththeflow;
  string1 truetouch_notimelikethepresent;
  string1 truetouch_nevershowupemptyhanded;
  string1 truetouch_ontheroadagain;
  string1 truetouch_lookatmenow;
  string1 truetouch_stopandsmelltheroses;
  string1 truetouch_workhardplayhard;
  string1 truetouch_apennysavedapennyearned;
  string1 truetouch_itsallinthename;
  string1 truetouch_broadcastcabletv;
  string1 truetouch_directmail;
  string1 truetouch_email;
  string1 truetouch_internetradio;
  string1 truetouch_mobiledisplay;
  string1 truetouch_mobilevideo;
  string1 truetouch_onlinevideo;
  string1 truetouch_onlinedisplay;
  string1 truetouch_onlinestreamingtv;
  string1 truetouch_satelliteradio;
  string1 truetouch_brickmortar;
  string1 truetouch_onlinemidhigh;
  string1 truetouch_etailer;
  string1 truetouch_onlinediscount;
  string1 truetouch_onlinebidmrktplc;
  string10 best_phone;
  unsigned2 marketing_risk_index;
  string10 curraddrmedianincome;
  string5 inputaddrcountyindex;
  string2 liensunreleasedcount;
  string2 numsrcsconfirmidaddr;
  string2 prevaddrconfscore;
  string10 prevaddrmedianhomeval;
  string1 ssnissued;
  string2 ssnperid;
  string1 wealthindex;
  string1 donotmail;
  string8 mostrecentunreldate_m;
  string8 highissuedate_m;
  string1 mostrecentbankrupt_i;
  string1 input_pre_curr_addrmatch;
  string4 timesincesubjectphone1stseen;
  string2 addrperssn;
  string1 addrstability_012;
  string2 lastname36;
  string1 inputaddrdwelltype;
  string2 ssnperaddr;
  string1 inputaddrfamilyowned;
  string4 timesinceprevaddrdate1stseen;
  string1 inputaddractivephonelist;
  string2 idpersfduaddr;
  string1 prevaddractivephonelist;
  string10 prevaddrmedianincome;
  string3 addrs_15yr;
  string5 avg_lres;
  string1 bankrupt;
  string3 crim_rel_within25miles;
  string1 income_level;
  string5 inq_count24;
  string5 inq_highriskcredit;
  string5 inq_mortgage;
  string5 paw_business_count;
  string1 rc_altlname1_flag;
  string3 rel_educationunder8_count;
  string3 ssns_per_addr;
  string3 unrel_liens;
  string20 add1_avm_automated_valuation_2;
  string3 attr_eviction_count60;
  string3 attr_total_number_derogs;
  string6 avg_mo_per_addr;
  string5 gong_did_phone_ct;
  string3 liens_historical_unreleased_ct;
  string13 property_owned_assessed_total;
  string3 rel_felony_count;
  string3 rel_incomeunder25_count;
  string3 rel_prop_owned_count;
  string1 presence_of_a_foreclosure;
  string2 v1_donotmail;
  string2 v1_verifiedprospectfound;
  string2 v1_verifiedname;
  string2 v1_verifiedssn;
  string2 v1_verifiedphone;
  string2 v1_verifiedcurrresmatchindex;
  string3 v1_prospecttimeonrecord;
  string3 v1_prospecttimelastupdate;
  string2 v1_prospectlastupdate12mo;
  string3 v1_prospectage;
  string2 v1_prospectgender;
  string2 v1_prospectmaritalstatus;
  string2 v1_prospectestimatedincomerange;
  string2 v1_prospectdeceased;
  string2 v1_prospectcollegeattending;
  string2 v1_prospectcollegeattended;
  string2 v1_prospectcollegeprogramtype;
  string2 v1_prospectcollegeprivate;
  string2 v1_prospectcollegetier;
  string2 v1_prospectbankingexperience;
  string2 v1_assetcurrowner;
  string2 v1_propcurrowner;
  string3 v1_propcurrownedcnt;
  string7 v1_propcurrownedassessedttl;
  string7 v1_propcurrownedavmttl;
  string3 v1_proptimelastsale;
  string3 v1_propeverownedcnt;
  string3 v1_propeversoldcnt;
  string3 v1_propsoldcnt12mo;
  string5 v1_propsoldratio;
  string3 v1_proppurchasecnt12mo;
  string2 v1_ppcurrowner;
  string3 v1_ppcurrownedcnt;
  string3 v1_ppcurrownedautocnt;
  string3 v1_ppcurrownedmtrcyclecnt;
  string3 v1_ppcurrownedaircrftcnt;
  string3 v1_ppcurrownedwtrcrftcnt;
  string3 v1_lifeevtimelastmove;
  string2 v1_lifeevnamechange;
  string2 v1_lifeevnamechangecnt12mo;
  string3 v1_lifeevtimefirstassetpurchase;
  string3 v1_lifeevtimelastassetpurchase;
  string3 v1_lifeeveverresidedcnt;
  string5 v1_lifeevlastmovetaxratiodiff;
  string2 v1_lifeevecontrajectory;
  string2 v1_lifeevecontrajectoryindex;
  string2 v1_rescurrownershipindex;
  string7 v1_rescurravmvalue;
  string7 v1_rescurravmvalue12mo;
  string5 v1_rescurravmratiodiff12mo;
  string7 v1_rescurravmvalue60mo;
  string5 v1_rescurravmratiodiff60mo;
  string5 v1_rescurravmcntyratio;
  string5 v1_rescurravmtractratio;
  string5 v1_rescurravmblockratio;
  string2 v1_rescurrdwelltype;
  string2 v1_rescurrdwelltypeindex;
  string2 v1_rescurrmortgagetype;
  string7 v1_rescurrmortgageamount;
  string3 v1_rescurrbusinesscnt;
  string2 v1_resinputownershipindex;
  string7 v1_resinputavmvalue;
  string7 v1_resinputavmvalue12mo;
  string5 v1_resinputavmratiodiff12mo;
  string7 v1_resinputavmvalue60mo;
  string5 v1_resinputavmratiodiff60mo;
  string5 v1_resinputavmcntyratio;
  string5 v1_resinputavmtractratio;
  string5 v1_resinputavmblockratio;
  string2 v1_resinputdwelltype;
  string2 v1_resinputdwelltypeindex;
  string2 v1_resinputmortgagetype;
  string7 v1_resinputmortgageamount;
  string3 v1_resinputbusinesscnt;
  string3 v1_crtreccnt;
  string3 v1_crtreccnt12mo;
  string3 v1_crtrectimenewest;
  string3 v1_crtrecfelonycnt;
  string3 v1_crtrecfelonycnt12mo;
  string3 v1_crtrecfelonytimenewest;
  string3 v1_crtrecmsdmeancnt;
  string3 v1_crtrecmsdmeancnt12mo;
  string3 v1_crtrecmsdmeantimenewest;
  string3 v1_crtrecevictioncnt;
  string3 v1_crtrecevictioncnt12mo;
  string3 v1_crtrecevictiontimenewest;
  string3 v1_crtreclienjudgcnt;
  string3 v1_crtreclienjudgcnt12mo;
  string3 v1_crtreclienjudgtimenewest;
  string7 v1_crtreclienjudgamtttl;
  string3 v1_crtrecbkrptcnt;
  string3 v1_crtrecbkrptcnt12mo;
  string3 v1_crtrecbkrpttimenewest;
  string2 v1_crtrecseverityindex;
  string2 v1_occproflicense;
  string2 v1_occproflicensecategory;
  string2 v1_occbusinessassociation;
  string3 v1_occbusinessassociationtime;
  string2 v1_occbusinesstitleleadership;
  string2 v1_interestsportperson;
  string3 v1_hhteenagermmbrcnt;
  string3 v1_hhyoungadultmmbrcnt;
  string3 v1_hhmiddleagemmbrcnt;
  string3 v1_hhseniormmbrcnt;
  string3 v1_hhelderlymmbrcnt;
  string3 v1_hhcnt;
  string2 v1_hhestimatedincomerange;
  string3 v1_hhcollegeattendedmmbrcnt;
  string3 v1_hhcollege2yrattendedmmbrcnt;
  string3 v1_hhcollege4yrattendedmmbrcnt;
  string3 v1_hhcollegegradattendedmmbrcnt;
  string3 v1_hhcollegeprivatemmbrcnt;
  string2 v1_hhcollegetiermmbrhighest;
  string3 v1_hhpropcurrownermmbrcnt;
  string3 v1_hhpropcurrownedcnt;
  string7 v1_hhpropcurravmhighest;
  string3 v1_hhppcurrownedcnt;
  string3 v1_hhppcurrownedautocnt;
  string3 v1_hhppcurrownedmtrcyclecnt;
  string3 v1_hhppcurrownedaircrftcnt;
  string3 v1_hhppcurrownedwtrcrftcnt;
  string3 v1_hhcrtrecmmbrcnt;
  string3 v1_hhcrtrecmmbrcnt12mo;
  string3 v1_hhcrtrecfelonymmbrcnt;
  string3 v1_hhcrtrecfelonymmbrcnt12mo;
  string3 v1_hhcrtrecmsdmeanmmbrcnt;
  string3 v1_hhcrtrecmsdmeanmmbrcnt12mo;
  string3 v1_hhcrtrecevictionmmbrcnt;
  string3 v1_hhcrtrecevictionmmbrcnt12mo;
  string3 v1_hhcrtreclienjudgmmbrcnt;
  string3 v1_hhcrtreclienjudgmmbrcnt12mo;
  string7 v1_hhcrtreclienjudgamtttl;
  string3 v1_hhcrtrecbkrptmmbrcnt;
  string3 v1_hhcrtrecbkrptmmbrcnt12mo;
  string3 v1_hhcrtrecbkrptmmbrcnt24mo;
  string3 v1_hhoccproflicmmbrcnt;
  string3 v1_hhoccbusinessassocmmbrcnt;
  string3 v1_hhinterestsportpersonmmbrcnt;
  string3 v1_raateenagemmbrcnt;
  string3 v1_raayoungadultmmbrcnt;
  string3 v1_raamiddleagemmbrcnt;
  string3 v1_raaseniormmbrcnt;
  string3 v1_raaelderlymmbrcnt;
  string3 v1_raahhcnt;
  string3 v1_raammbrcnt;
  string2 v1_raamedincomerange;
  string3 v1_raacollegeattendedmmbrcnt;
  string3 v1_raacollege2yrattendedmmbrcnt;
  string3 v1_raacollege4yrattendedmmbrcnt;
  string3 v1_raacollegegradattendedmmbrcnt;
  string3 v1_raacollegeprivatemmbrcnt;
  string3 v1_raacollegetoptiermmbrcnt;
  string3 v1_raacollegemidtiermmbrcnt;
  string3 v1_raacollegelowtiermmbrcnt;
  string3 v1_raapropcurrownermmbrcnt;
  string7 v1_raapropowneravmhighest;
  string7 v1_raapropowneravmmed;
  string3 v1_raappcurrownermmbrcnt;
  string3 v1_raappcurrownerautommbrcnt;
  string3 v1_raappcurrownermtrcyclemmbrcnt;
  string3 v1_raappcurrowneraircrftmmbrcnt;
  string3 v1_raappcurrownerwtrcrftmmbrcnt;
  string3 v1_raacrtrecmmbrcnt;
  string3 v1_raacrtrecmmbrcnt12mo;
  string3 v1_raacrtrecfelonymmbrcnt;
  string3 v1_raacrtrecfelonymmbrcnt12mo;
  string3 v1_raacrtrecmsdmeanmmbrcnt;
  string3 v1_raacrtrecmsdmeanmmbrcnt12mo;
  string3 v1_raacrtrecevictionmmbrcnt;
  string3 v1_raacrtrecevictionmmbrcnt12mo;
  string3 v1_raacrtreclienjudgmmbrcnt;
  string3 v1_raacrtreclienjudgmmbrcnt12mo;
  string7 v1_raacrtreclienjudgamtmax;
  string3 v1_raacrtrecbkrptmmbrcnt36mo;
  string3 v1_raaoccproflicmmbrcnt;
  string3 v1_raaoccbusinessassocmmbrcnt;
  string3 v1_raainterestsportpersonmmbrcnt;
  string3 score1;
  string15 scorename1;
  string2 reason1;
  string2 reason2;
  string2 reason3;
  string2 reason4;
  string2 reason5;
  string2 reason6;
  string1 arc_gender;
  string2 arc_age;
  string6 arc_dob;
  string1 arc_hhnbr;
  string1 arc_tot_males;
  string1 arc_tot_females;
  string1 arc_time_zone;
  string1 arc_daylight_savings;
  string10 arc_telephonenumber_1;
  string1 arc_dma_tps_dnc_flag_1;
  string10 arc_telephonenumber_2;
  string1 arc_dma_tps_dnc_flag_2;
  string10 arc_telephonenumber_3;
  string1 arc_dma_tps_dnc_flag_3;
  string1 arc_tot_phones;
  string3 arc_length_of_residence;
  string1 arc_homeowner;
  string1 arc_estimatedincome;
  string1 arc_dwelling_type;
  string1 arc_married;
  string1 arc_child;
  string1 arc_nbrchild;
  string1 arc_teencd;
  string1 arc_percent_range_english_speaking;
  string1 arc_percent_range_spanish_speaking;
  string1 arc_percent_range_asian_speaking;
  string1 arc_mhv;
  string1 arc_mor;
  string1 arc_car;
  string3 arc_medschl;
  string1 arc_penetration_range_whitecollar;
  string1 arc_penetration_range_bluecollar;
  string1 arc_penetration_range_otheroccupation;
  unsigned4 infutor_hhld_vehicle_cnt;
  string1 presence_of_crossover;
  string1 presence_of_fullsizecar;
  string1 presence_of_fullsizesuv;
  string1 presence_of_fullsizetruck;
  string1 presence_of_fullsizevan;
  string1 presence_of_midsizecar;
  string1 presence_of_midsizetruck;
  string1 presence_of_minivan;
  string1 presence_of_smallcar;
  string1 presence_of_smallsuv;
  string1 presence_of_smalltruck;
  string1 presence_of_luxury;
  string1 presence_of_truck;
  string17 vehicle_vin_1;
  string5 vehicle_make_code_1;
  string36 vehicle_make_desc_1;
  string30 vehicle_model_code_1;
  string36 vehicle_model_desc_1;
  string4 vehicle_year_1;
  string25 vehicle_series_1;
  string15 vehicle_class_1;
  string25 vehicle_style_1;
  string10 vehicle_body_1;
  string1 vehicle_fuel_type_1;
  string1 vehicle_mfg_code_1;
  string1 vehicle_mileagecd_1;
  string17 vehicle_vin_2;
  string5 vehicle_make_code_2;
  string36 vehicle_make_desc_2;
  string30 vehicle_model_code_2;
  string36 vehicle_model_desc_2;
  string4 vehicle_year_2;
  string25 vehicle_series_2;
  string15 vehicle_class_2;
  string25 vehicle_style_2;
  string10 vehicle_body_2;
  string1 vehicle_fuel_type_2;
  string1 vehicle_mfg_code_2;
  string1 vehicle_mileagecd_2;
  string17 vehicle_vin_3;
  string5 vehicle_make_code_3;
  string36 vehicle_make_desc_3;
  string30 vehicle_model_code_3;
  string36 vehicle_model_desc_3;
  string4 vehicle_year_3;
  string25 vehicle_series_3;
  string15 vehicle_class_3;
  string25 vehicle_style_3;
  string10 vehicle_body_3;
  string1 vehicle_fuel_type_3;
  string1 vehicle_mfg_code_3;
  string1 vehicle_mileagecd_3;
  string17 vehicle_vin_4;
  string5 vehicle_make_code_4;
  string36 vehicle_make_desc_4;
  string30 vehicle_model_code_4;
  string36 vehicle_model_desc_4;
  string4 vehicle_year_4;
  string25 vehicle_series_4;
  string15 vehicle_class_4;
  string25 vehicle_style_4;
  string10 vehicle_body_4;
  string1 vehicle_fuel_type_4;
  string1 vehicle_mfg_code_4;
  string1 vehicle_mileagecd_4;
  string17 vehicle_vin_5;
  string5 vehicle_make_code_5;
  string36 vehicle_make_desc_5;
  string30 vehicle_model_code_5;
  string36 vehicle_model_desc_5;
  string4 vehicle_year_5;
  string25 vehicle_series_5;
  string15 vehicle_class_5;
  string25 vehicle_style_5;
  string10 vehicle_body_5;
  string1 vehicle_fuel_type_5;
  string1 vehicle_mfg_code_5;
  string1 vehicle_mileagecd_5;
  unsigned4 infutor_hhld_boat_cnt;
  string30 boat_make_1;
  string30 boat_model_1;
  string4 boat_year_1;
  string10 boat_length_1;
  string1 boat_size_1;
  string1 boat_type_1;
  string1 boat_use_1;
  string1 boat_fuel_1;
  string1 boat_hull_material_1;
  string1 boat_hull_shape_1;
  string1 boat_propulsion_1;
  string30 boat_make_2;
  string30 boat_model_2;
  string4 boat_year_2;
  string10 boat_length_2;
  string1 boat_size_2;
  string1 boat_type_2;
  string1 boat_use_2;
  string1 boat_fuel_2;
  string1 boat_hull_material_2;
  string1 boat_hull_shape_2;
  string1 boat_propulsion_2;
  unsigned4 infutor_hhld_motorcycle_cnt;
  string17 motorcycle_vin_1;
  string36 motorcycle_make_1;
  string36 motorcycle_model_1;
  string4 motorcycle_year_1;
  string25 motorcycle_series_1;
  string15 motorcycle_class_1;
  string25 motorcycle_style_1;
  string40 motorcycle_vehicle_type_1;
  string1 motorcycle_fuel_type_1;
  string1 motorcycle_mfg_code_1;
  string1 motorcycle_mileagecd_1;
  string17 motorcycle_vin_2;
  string36 motorcycle_make_2;
  string36 motorcycle_model_2;
  string4 motorcycle_year_2;
  string25 motorcycle_series_2;
  string15 motorcycle_class_2;
  string25 motorcycle_style_2;
  string40 motorcycle_vehicle_type_2;
  string1 motorcycle_fuel_type_2;
  string1 motorcycle_mfg_code_2;
  string1 motorcycle_mileagecd_2;
  string1 rooflt5;
  string1 rooflt10;
  string1 rooflt15;
  string4 lastroofyear;
  decimal9_2 lastroofjobcost;
  string1 alterationremodeladditionlt5;
  string1 alterationremodeladditionlt10;
  string1 alterationremodeladditionlt15;
  string4 lastalterationremodeladditionyear;
  decimal9_2 lastalterationremodeladditionjobcost;
  string1 permittypeelectricallt5;
  string1 permittypeelectricallt10;
  string1 permittypeelectricallt15;
  string4 lastpermittypeelectricalyear;
  decimal9_2 lastpermittypeelectricaljobcost;
  string1 permittypemechanicallt5;
  string1 permittypemechanicallt10;
  string1 permittypemechanicallt15;
  string4 lastpermittypemechanicalyear;
  decimal9_2 lastpermittypemechanicaljobcost;
  string1 permittypeplumbinglt5;
  string1 permittypeplumbinglt10;
  string1 permittypeplumbinglt15;
  string4 lastpermittypeplumbingyear;
  decimal9_2 lastpermittypeplumbingjobcost;
  string1 poollt5;
  string1 poollt10;
  string1 poollt15;
  string4 lastpoolyear;
  decimal9_2 lastpooljobcost;
  string1 demolitionlt5;
  string1 demolitionlt10;
  string1 demolitionlt15;
  string4 lastdemolitionyear;
  decimal9_2 lastdemolitionjobcost;
  string4 lastnewconstructionyear;
  decimal9_2 lastnewconstructionjobcost;
  string1 vision_motorcycle;
  string1 vision_rv;
  unsigned1 vision_number_of_vehicles;
  string1 children_age_16_17;
  string2 prd_auto_month;
  string2 prd_prop_month;
  string4 prd_prop_src;
  string1 prd_confidence_code;
  string2 wealth;
  string2 wealth_state;
  string3 occupation_group_p1;
  unsigned2 source_boat;
  string1 presence_of_boat;
  unsigned2 source_mc;
  string1 motorcycle_ownership_code;
  unsigned2 source_vehicle;
  unsigned1 number_of_vehicles_registered;
  string1 recreational_vehicle_ownership_code;
  unsigned1 presence_boat_motorcycle_rv;
  string1 yearbuilt_or_roofyear_lt8;
  string1 yearbuilt_or_roofyear_lt9;
  string4 mes_score_zip9;
  unsigned2 source_usage;
  string50 address;
  string1 apt_flag;
  string1 refi_flag_txn;
  string1 rural_flag_drv;
  string3 scf_drv;
  string1 sfdu_flag_drv;
  string5 state_county_lookup_numeric;
  string18 citykey_drv;
  string9 zip9;
  unsigned1 zip_excl_flag;
  string1 always_y;
  string10 exact_dob_drv;
  string6 exact_dob_mm_yyyy;
  string2 birth_month;
  string1 age_drv;
  string1 child_flag_drv;
  string1 children_0_3;
  string1 children_0_3_flag;
  string1 children_10_12;
  string1 children_10_12_flag;
  string1 children_13_18;
  string1 children_13_18_flag;
  string1 children_4_6;
  string1 children_4_6_flag;
  string1 children_7_9;
  string1 children_7_9_flag;
  string1 children_age_0_2;
  string6 census_tract_2010;
  string1 census_block_2010;
  string5 census_ispsa_2010;
  string4 enh_mktval_drv;
  string1 group_code;
  string25 home_lender_name;
  unsigned4 home_purch_date;
  string2 home_purch_month;
  unsigned4 mortgage_age;
  string1 ppd_flag;
  string10 phone_drv;
  string1 phone_flag_drv;
  string3 unscrubbed_do_not_use_areacode;
  string1 presence_19_in_hh;
  string1 age_16_24_in_hh;
  string1 presence_16_19_yr_old;
  string1 trv_qualifies_flag;
  string1 sic_activity;
  decimal5_2 hisp_pct;
  string1 first_match;
  string1 last_match;
  string2 hisp_score_drv;
  string1 slpi_drv;
  unsigned2 bk_score;
  string1 bktier;
  unsigned2 life_attrition_model;
  string1 life_attrition_model_decile;
  string1 fe_tier;
  decimal12_9 trvcompetemodel;
  unsigned1 trv_compete_decile;
  unsigned2 channel_pref_d_score;
  unsigned2 channel_pref_e_score;
  unsigned2 channel_pref_i_score;
  unsigned1 channel_pref_i_decile;
  unsigned1 channel_pref_d_decile;
  unsigned1 channel_pref_e_decile;
  string3 channel_preference;
  unsigned2 prospectsurvival_model;
  unsigned1 prospectsurvival_decile;
  unsigned2 activity_model;
  unsigned1 activity_tile;
  decimal11_10 premiummodelbase;
  unsigned2 premium_score;
  unsigned1 premium_decile;
  decimal6_1 marketing_risk_classifier_auto_score;
  unsigned1 marketing_risk_classifier_auto_decile;
  unsigned2 annuity_model;
  unsigned1 annuity_decile_full;
  string1 annuity_decile;
  string1 quantum_qualified;
  decimal6_4 shelterindexscore;
  unsigned1 shelterindexdecile;
  unsigned2 shelterresponsemodel;
  string1 shelter_response_tier;
  unsigned2 liabilityresponsemodel;
  decimal11_10 collisiondeductiblexb;
  decimal18_15 bodilyinjurylimitsxb;
  string1 coveragetier;
  string1 bodilyinjurylimitstier;
  string1 collisiondeductibletier;
  unsigned2 lifeclassification_model;
  unsigned1 lifeclassification_decile;
  decimal5_1 mortgage_protection_model;
  string1 mortgage_protection_decile;
  unsigned2 scorerespmedsup;
  unsigned2 scorerespltc;
  unsigned4 scorerespfinalexpense;
  string1 tier_ltc;
  string1 tier_medsup;
  string1 mri_tier;
  unsigned2 combined_age;
  unsigned2 combined_age_source;
  string8 combined_dob;
  unsigned2 combined_dob_source;
  string1 combined_dwelling_type;
  unsigned2 combined_dwelling_type_source;
  string1 combined_gender;
  unsigned2 combined_gender_source;
  integer8 combined_length_of_residence;
  unsigned2 combined_length_of_residence_source;
  string1 combined_marital_status;
  unsigned2 combined_marital_status_source;
  string1 combined_ownership_code;
  unsigned2 combined_ownership_code_source;
  string1 combined_presence_of_children;
  unsigned2 combined_presence_of_children_source;
  string1 combined_time_zone;
  unsigned2 combined_time_zone_source;
  string10 combined_phone;
  unsigned2 combined_phone_source;
  string1 combined_number_children;
  unsigned2 combined_number_children_source;
  string15 alternate_first_name;
  string20 alternate_middle_name;
  string20 alternate_last_name;
  string6 alternate_name_suffix;
  string6 alternate_name_title;
  string25 alternate_p_city_name;
  string25 alternate_v_city_name;
  string1 alternate_cr_sort_sz;
  string2 alternate_fips_state;
  string10 alternate_geo_lat;
  string11 alternate_geo_long;
  string4 alternate_msa;
  string7 alternate_geo_blk;
  string1 alternate_geo_match;
  string25 alternate_address1;
  string25 alternate_address2;
  string28 alternate_city;
  string2 alternate_state;
  string5 alternate_zip;
  string4 alternate_zip4;
  string10 alternate_prim_range;
  string2 alternate_predir;
  string28 alternate_prim_name;
  string4 alternate_addr_suffix;
  string2 alternate_postdir;
  string10 alternate_unit_desig;
  string8 alternate_sec_range;
  string9 alternate_rr_umber;
  string9 alternate_rr_box;
  string2 alternate_ace_z4_record_type;
  string3 alternate_ace_county;
  string20 alternate_np_secaddr;
  string1 alternate_dpbc_check_digit;
  string2 alternate_dpbc;
  string4 alternate_carrier_rt_code;
  string1 alternate_trunc_flag;
  string1 alternate_dns_flag;
  string6 alternate_err_stat;
  string4 alternate_lot;
  string1 alternate_lot_order;
  string28 alternate_extraneous;
  string10 alternate_addr_numerics;
 END;

fileName := KELBlackBox.FileBlackBoxLocation + 'out::marketmagnifier::092016::final';
EXPORT FileBlackBoxMarketMagnifier := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	DATASET(fileName, LayoutMarketMagnifier, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs),
	DATASET(fileName, LayoutMarketMagnifier, THOR, __COMPRESSED__) ((UNSIGNED8)LexID IN _Control.LexIDFilterSet));