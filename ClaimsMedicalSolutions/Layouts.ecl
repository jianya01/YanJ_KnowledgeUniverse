Import ContributionScrubClaimsCompass;

Export Layouts := Module

	Shared AcceptFileLay := ContributionScrubClaimsCompass.Layouts.Claim_Rec;
	

	Export Name_Rec := Record
		STRING4			NamePrefix;
		STRING25		FirstName;
		STRING15		MiddleName;
		STRING28		LastName;
		STRING3			NameSuffix;
		STRING50		BusinessName;
	End;

	Export Address_Rec := Record
		STRING2			AddressType;
		STRING10		StreetNumber;
		STRING161		StreetName;
		STRING18		ApartmentNumber;
		STRING30		City;
		STRING2			State;
		STRING5			ZipCode;
		STRING4			ZipCode4;
		STRING6			NonUSPostalCode;
	End;	
	
	
	Export Address_Rec_new := Record
		STRING2			AddressType;
		STRING10		StreetNumber;
		STRING161		StreetName;
		STRING18		ApartmentNumber;
		STRING30		City;
		STRING2			State;
		STRING5			ZipCode;
		STRING4			ZipCode4;
		STRING6			NonUSPostalCode;
	End;	
	
export	Clean_Name_Rec := Record
	STRING4			CLEAN_NamePrefix;
	STRING25		CLEAN_FirstName;
	STRING15		CLEAN_MiddleName;
	STRING28		CLEAN_LastName;
	STRING3			CLEAN_NameSuffix;
	STRING50		CLEAN_BusinessName;
End;

export BothNames_Rec := Record 
	Name_Rec Raw_name; 
	Clean_Name_Rec Cleaned_Name;
End;

 export LAYOUT_CLEAN_ADDRESS := RECORD
	  STRING4			ERROR_CODE;
		STRING10		PRIM_RANGE;
		STRING2			PREDIR;
		STRING28		PRIM_NAME;
		STRING4			ADDR_SUFFIX;
		STRING2			POSTDIR;
		STRING10		UNIT_DESIG;
		STRING8			SEC_RANGE;
		STRING30		CITY;
		STRING2			ST;
		STRING5			ZIP;
		STRING4			ZIP4;
		DECIMAL15_10	Latitude;
	  DECIMAL15_10	Longitude;
		STRING5	    	COUNTY_CODE;
		STRING7				GEOBLOCK;
	END;
	
export both_addresses := record
// UNSIGNED8 address_seq_no;
Address_Rec_new raw_Address;
LAYOUT_CLEAN_ADDRESS cleaned_Address;
end;	

