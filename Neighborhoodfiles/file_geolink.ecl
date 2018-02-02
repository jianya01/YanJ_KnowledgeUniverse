
 layout_geolink := RECORD
  string12 geolink;
  unsigned4 ave_occupant_owned;
  unsigned4 cnt_occupant_owned;
  unsigned4 ave_building_age;
  unsigned4 cnt_building_age;
  unsigned4 ave_purchase_amount;
  unsigned4 cnt_purchase_amount;
  unsigned4 ave_purchase_age;
  unsigned4 cnt_purchase_age;
  unsigned4 ave_mortgage_amount;
  unsigned4 cnt_mortgage_amount;
  unsigned4 ave_mortgage_age;
  unsigned4 cnt_mortgage_age;
  unsigned4 ave_assessed_amount;
  unsigned4 cnt_assessed_amount;
  unsigned8 ave_building_area;
  unsigned8 cnt_building_area;
  unsigned8 ave_price_per_sf;
  unsigned8 cnt_price_per_sf;
  unsigned8 ave_no_of_buildings_count;
  unsigned8 cnt_no_of_buildings_count;
  unsigned8 ave_no_of_stories_count;
  unsigned8 cnt_no_of_stories_count;
  unsigned8 ave_no_of_rooms_count;
  unsigned8 cnt_no_of_rooms_count;
  unsigned8 ave_no_of_bedrooms_count;
  unsigned8 cnt_no_of_bedrooms_count;
  unsigned8 ave_no_of_baths_count;
  unsigned8 cnt_no_of_baths_count;
  unsigned8 ave_no_of_partial_baths_count;
  unsigned8 cnt_no_of_partial_baths_count;
  unsigned4 ave_parking_no_of_cars;
  unsigned4 cnt_parking_no_of_cars;
  unsigned4 total_property_count;
  unsigned2 neighborhood_vacant_properties;
  unsigned2 neighborhood_business_count;
  unsigned2 neighborhood_sfd_count;
  unsigned2 neighborhood_mfd_count;
  unsigned2 neighborhood_collegeaddr_count;
  unsigned2 neighborhood_seasonaladdr_count;
  unsigned4 neighborhood_property_count;
 END;


Advo_geolink := DATASET([], layout_geolink); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank

 EXPORT  file_geolink := INDEX(Advo_geolink, 
							 {geolink},
							 {Advo_geolink}, '~thor_data400::key::advo::qa::geolink');
							 
						//output(choosen(file_geolink,10));			 
					

