
LayoutVehicle := RECORD
  unsigned8 sequenceid;
  string9 batch_id;
  unsigned8 recordnumber;
  unsigned8 claimgroupnumber;
  string9 contributor_id;
  unsigned1 file_seq;
  string generatedkey;
  unsigned4 parententityseqnumber;
  unsigned4 entityseqnumber;
  string5 claimtype;
  string5 vehicleref;
  string5 insurerirdacode;
  string10 claimnumber;
  string9 claimregistrationdate;
  string20 vehicleregistrationnumber;
  string25 typeofvehicle;
  string1 vehiclecommercialindicator;
  string30 enginenumber;
  string30 chassisnumber;
  string30 vinnumber;
  string50 vehiclemanufacturer;
  string30 vehiclemake;
  string40 vehiclemodel;
  string15 vehiclecolour;
  string35 vehiclevariant;
  string3 totalseatingcapacity;
  string25 typeofbody;
  string25 vehicle_size;
  string4 yearofmanufacture;
  string1 commercialvehicleindicator;
  string3 commercialvehicledetails;
  string15 roadpermittype;
  string10 rtalocationcode;
  string35 rtalocation;
  string1 vehiclezone;
  string1 fueltype;
  string10 cubiccapacity;
  string15 ownershiptype;
  string2 purchasedate_day;
  string3 purchasedate_month;
  string4 purchasedate_year;
  string2 day_of_registration;
  string3 month_of_registration;
  string4 year_of_registration;
  string150 parking_addressline1;
  string150 parking_addressline2;
  string150 parking_addressline3;
  string150 parking_landmark;
  string100 parking_city;
  string100 parking_district;
  string100 parking_state;
  string20 parking_country;
  string6 parking_pincode;
 END;
 
	
fileName := '~thor::chola::base::motor::sept::masked::vehicle';
	

EXPORT VehicleFile := DATASET(fileName, LayoutVehicle, THOR);

			
	
	