EXPORT Layouts := MODULE

	EXPORT Layout_Insurance_Header := RECORD   // this is the layout for insurance header
			unsigned8 lexid;
			unsigned4 date_first_seen;
			unsigned4 date_last_seen;
			unsigned4 ih_date_first_seen;
			unsigned4 ih_date_last_seen;
			string1 active_flag;
			string10 adl_segmentation;
			string1 gender;
			string1 derived_gender;
			unsigned4 dob;
			string9 ssn;
			string25 dl_nbr;
			string2 dl_state;
			string20 first_name;
			string20 middle_name;
			string28 last_name;
			string2 suffix;
			string2 predir;
			string10 prim_range;
			string28 prim_name;
			string4 addr_suffix;
			string2 postdir;
			string10 unit_desig;
			string8 sec_range;
			string25 city;
			string2 state;
			string5 zip;
			string4 zip4;
			string3 addrtype;
			unsigned6 hhid;
			unsigned6 hhid_indiv;
			unsigned6 hhid_relat;
			unsigned8 rid;
 END;	
	
	EXPORT Input_Rec := RECORD   // this is layout for batch input
			STRING60	Quoteback;
			STRING28 	LName;
			STRING20 	FName;
			STRING15 	MName;
			STRING3	 	SName;
			STRING1		Sex;
			STRING8		DOB;
			STRING9		SSN;
			STRING9 	House_No;
			STRING20	Street_Name;
			STRING5		Apt_No;
			STRING20	City;
			STRING2		State;
			STRING5		Zip5;
			STRING4		Zip4;
			STRING25 	Drivers_License_No;
			STRING2  	Drivers_License_State;
	END;

	EXPORT BatchLog := RECORD     // this is close to the layout for the auditlog file
		  unsigned4 process_dt;
		  string60 file_name;
		  string6 build_period;
		  unsigned8 total_inquiries;
		  unsigned8 total_results;
		  unsigned8 total_hits;
		  unsigned8 total_nohits;
		  unsigned8 insufficientdata;
		  unsigned8 errors;
		  unsigned8 percentinquirywithclaims;
		  string20 wuid;
	END;

	END;
	
	EXPORT Layout_CLUEProperty_Request := RECORD
		UNSIGNED8 rid;    
		STRING6 build_period;
		CLUEPropertyServices.Constants.Layout_PropOrder;
END;
	
END;