export both_addresses_1 := record
UNSIGNED8 Rec_Seq_No;
// unsigned8 address_seq_no;
Address_Rec_new raw_Address;
LAYOUT_CLEAN_ADDRESS cleaned_Address;
end;	

	EXPORT CDFCContribWithBatch 	:= RECORD (AcceptFileLay)
		UNSIGNED8 SEQ;
		STRING9 	Batch_No;
		UNSIGNED8 LoadDateTime;
		UNSIGNED8 Batch_Rec_No;
		UNSIGNED8 Source_RID := 0;
		string    Contribution;
		STRING9   Contributor_Id;
	  String1 		auto_carriers_share_data;
		String1 		workers_carriers_share_data;
		String1 		auto_share_with_fdn;
		String1 		workers_share_with_fdn;
		UNSIGNED1	File_Seq;
	
	END;

	Export Phone_Rec := Record
		 STRING2 			Classification; 
		 STRING3 			CountryCodeExchange; 		
		 STRING3 			AreaCode; 
		 STRING7 			PhoneNumber; 
		 STRING10 		Extension; 
		 STRING1 			PrimaryPhoneIndicator;
	End;
	
	Export Claim_Rec := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		string9			Batch_No;
		UNSIGNED8		Batch_Rec_No;
		string15 		AccountNumber;
		string1  		Typeofupdate;
		STRING8 		ValuationDate;
		STRING5 		NAIC_Code; 
		STRING8 		DateofLoss;
		STRING25  	TimeofLoss;
		STRING8 		DateReported; 
		STRING  		LossLocation;
		STRING2  		LossLocationState;
		STRING2			LocationAddressType;   
		STRING10 		LocationAddressStreetNumber;    
		STRING161 		LocationAddressStreetName;  
		STRING18 		LocationAddressApartmentNumber;  
		STRING30 		LocationAddressCity;  
		STRING2  		LocationAddressState;  
		STRING5			LocationAddressZipCode;  
		STRING4			LocationAddressZipCode4; 
		STRING1500 	LossDescriptionField;
		STRING2  		LossTypeCategory;
		STRING1  		AuthoritiesContactedPoliceReportFiled;
		STRING1  		AtFaultIndicator; 
		STRING3  		PercentLiable; 
		STRING2  		WeatherConditions; 
		STRING40 		ClaimHandlingOffice; 
		STRING1  		FastPayindicator; 
		STRING66 		PrimaryAdjusterName; 
		STRING12 		PrimaryAdjusterID; 
		Phone_Rec   PrimaryAdjusterPhone;
		// STRING2 		PrimarAdjusterTelClassification; 
		// STRING3 		PrimarAdjusterTelCountryCodeExchange; 
		// STRING3 		PrimarAdjusterTelAreaCode; 
		// STRING7 		PrimarAdjusterTelPhoneNumber; 
		// STRING10 		PrimarAdjusterTelExtension; 
		// STRING1 		PrimarAdjusterTelPrimaryPhoneIndicator;
		STRING1 		MultiVehicleInd; 
		STRING1 		HitandRunInd; 
		STRING1 		CatastropheInd; 
		STRING10 		CatastropheNumber; 
		STRING2 		WhoReportedLoss; 
		STRING1 		HowLosswasReported; 
		STRING1 		ClaimDisposition; 
		STRING8 		ClosedDate;
		STRING1 		AmbulancetoScene;
		STRING1 		SuitIndicator;
		STRING8 		DateInsuranceCoReceived;
		STRING1 		ReportType_ReportingStatus;
		STRING25 		ReferenceNumber;
		STRING1 		PreviouslyReported;
		STRING1 		LossViolations_Citations;
		STRING255 	Remarks;
		STRING1 		PhantomVehicleAccidentIndicators;
		STRING1 		Accidentwitnessed;
		STRING1 		Molddamageclaimed;
		STRING50		InvestigatingAgencyName;
		STRING2 		InvestigatingAgencyType;
		STRING10 		InvestigatingAgencyAddrStreetNumber;
		STRING161		InvestigatingAgencyAddrStreetName;
		STRING18 		InvestigatingAgencyAddrApartmentNumber;
		STRING30 		InvestigatingAgencyAddrCity;
		STRING2 		InvestigatingAgencyAddrState;
		STRING5 		InvestigatingAgencyAddrZipcode;
		STRING4 		InvestigatingAgencyAddrZip4;
		STRING66 		InvestigatingAgencyOfficerName;
		STRING6 		InvestigatingAgencyPrecint;
		STRING20 		InvestigatingAgencyReportCaseNumber;
		STRING8   	InvestigatingAgencyDateofIncidentReport;
	End;


   	Export Claim_Rec_new := Record
   		STRING6 		AMBest_Number;   
   		STRING50 		Claim_Number;
   		UNSIGNED8		LoadDateTime;
   		UNSIGNED8		Rec_Seq_No;
   		string9			Batch_No;
   		UNSIGNED8		Batch_Rec_No;
		  string       Contribution;
      String1 		auto_carriers_share_data;
		  String1 		workers_carriers_share_data;
	  	String1 		auto_share_with_fdn;
	  	String1 		workers_share_with_fdn;
   		string15 		AccountNumber;
   		string1  		Typeofupdate;
   		STRING8 		ValuationDate;
   		STRING5 		NAIC_Code; 
   		STRING8 		DateofLoss;
   		STRING25  	TimeofLoss;
   		STRING8 		DateReported; 
   		STRING  		LossLocation;
   		STRING2  		LossLocationState;
   		// STRING2			LocationAddressType;   
   		// STRING10 		LocationAddressStreetNumber;    
   		// STRING36 		LocationAddressStreetName;  
   		// STRING18 		LocationAddressApartmentNumber;  
   		// STRING25 		LocationAddressCity;  
   		// STRING2  		LocationAddressState;  
   		// STRING5			LocationAddressZipCode;  
   		// STRING4			LocationAddressZipCode4; 
			both_addresses LocationAddress;
   		STRING1500 	LossDescriptionField;
   		STRING2  		LossTypeCategory;
   		STRING1  		AuthoritiesContactedPoliceReportFiled;
   		STRING1  		AtFaultIndicator; 
   		STRING3  		PercentLiable; 
   		STRING2  		WeatherConditions; 
   		STRING40 		ClaimHandlingOffice; 
			STRING50 		ClaimHandlingOfficeID;
   		STRING1  		FastPayindicator; 
   		STRING66 		PrimaryAdjusterName; 
   		STRING12 		PrimaryAdjusterID; 
   		Phone_Rec   PrimaryAdjusterPhone;
   		// STRING2 		PrimarAdjusterTelClassification; 
   		// STRING3 		PrimarAdjusterTelCountryCodeExchange; 
   		// STRING3 		PrimarAdjusterTelAreaCode; 
   		// STRING7 		PrimarAdjusterTelPhoneNumber; 
   		// STRING10 		PrimarAdjusterTelExtension; 
   		// STRING1 		PrimarAdjusterTelPrimaryPhoneIndicator;
   		STRING1 		MultiVehicleInd; 
   		STRING1 		HitandRunInd; 
   		STRING1 		CatastropheInd; 
   		STRING10 		CatastropheNumber; 
   		STRING2 		WhoReportedLoss; 
   		STRING1 		HowLosswasReported; 
   		STRING1 		ClaimDisposition; 
   		STRING8 		ClosedDate;
   		STRING1 		AmbulancetoScene;
   		STRING1 		SuitIndicator;
   		STRING8 		DateInsuranceCoReceived;
   		STRING1 		ReportType_ReportingStatus;
   		STRING25 		ReferenceNumber;
   		STRING1 		PreviouslyReported;
   		STRING1 		LossViolations_Citations;
   		STRING255 	Remarks;
   		STRING1 		PhantomVehicleAccidentIndicators;
   		STRING1 		Accidentwitnessed;
   		STRING1 		Molddamageclaimed;
   		STRING50		InvestigatingAgencyName;
   		STRING2 		InvestigatingAgencyType;			
   		STRING66 		InvestigatingAgencyOfficerName;
   		STRING6 		InvestigatingAgencyPrecint;
   		STRING20 		InvestigatingAgencyReportCaseNumber;
   		STRING8   	InvestigatingAgencyDateofIncidentReport;
   		// STRING10 		InvestigatingAgencyAddrStreetNumber;
   		// STRING36		InvestigatingAgencyAddrStreetName;
   		// STRING18 		InvestigatingAgencyAddrApartmentNumber;
   		// STRING25 		InvestigatingAgencyAddrCity;
   		// STRING2 		InvestigatingAgencyAddrState;
   		// STRING5 		InvestigatingAgencyAddrZipcode;
   		// STRING4 		InvestigatingAgencyAddrZip4;
			both_addresses InvestigatingAgency;
   		STRING2  		StateOfJurisdiction;
   		STRING2     ClaimType;
   		STRING6  	 	WCClassCode;
			STRING1 	 	Last_contributed_claim_flag;
   	End;


	
	Export Notes_Rec := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Note_Seq_No;
		STRING25 		NoteID;
		STRING8 		EntryDate;
		STRING20 		Category;
		STRING65000			DetailedText;
		STRING40 		AuthorName;
		STRING12 		AuthorId;
	End;
	
	Export Payments_Rec := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Payment_Seq_No;
		STRING12 		PaymentID; 
		DATASET({STRING20 ReserveID})				ReserveIDs;
		DATASET({STRING20 MedicalBillID}) 	MedicalBillIDs;
		DATASET({STRING20 PharmacyBillID})	PharmacyBillIDs;
		STRING1 		PaymentCategory;
		STRING2 		PaymentSubCategory;
		STRING1 		PaymentTransactionType;
		STRING8 		DateofPayment;
		STRING12 		Amount;
		STRING1 		ManualCheckInd;
		STRING1 		PayeeType;
		STRING150 	PayeeName;
		STRING2 		AddressType; 
		STRING10 		StreetNumber;
		STRING161 		StreetName;
		STRING18 		ApartmentNumber;
		STRING30 		City;
		STRING2 		State;
		STRING5 		ZipCode;
		STRING4  		ZipCode4;
		STRING11 		PayeeSSNTINFEIN;
		STRING1 		TINEntityType;
	End;

	Export Payments_Rec_new := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Payment_Seq_No;
		STRING12 		PaymentID; 
		DATASET({STRING20 ReserveID})				ReserveIDs;
		DATASET({STRING42 MedicalBillID}) 	MedicalBillIDs;
		DATASET({STRING65 PharmacyBillID})	PharmacyBillIDs;
		STRING1 		PaymentCategory;
		STRING2 		PaymentSubCategory;
		STRING1 		PaymentTransactionType;
		STRING8 		DateofPayment;
		STRING15 		Amount;
		STRING1 		ManualCheckInd;
		STRING1 		PayeeType;
		STRING150 	PayeeName;
		// STRING2 		AddressType; 
		// STRING10 		StreetNumber;
		// STRING36 		StreetName;
		// STRING18 		ApartmentNumber;
		// STRING25 		City;
		// STRING2 		State;
		// STRING5 		ZipCode;
		// STRING4  		ZipCode4;
		both_addresses PayeeAddress;
		STRING11 		PayeeSSNTINFEIN;
		STRING1 		TINEntityType;
	End;
	Export Payments_Rec_new1 := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Payment_Seq_No;
		STRING12 		PaymentID; 
		STRING20    ReserveID;
		DATASET({STRING20 MedicalBillID}) 	MedicalBillIDs;
		DATASET({STRING20 PharmacyBillID})	PharmacyBillIDs;
		STRING1 		PaymentCategory;
		STRING2 		PaymentSubCategory;
		STRING1 		PaymentTransactionType;
		STRING8 		DateofPayment;
		STRING15 		Amount;
		STRING1 		ManualCheckInd;
		STRING1 		PayeeType;
		STRING150 	PayeeName;
		both_addresses PayeeAddress;
		STRING11 		PayeeSSNTINFEIN;
		STRING1 		TINEntityType;
	End;
	
	Export Payments_Rec_new2:= Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Payment_Seq_No;
		STRING12 		PaymentID; 
		STRING20   ReserveID;
		STRING20   MedicalBillID;
		DATASET({STRING20 PharmacyBillID})	PharmacyBillIDs;
		STRING1 		PaymentCategory;
		STRING2 		PaymentSubCategory;
		STRING1 		PaymentTransactionType;
		STRING8 		DateofPayment;
		STRING15 		Amount;
		STRING1 		ManualCheckInd;
		STRING1 		PayeeType;
		STRING150 	PayeeName;
		both_addresses PayeeAddress;
		STRING11 		PayeeSSNTINFEIN;
		STRING1 		TINEntityType;
	End;
	
	Export Payments_Rec_new3 := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Payment_Seq_No;
		STRING12 		PaymentID; 
		STRING20    ReserveID;
		STRING20    MedicalBillID;
		STRING20    PharmacyBillID;
		STRING1 		PaymentCategory;
		STRING2 		PaymentSubCategory;
		STRING1 		PaymentTransactionType;
		STRING8 		DateofPayment;
		STRING15 		Amount;
		STRING1 		ManualCheckInd;
		STRING1 		PayeeType;
		STRING150 	PayeeName;
		both_addresses PayeeAddress;
		STRING11 		PayeeSSNTINFEIN;
		STRING1 		TINEntityType;
	End;
	
	Export SiuReferral_Rec := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Siu_Referral_SeqNo;		
		STRING12 		SIUReferralID;
		DATASET({STRING20 ReserveID}) 	ReserveIDs;
		STRING8 		DateReferred;
		STRING8     DateInvestigationClosed;
		STRING50		TypeofReferral;
		STRING250		ReferralReason;
		STRING2			Disposition;
		STRING15		MitigatedAmount;
		STRING1			Mitigated;
		STRING1			ReferredtoNICB;
		STRING15		NICBReferralNumber;
	End;
	
	Export SiuReferral_Rec_New := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Siu_Referral_SeqNo;		
		STRING12 		SIUReferralID;
		STRING20    ReserveID;
		STRING8 		DateReferred;
		STRING8     DateInvestigationClosed;
		STRING50		TypeofReferral;
		STRING250		ReferralReason;
		STRING2			Disposition;
		STRING15		MitigatedAmount;
		STRING1			Mitigated;
		STRING1			ReferredtoNICB;
		STRING15		NICBReferralNumber;
	End;

	Export		Subrogations_Rec := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Subrogations_Seq_No;
		STRING12		SubrogationID;
		DATASET({String20 ReserveID}) 	ReserveIDs;
		STRING1 		SubroIndicator;
		STRING8			SubroOpenDate;
		STRING8			SubroClosedDate;
		STRING12		RecoveryAmount;
		STRING8			RecoveryDate;
		STRING1 		RecoveryCategory;
		STRING1			Subrogationpotentialind;
	End;

