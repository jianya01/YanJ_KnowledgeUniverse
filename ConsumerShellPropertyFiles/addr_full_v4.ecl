unsigned2 MAX_EMBEDDED := 100;

layout_name := record
			qstring20             fname;
			qstring20             lname;
end;

layout_fares := RECORD
			string12 ln_fare_id;
END;

Base_Layout := record
			unsigned1 roll_count;
			string1   AD;
			boolean   occupant_owned;
			UNSIGNED4 purchase_date;
			UNSIGNED4 built_date;
			UNSIGNED4 purchase_amount;
			UNSIGNED4 mortgage_amount;
			UNSIGNED4 mortgage_date;               
			string5   mortgage_type;              
			string4   type_financing;                                
			string8   first_td_due_date;                        
			UNSIGNED4 assessed_amount;
			UNSIGNED4 assessed_total_value;               
			UNSIGNED1 property_count;
			UNSIGNED1 property_total;
			UNSIGNED5 property_owned_purchase_total;
			UNSIGNED2 property_owned_purchase_count;
			UNSIGNED5 property_owned_assessed_total;
			UNSIGNED2 property_owned_assessed_count;
			UNSIGNED4 date_first_seen;
			UNSIGNED4 date_last_seen;          
			string standardized_land_use_code;
			unsigned building_area ;
			unsigned no_of_buildings ;
			unsigned no_of_stories ;
			unsigned no_of_rooms ;
			unsigned no_of_bedrooms ;
			unsigned no_of_baths;
			unsigned no_of_partial_baths ;
			string garage_type_code;
			unsigned parking_no_of_cars;
			string style_code;
			string4  assessed_value_year;                   
			string12 ln_fares_id;
			string10 prim_range ;
			string2  predir ;
			string28 prim_name ;
			string4  suffix ;
			string2  postdir ;
			string10 unit_desig ;
			string8  sec_range ;
			string25 p_city_name ;
			string2  st ;
			string5  zip;
			string4  zip4;
			string3 county;
			string7 geo_blk;
			dataset(layout_name) buyers {MAXCOUNT (MAX_EMBEDDED)};
			dataset(layout_name) sellers {MAXCOUNT (MAX_EMBEDDED)};
			DATASET (layout_fares) fares {MAXCOUNT (MAX_EMBEDDED)};
end;


File_Base := DATASET([], Base_Layout); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank


EXPORT addr_full_v4 := INDEX(File_Base, 
							 {prim_range, prim_name, sec_range, zip, suffix, predir, postdir},
							 {File_Base}, '~thor_data400::key::ln_propertyv2::fcra::qa::addr.full_v4');
