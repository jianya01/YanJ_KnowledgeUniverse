﻿IMPORT STD;
IMPORT KEL07 AS KEL;

CleanDate(STRING Date) := FUNCTION
		YYYY := Date[7..10];
		MM := Date[1..2];
		DD := Date[4..5];
		// Date[3] & Date[6] = '/'

		RETURN(MAP(KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + MM + DD))										=> YYYY + MM + DD, // Full date is valid
				KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + MM + '01')) AND (INTEGER)DD = 0						=> YYYY + MM + '01', // YYYYMM valid and DD is 00
				KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + '0101')) AND (INTEGER)MM = 0 AND (INTEGER)DD = 0	=> YYYY + '0101', // YYYY valid and MMDD is 0000
						   																							'0')); // Invalid date, set to 0
END;


main_key_layout := RECORD
  string30 vehicle_key;
  string15 iteration_key;
  string2 source_code;
  string2 state_origin;
  unsigned8 state_bitmap_flag;
  string25 orig_vin;
  string4 orig_year;
  string5 orig_make_code;
  string36 orig_make_desc;
  string3 orig_series_code;
  string25 orig_series_desc;
  string3 orig_model_code;
  string30 orig_model_desc;
  string5 orig_body_code;
  string20 orig_body_desc;
  string6 orig_net_weight;
  string6 orig_gross_weight;
  string1 orig_number_of_axles;
  string1 orig_vehicle_use_code;
  string30 orig_vehicle_use_desc;
  string5 orig_vehicle_type_code;
  string30 orig_vehicle_type_desc;
  string3 orig_major_color_code;
  string15 orig_major_color_desc;
  string3 orig_minor_color_code;
  string15 orig_minor_color_desc;
  string1 vina_veh_type;
  string5 vina_ncic_make;
  string2 vina_model_year_yy;
  string17 vina_vin;
  string1 vina_vin_pattern_indicator;
  string1 vina_bypass_code;
  string1 vina_vp_restraint;
  string4 vina_vp_abbrev_make_name;
  string2 vina_vp_year;
  string3 vina_vp_series;
  string3 vina_vp_model;
  string1 vina_vp_air_conditioning;
  string1 vina_vp_power_steering;
  string1 vina_vp_power_brakes;
  string1 vina_vp_power_windows;
  string1 vina_vp_tilt_wheel;
  string1 vina_vp_roof;
  string1 vina_vp_optional_roof1;
  string1 vina_vp_optional_roof2;
  string1 vina_vp_radio;
  string1 vina_vp_optional_radio1;
  string1 vina_vp_optional_radio2;
  string1 vina_vp_transmission;
  string1 vina_vp_optional_transmission1;
  string1 vina_vp_optional_transmission2;
  string1 vina_vp_anti_lock_brakes;
  string1 vina_vp_front_wheel_drive;
  string1 vina_vp_four_wheel_drive;
  string1 vina_vp_security_system;
  string1 vina_vp_daytime_running_lights;
  string25 vina_vp_series_name;
  string4 vina_model_year;
  string3 vina_series;
  string3 vina_model;
  string2 vina_body_style;
  string36 vina_make_desc;
  string36 vina_model_desc;
  string25 vina_series_desc;
  string25 vina_body_style_desc;
  string2 vina_number_of_cylinders;
  string4 vina_engine_size;
  string1 vina_fuel_code;
  string6 vina_price;
  string5 best_make_code;
  string3 best_series_code;
  string3 best_model_code;
  string5 best_body_code;
  string4 best_model_year;
  string3 best_major_color_code;
  string3 best_minor_color_code;
  string1 branded_title_flag;
  string3 brand_code_1;
  string10 brand_date_1;
  string2 brand_state_1;
  string3 brand_code_2;
  string10 brand_date_2;
  string2 brand_state_2;
  string3 brand_code_3;
  string10 brand_date_3;
  string2 brand_state_3;
  string3 brand_code_4;
  string10 brand_date_4;
  string2 brand_state_4;
  string3 brand_code_5;
  string10 brand_date_5;
  string2 brand_state_5;
  string1 tod_flag;
  string3 model_class_code;
  string50 model_class;
  string2 min_door_count;
  string3 safety_type;
  string50 airbag_driver;
  string50 airbag_front_driver_side;
  string50 airbag_front_head_curtain;
  string50 airbag_front_pass;
  string50 airbag_front_pass_side;
  string50 airbags;
  unsigned8 __internal_fpos__;
 END;
 
blankDataset := dataset([], main_key_layout);

fileName := '~thor_data400::key::vehiclev2::main_key_qa'; 

raw_main_key := INDEX(blankDataset, {vehicle_key,iteration_key}, {blankDataset}, fileName);
 
 main_key_clean_date_fields := PROJECT(raw_main_key, TRANSFORM({RECORDOF(LEFT) -brand_date_1 -brand_date_2 -brand_date_3 -brand_date_4 -brand_date_5, 
																													string10 cleaned_brand_date_1, string10 cleaned_brand_date_2, string10 cleaned_brand_date_3, string10 cleaned_brand_date_4, string10 cleaned_brand_date_5},
		SELF.cleaned_brand_date_1 := CleanDate(LEFT.brand_date_1);
		SELF.cleaned_brand_date_2 := CleanDate(LEFT.brand_date_2);
		SELF.cleaned_brand_date_3 := CleanDate(LEFT.brand_date_3);
		SELF.cleaned_brand_date_4 := CleanDate(LEFT.brand_date_4);
		SELF.cleaned_brand_date_5 := CleanDate(LEFT.brand_date_5);
		SELF := LEFT));
// OUTPUT(main_key_clean_date_fields(cleaned_brand_date_1 <>'0'));	//TEST DATE CLEANER

EXPORT main_key := main_key_clean_date_fields;