Export	 Subrogations_Rec_new := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Subrogations_Seq_No;
		STRING12		SubrogationID;
		String20    ReserveID;
		STRING1 		SubroIndicator;
		STRING8			SubroOpenDate;
		STRING8			SubroClosedDate;
		STRING12		RecoveryAmount;
		STRING8			RecoveryDate;
		STRING1 		RecoveryCategory;
		STRING1			Subrogationpotentialind;
	End;
	
	Export PolicyHolder_Rec := Record
			// STRING6 		AMBest_Number;   
		// STRING25 		Claim_Number;
		// UNSIGNED8		LoadDateTime;
		// UNSIGNED8		Rec_Seq_No;
		// UNSIGNED8		Policyholder_Seq_No;
	  Name_Rec	Name;
		Dataset(Address_Rec) Addresses;
	END;
	
		Export PolicyHolder_Rec_new := Record
			STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Policy_Seq_No;
		STRING30		PolicyID;
		STRING31		PolicyNumber;
		UNSIGNED8		Policyholder_Seq_No;
	  BothNames_Rec	Name;
		Dataset(Address_Rec) Addresses;
		// BothNames_Rec					Name;
		// both_addresses Addresses;
	END;

 export PolicyHolder_Rec_new1 := Record
			STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Policy_Seq_No;
		STRING30		PolicyID;
		STRING31		PolicyNumber;
		UNSIGNED8		Policyholder_Seq_No;
	  // Name_Rec	Name;
		// Dataset(Address_Rec) Addresses;
		BothNames_Rec					Name;
		both_addresses Addresses;
	END;	
	
	Export 		Policies_Rec := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Policy_Seq_No;
		STRING30		PolicyID;
		STRING31		PolicyNumber;
		STRING1			ClaimPolicy;
		STRING2			InsuranceType;
		STRING100		InsuranceCompany;
		STRING30 		UnderwritingOrganization;
		STRING2			PolicyType;
		STRING1			RiskType;
		STRING2			PolicyState;
		STRING8			InceptionDate;
		STRING8			TermEffectiveDate;
		STRING8			TermExpirationDate;
		STRING8 		CancellationDate;
		STRING4			CancellationReasonCode;
		STRINg8			ReinstatementDate;
		Dataset(PolicyHolder_Rec) PolicyHolders;
		//Dataset(Name_Rec) 	PolicyholderNames;
		//Dataset(Address_Rec)  	PolicyholderAddresses;
		STRING50 		AdditionalInsuredName; 
		STRING2			AdditionalInsuredType;
		STRING8 		SicOrNAICCode;
		STRING3			PaymentMethod;
		STRING30		AgencyName;
		STRING50		AgencyEmailAddress;
		STRING255		AgencyCode;
		STRING5			AgencySubCode;
		STRING10 		NationalProducerNumber;
	End;


	Export 		Policies_Rec_new := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Policy_Seq_No;
		STRING30		PolicyID;
		STRING31		PolicyNumber;
		STRING1			ClaimPolicy;
		STRING2			InsuranceType;
		STRING100		InsuranceCompany;
		STRING30 		UnderwritingOrganization;
		STRING2			PolicyType;
		STRING1			RiskType;
		STRING2			PolicyState;
		STRING8			InceptionDate;
		STRING8			TermEffectiveDate;
		STRING8			TermExpirationDate;
		STRING8 		CancellationDate;
		STRING4			CancellationReasonCode;
		STRINg8			ReinstatementDate;
		// Dataset(PolicyHolder_Rec) PolicyHolders;
		STRING50 		AdditionalInsuredName; 
		STRING2			AdditionalInsuredType;
		STRING8 		SicOrNAICCode;
		STRING3			PaymentMethod;
		STRING30		AgencyName;
		STRING50		AgencyEmailAddress;
		STRING255		AgencyCode;
		STRING5			AgencySubCode;
		STRING10 		NationalProducerNumber;
	End;
	
	Export EstimateAppraisal_Rec :=	Record
		STRING8 		EstimateAppraisalDate;
		STRING12		Amount;
		STRING2 		PerformedBy;
		STRING66 		AppraiserName; 
		Address_Rec Location;
	End;	

	Export EstimateAppraisal_Rec_new :=	Record
		STRING8 		EstimateAppraisalDate;
		STRING12		Amount;
		STRING2 		PerformedBy;
		STRING66 		AppraiserName; 
		// both_addresses Location;
		both_addresses;
	End;	
	
	Export   LeasingFinanceCompany_Rec	:= Record
		STRING1 		Type;
		STRING50		Name;
		Address_Rec LeasingFinanceAddress;
	End;
	
	Export   LeasingFinanceCompany_Rec_new	:= Record
		STRING2 		Type;
		STRING50		Name;
		// Address_Rec LeasingFinanceAddress;
		both_addresses LeasingFinanceAddress;
	End;
	
	Export		Vehicle_Rec	:= Record
		STRING25		VIN;
		STRING4 		Year;
		STRING20		Make;
		STRING20		Model;
		STRING2 		BodyType;
		STRING50 		Color;
		STRING12 		LicensePlateNumber;
		STRING2 		LicensePlateState;
		STRING7 		OdometerReading;
		STRING1 		LienholderInd;
		STRING1 		RentalVehicleInd;
		STRING1 		LeasedVehicleInd;
		Dataset(LeasingFinanceCompany_Rec) 	LeasingFinanceCompany;
		STRING1 		BusinessUseInd; 
		STRING1 		SeatbeltInd;
		STRING1 		AirbagsPresent;
		STRING1 		AntiTheftDevicePresent;
		STRING1 		AirBagDeployed;
		STRING1 		DriverAirbagDeployed;
		STRING1 		PassengerAirbagDeployed;
		STRING1 		LeftSideAirbagDeployed;
		STRING1 		RightSideAirbagDeployed;
		STRING2 		PointofFirstImpact;
		STRING50		VehicleDamageDesc;
		STRING1 		VehicleStolen;
		STRING1 		VehicleParked;
		Address_Rec 	Wherevehicleseen;
		STRING1 		TitleDisposition;
		STRING1 		DriveableInd;
		STRING1 		Disposition;
	End;

Export		Vehicle_Rec_new	:= Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		CIU_Seq_No;	
		STRING25		VIN;
		STRING4 		Year;
		STRING20		Make;
		STRING20		Model;
		STRING2 		BodyType;
		STRING50 		Color;
		STRING12 		LicensePlateNumber;
		STRING2 		LicensePlateState;
		STRING7 		OdometerReading;
		STRING1 		LienholderInd;
		STRING1 		RentalVehicleInd;
		STRING1 		LeasedVehicleInd;
		// Dataset(LeasingFinanceCompany_Rec) 	LeasingFinanceCompany;
		LeasingFinanceCompany_Rec_new LeasingFinanceCompany;
		STRING1 		BusinessUseInd; 
		STRING1 		SeatbeltInd;
		STRING1 		AirbagsPresent;
		STRING1 		AntiTheftDevicePresent;
		STRING1 		AirBagDeployed;
		STRING1 		DriverAirbagDeployed;
		STRING1 		PassengerAirbagDeployed;
		STRING1 		LeftSideAirbagDeployed;
		STRING1 		RightSideAirbagDeployed;
		STRING2 		PointofFirstImpact;
		STRING50		VehicleDamageDesc;
		STRING1 		VehicleStolen;
		STRING1 		VehicleParked;
		// Address_Rec 	Wherevehicleseen;
		both_addresses Wherevehicleseen;
		// both_addresses;
		STRING1 		TitleDisposition;
		STRING1 		DriveableInd;
		STRING1 		Disposition;
	End;

	Export		Reserve_Rec	:= Record
		STRING20 		ReserveID;
		STRING66 		AssignedAdjusterName;
		STRING12 		AssignedAdjusterID;
		STRING1 		ReserveCategory;
		STRING1 		ReserveTransactionType;
		STRING8 		DateReserveEstablished;
		STRING1 		SourceOfDateReserveEstablished := 'V';
		STRING12 		ReserveAmount; 
		STRING8			DateReserveChanged; 
		STRING8 		DateReserveClosed;
		STRING25 		TortThresholdType;
		STRING2 		TortThresholdState;
		STRING12 		DemandAmount;
		STRING12 		SettlementAmount;
		STRING1 		LawsuitFiled;
		STRING8 		LawsuitFilingDate;
		STRING1 		Physicaldamagetopartyvehicle;
		STRING1 		AttorneyInvolved;
		STRING8			DateofAttorneyInvolvement;
		STRING1			SourceOfDateofAttorneyInvolvement := 'V';
		STRING50 		PreExistingDisability;
		STRING1 		PartyPermanentlyDisabled;
		STRING 			DisabilityRating;
	End;
	
Export Casualty_Claim_rec := Record
		STRING15 		TortThresholdType;
		STRING2 		TortThresholdState;
		STRING12 		DemandAmount;
		STRING12 		SettlementAmount;
		STRING1 		LawsuitFiled;
		STRING8 		LawsuitFilingDate;
		STRING1 		Physicaldamagetopartyvehicle;
		STRING1 		AttorneyInvolved;
		STRING8			DateofAttorneyInvolvement;
		STRING1			SourceOfDateofAttorneyInvolvement := 'V';
		STRING50 		PreExistingDisability;
		STRING1 		PartyPermanentlyDisabled;
		STRING 			DisabilityRating;
end;
		
	Export		Reserve_Rec_new	:= Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;	
		String30 		parent_source;
		STRING30		ParentID;
		UNSIGNED8		Parent_Seq_No;
		UNSIGNED8		Coverage_Seq_No;
		STRING4 		CoverageType;
		UNSIGNED8		Reserve_Seq_No;
		STRING20 		ReserveID;
		STRING66 		AssignedAdjusterName;
		STRING12 		AssignedAdjusterID;
		STRING1 		ReserveCategory;
		STRING1 		ReserveTransactionType;
		STRING8 		DateReserveEstablished;
		STRING1 		SourceOfDateReserveEstablished := 'V';
		STRING12 		ReserveAmount; 
		STRING8			DateReserveChanged; 
		STRING8 		DateReserveClosed;
		Casualty_Claim_rec Casualty_Claim;
	End;
	
 	Export	Coverages_Rec	:= Record
   		STRING4 		CoverageType;
   		Dataset(Reserve_Rec) 	Reserves;
   	End;
   
   
   	Export	Coverages_Rec_new	:= Record
   		STRING6 		AMBest_Number;   
   		STRING50 		Claim_Number;
   		UNSIGNED8		LoadDateTime;
   		UNSIGNED8		Rec_Seq_No;		
   		String30 		parent_source;
   		STRING30		ParentID;
   		UNSIGNED8		Parent_Seq_No;
   		UNSIGNED8		Coverage_Seq_No;
   		STRING4 		CoverageType;
   		Dataset(Reserve_Rec) 	Reserves;
   	End;
   	


Export  ClaimInvolvedUnit_Rec := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		CIU_Seq_No;
		ContributionScrubClaimsCompass.Layouts.ClaimInvolvedUnits_Rec;
	End;

Export Salvage_Rec := record
		STRING1 		VINMissingInd;
		STRING1 		EngineMissingInd;
		STRING1 		TransmissionMissingInd;
		STRING8 		DateSalvageResolvedSold;
		STRING12 		ActualCashValuePriortoLoss;
		STRING12 		ValueReceived;
		STRING12 		ActualSalvageValue;
end;

Export Theft_Recovery_Rec := Record
		STRING50		RecoveringAgency;
		STRING30		RecoveryLocationCity;
		STRING20		RecoveryLocationCounty;
		STRING2 		RecoveryLocationState;
		STRING100		RecoveryLocation;
		dataset(Phone_Rec) 	RecoveringAgencyTelephone;
		STRING8 		RecoveredDate;
		STRING1 		ConditionofRecoveredStolenVehicle;
		STRING1 		TheftType;
end;

Export RepairFacility_Rec := record
		STRING100   RepairFacilityName;		
		both_addresses;	
end;

	Export  ClaimInvolvedUnit_Rec_new := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		CIU_Seq_No;
		STRING8			UnitID;
		STRING30 		OwnerPartyID;
		// STRING20 		PolicyID;
		Dataset({STRING30 PolicyId}) PolicyIds;
		STRING255		PropertyDamageDescription;
		STRING2 		NumberofOccupants;
		EstimateAppraisal_Rec_new	EstimateAppraisal;
		STRING1 		TotalLossInd;
		STRING1 		OwnerRetainingSalvage;
		STRING1 		UnrelatedPriorDamage;
		STRING12 		PriorDamageEstimateAmount;
		STRING1 		SupplementPresent;
		STRING12		SupplementAmount;
		STRING1 		AdditionalInsuranceCoverage;
		STRING2 		AdditionalFirstPartyInsuranceCoverage;
		RepairFacility_Rec RepairFacility;
		Theft_Recovery_Rec Theft_Recovery;
		Salvage_Rec	Salvage;
	End;	
	Export  ClaimInvolvedUnit_Rec_new1 := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		CIU_Seq_No;
		STRING8			UnitID;
		STRING30 		OwnerPartyID;
		STRING30    PolicyId;
		STRING255		PropertyDamageDescription;
		STRING2 		NumberofOccupants;
		EstimateAppraisal_Rec_new	EstimateAppraisal;
		STRING1 		TotalLossInd;
		STRING1 		OwnerRetainingSalvage;
		STRING1 		UnrelatedPriorDamage;
		STRING12 		PriorDamageEstimateAmount;
		STRING1 		SupplementPresent;
		STRING12		SupplementAmount;
		STRING1 		AdditionalInsuranceCoverage;
		STRING2 		AdditionalFirstPartyInsuranceCoverage;
		RepairFacility_Rec RepairFacility;
		Theft_Recovery_Rec Theft_Recovery;
		Salvage_Rec	Salvage;
	End;	
	
	
	Export Procedures_Rec	:= Record
		STRING12			ProcedureCode;
		STRING2 		CodeModifier1;
		STRING2 		CodeModifier2;
		STRING2 		CodeModifier3;
		STRING2 		CodeModifier4;
	End;
	
	Export MedicalBills_Rec	:= Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Party_Seq_No;
		STRING30		PartyID;
		UNSIGNED8 	medical_bill_seq_no;
	ContributionScrubClaimsCompass.Layouts.MedicalBills_Rec;
	End;	
	

	
	Export Parties_Rec := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Party_Seq_No;
		STRING30		PartyID;
ContributionScrubClaimsCompass.Layouts.Parties_Rec;
string1 sourcedatepartyadded;
  End;
	

	Export	PharmacyBills_Rec := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Party_Seq_No;
		STRING30		PartyID;
		UNSIGNED8 	pharmacy_bill_seq_no;
		
ContributionScrubClaimsCompass.Layouts.PharmacyBills_Rec;
	End;

	Export MedicalBills_Rec_new	:= Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Party_Seq_No;
		STRING30		PartyID;
		UNSIGNED8 	medical_bill_seq_no;		
		STRING42		MedicalBillID;
		STRING36		BillNumber;
		string1     isdup;
		STRING10			BillLineNumber;
		STRING36     MedicalProviderId;
		STRING11     TIN;
	
		STRING2 		PlaceofService;
		STRING25		TypeofService;
		STRING1			ServiceTypeUnit;
		STRING8			NumberofUnits;
		STRING8			BeginningDateofService;
		STRING8			EndingDateofService;
		STRING8			AdmittanceDate;
		STRING8			DischargeDate;
		STRING8			BillReceivedDate;
		STRING1			BillRejected;
		STRING2			DiagnosisVersionCode;
		Dataset({STRING11	DiagnosisCode}) DiagnosisCodes {MAXCOUNT(12)};
		STRING3 		DiagnosisRelatedGroupCode_DRG;
		Procedures_Rec Procedures;
		STRING12			ICDProcedureCode1;
		STRING12		ICDProcedureCode2;
		STRING12			ICDProcedureCode3;
		STRING12			ICDProcedureCode4;
		STRING12			ICDProcedureCode5;
		STRING4      RevenueCode;
		STRING12		ChargeAmount;
		STRING3 		AdjustmentNumber;
		STRING25		AdjustmentReason;
		String12  	PaidAmount;
		STRING36		BillingProviderID;
		both_addresses ProviderAddresses;
		dataset(Phone_Rec) ProviderPhoneNumbers;	
	End;	



Export MedicalProviders_Rec	:= Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Party_Seq_No;
		STRING30		PartyID;
		UNSIGNED8 	medical_provider_seq_no;
		STRING36		MedicalProviderId;
		STRING15			ProviderIDSuffix;
		STRING10		NationalProviderIdentificationNumber;
		STRING4			ProviderType;
		Dataset({STRING10 Taxonomy}) Taxonomies {MAXCOUNT(10)};	
		STRING60		FacilityName;
		STRING12		FacilityNumber;
		BothNames_Rec 		ProviderName;
	END;
	
	
export Provider_LNPID_layout	:= Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Party_Seq_No;
		STRING30		PartyID;
		// UNSIGNED8 	medical_provider_seq_no;		
		STRING36		MedicalProviderId;
		STRING15			ProviderIDSuffix;
		STRING10		NationalProviderIdentificationNumber;
		STRING1			ProviderType;
		STRING11 	  Tin;
		STRING5			TINSuffix;
		Dataset({STRING10 Taxonomy}) 	Taxonomies {MAXCOUNT(10)};
		STRING60		FacilityName;
		STRING12		FacilityNumber;
		BothNames_Rec 		ProviderName;
		both_addresses    ProviderAddresses;
		Dataset(Phone_Rec) 	ProviderPhoneNumbers;
		unsigned8 lnpid := 0;
	End;


Export Driver_rec := Record
		STRING25		LicenseNumber;
		STRING2			LicenseState;
		STRING2			RelationtoInsured;
end;
		
Export Parties_Rec_new := Record
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Party_Seq_No;
		UNSIGNED8		address_seq_no;
		STRING30		PartyID;
		STRING2			Type;
		Dataset({STRING30 PolicyID}) PolicyIDs;
		STRING8   	DatePartyAdded;
		String1     SourceDatePartyAdded;
		Dataset({String2 Role}) 	Roles;
		STRING11			SSN;
		STRING11			TIN;
		STRING11			FEIN;
		BothNames_Rec					NameParty;
		both_addresses PartyAddresses;
		// Dataset(both_addresses) PartyAddresses;
		Dataset(Phone_Rec)   	PartyPhoneNos;
		STRING8 		PartyDOB;
		STRING1			Gender;
		STRING1			MaritalStatus;
		STRING1			SeatbeltInd;
		STRING100		InjuryDesc;
		STRING2			InjurySeverityCode;
		STRING1			WageLossInd;
		Driver_rec	Driver;
		STRING1			Fatality;
		STRING1			PermissiveUse;
		STRING1			MedicareEligible;
		STRING3			PercentLiable;
		STRING1			LiabilityInd;
		STRING50		EmailAddress;
		STRING50		AlternateEmailAddress;
		STRING100		WhentoContact;
		STRING1			WheretoContact;
		STRING1			IndividualBusinessInd;
		STRING8     DateOfDeath;
  End;

	
export Person_header_raw := record
		UNSIGNED lexid;
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Party_Seq_No;
		STRING30		PartyID;
		STRING2			Type;
		STRING31		PolicyNumber; //---- Policy
		STRING1			ClaimPolicy;	//---- Policy
		STRING11			SSN;
		STRING11			TIN;
		STRING11			FEIN;
		BothNames_Rec;
		// Dataset(both_addresses) 	PartyAddresses;
		both_addresses ;
		Dataset(Phone_Rec)   	PartyPhoneNos;
		STRING8 		PartyDOB;
		STRING1			Gender;
		Driver_rec	Driver;
	// Parties_Rec_new;
end;
	
export Person_header := record
		UNSIGNED lexid;
		STRING6 		AMBest_Number;   
		STRING50 		Claim_Number;
		UNSIGNED8		LoadDateTime;
		UNSIGNED8		Rec_Seq_No;
		UNSIGNED8		Party_Seq_No;
		STRING30		PartyID;
		STRING2			Type;
		STRING31		PolicyNumber; //---- Policy
		STRING1			ClaimPolicy;	//---- Policy
		STRING11			SSN;
		STRING11			TIN;
		STRING11			FEIN;
		BothNames_Rec;
		// Dataset(both_addresses) 	PartyAddresses;
		both_addresses ;
		Phone_Rec   	PartyPhoneNos;
		STRING8 		PartyDOB;
		STRING1			Gender;
		Driver_rec	Driver;
	// Parties_Rec_new;
end;


End;