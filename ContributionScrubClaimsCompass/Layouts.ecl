export	Layouts	:=  module

 export  RecValidation := Record
	   unsigned4       claimgroupnumber :=0;
			string9					RejectCode;
			string40				FieldName;
			string100				RejectData;
			string100				RejDataPath;
			string100				RejDataPathText;
			unsigned4				ScrubTest;
			unsigned4				ScrubAction;
			boolean         trueReject  := false;
			boolean         multiReject := False;			
	End;
	 EXPORT	rRejectReport	:= RECORD
  	STRING440		ReportText;
  	STRING2			LF	:=	'\r\n';
  END;
	
	 EXPORT	rRejectReportSequenced	:=RECORD
  	UNSIGNED5		SequenceNumber;
  	rRejectreport;
  END;

	export	ScrubTracking	:=
	record
		unsigned4			RecordNumber;
		unsigned4			ClaimGroupNumber;
		unsigned4			FieldTest;
		unsigned4			FieldAction;
		boolean				IsRejected;
		// string1960		RejectCodes;
		Dataset(RecValidation) RejectCodes;
	end;

	export	lrejData	:=
	record
		 unsigned4			RecordNumber;
		 unsigned4			ClaimGroupNumber;
		 unsigned4			FieldTest;
		 unsigned4			FieldAction;
		 boolean				IsRejected;
		// string1960		RejectCodes;
		RecValidation RejectCodeData;
	end;

/////////////////////////////////////////////////////////////////////////////
	export	SequenceChecking	:=
	record
		ScrubTracking;
		string  		TextData{maxlength(2000)};
	end;
/////////////////////////////////////////////////////////////////////////////

	export	SummaryXML	:=
	record
		ScrubTracking;
		string  		TextData{maxlength(1000000)};
	end;
/////////////////////////////////////////////////////////////////////////////

	export	SummarySprayInp	:=
	record
		ScrubTracking;
		Spray_Layout.Claim_Rec Claim;
	end;
/////////////////////////////////////////////////////////////////////////////
	export Date_Tracking := Record 
		Dataset(RecValidation) RejectCodes;
		String8 Date;
	end;
	
	export Notes_Rec := RECORD
			STRING25 	NoteID;
    	STRING8 	EntryDate;
			STRING20 	Category;
			STRING65000		DetailedText;
			STRING40 	AuthorName;
			STRING12 	AuthorId;
	End;
	
	export Notes_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned   NoteseqNO;
		Notes_Rec;
	End;
	

	// MAC_PrepRecord(Notes_Rec, Notes_RecPrep, 'NOTE',	true);
	
	export Notes_Summary := Record
		ScrubTracking;
		Dataset(Notes_Rec) Notes;
	End;
	

 
	Export Payments_Rec:= Record
				STRING12 	PaymentID; 
				DATASET({String20 ReserveID}) 			ReserveIDs;
				DATASET({String42 MedicalBillID}) 	MedicalBillIDs;
				DATASET({String65 PharmacyBillID})  PharmacyBillIDs;
				STRING1 										PaymentCategory;
				STRING2 										PaymentSubCategory;
				STRING1 										PaymentTransactionType;
				STRING8 										DateofPayment;
				STRING12 										Amount;
				STRING1 										ManualCheckInd;
				STRING1 										PayeeType;
				STRING150 									PayeeName;
				STRING2 										AddressType; 
				STRING10 										StreetNumber;
				STRING161 										StreetName;
				STRING18 										ApartmentNumber;
				STRING30 										City;
				STRING2 										State;
				STRING5 										ZipCode;
				STRING4  										ZipCode4;
				STRING6  										NonUSPostalCode;
				STRING11  										PayeeSSNTINFEIN;
				STRING1 										TINEntityType;
	END;

	Export Payment_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		    unsigned   paymentseqno;				
				Payments_Rec;
				
	End;
	
Export Payments_Rec_new:= Record
				STRING12 	                 PaymentID; 
				String20                   ReserveID;
				String42                   MedicalBillID;
				String65                   PharmacyBillID;
				STRING1 										PaymentCategory;
				STRING2 										PaymentSubCategory;
				STRING1 										PaymentTransactionType;
				STRING8 										DateofPayment;
				STRING12 										Amount;
				STRING1 										ManualCheckInd;
				STRING1 										PayeeType;
				STRING150 									PayeeName;
				STRING2 										AddressType; 
				STRING10 										StreetNumber;
				STRING161 										StreetName;
				STRING18 										ApartmentNumber;
				STRING30 										City;
				STRING2 										State;
				STRING5 										ZipCode;
				STRING4  										ZipCode4;
				STRING6  										NonUSPostalCode;
				STRING11  										PayeeSSNTINFEIN;
				STRING1 										TINEntityType;
	END;

	Export Payment_Trackingnew := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		    unsigned   paymentseqno;				
				Payments_Rec_new;
				
	End;
	
	Export SIUReferral_Rec  := Record
				STRING12 										SIUReferralID;
				DATASET({String20 ReserveID}) ReserveIDs;
				STRING8 										DateReferred;
				STRING8                     DateInvestigationClosed;
				STRING50										TypeofReferral;
				STRING250									 	ReferralReason;
				STRING2										 	Disposition;
				STRING12									 	MitigatedAmount;
				STRING1										 	Mitigated;
				STRING1										 	ReferredtoNICB;
				STRING15									 	NICBReferralNumber;
	End;
	
	Export SIUReferral_Tracking := Record
				ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
				unsigned siuseqno;
				SIUReferral_Rec;
	End;
	
  Export SIUReferral_Rec_new  := Record
				STRING12 										SIUReferralID;
				String20                    ReserveID;
				STRING8 										DateReferred;
				STRING8                     DateInvestigationClosed;
				STRING50										TypeofReferral;
				STRING250									 	ReferralReason;
				STRING2										 	Disposition;
				STRING12									 	MitigatedAmount;
				STRING1										 	Mitigated;
				STRING1										 	ReferredtoNICB;
				STRING15									 	NICBReferralNumber;
	End;
	
	Export SIUReferral_Trackingnew := Record
				ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
				unsigned siuseqno;
				SIUReferral_Rec_new;
	End;	
	
	Export Subrogations_Rec:=Record
				STRING12									 	SubrogationID;
				DATASET({String20 ReserveID}) ReserveIDs;
				STRING1 										SubroIndicator;
				STRING8											SubroOpenDate;
				STRING8											SubroClosedDate;
				STRING12									 	RecoveryAmount;
				STRING8											RecoveryDate;
				STRING1 										RecoveryCategory;
				STRING1					 						Subrogationpotentialind;
	END;

	Export Subrogations_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned subrogationseqno;
				Subrogations_Rec;
	End;
	
	Export Subrogations_Rec_new:=Record
				STRING12									 	SubrogationID;
				String20                    ReserveID;
				STRING1 										SubroIndicator;
				STRING8											SubroOpenDate;
				STRING8											SubroClosedDate;
				STRING12									 	RecoveryAmount;
				STRING8											RecoveryDate;
				STRING1 										RecoveryCategory;
				STRING1					 						Subrogationpotentialind;
	END;
Export Subrogations_Trackingnew := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned subrogationseqno;
				Subrogations_Rec_new;
	End;

	Export Name_Rec := Record
				STRING4														NamePrefix;
				STRING25													FirstName;
				STRING15													MiddleName;
				STRING28													LastName;
				STRING3														NameSuffix;
				STRING50													BusinessName;
	End;
	
	Export Name_Tracking := Record
				Dataset(RecValidation) RejectCodes;
				Name_Rec;
	End;
	
	Export Field_Tracking := Record
				Dataset(RecValidation) RejectCodes;
				String FieldValue;
	End;
	
	Export Address_Rec := Record
				STRING2														AddressType;
				STRING10													StreetNumber;
				STRING161													StreetName;
				STRING18													ApartmentNumber;
				STRING30													City;
				STRING2														State;
				STRING5														ZipCode;
				STRING4														ZipCode4;
				STRING6														NonUSPostalCode;
	End;
	
	Export Address_Tracking := Record
				Dataset(RecValidation) RejectCodes;
				Address_Rec;
	End;

	Export Phone_Rec := Record
				STRING2 													Classification; 
				STRING3 													CountryCodeExchange; 		
				STRING3 													AreaCode; 
				STRING7 													PhoneNumber; 
				STRING10 													Extension; 
				STRING1 													PrimaryPhoneIndicator;
	End;

	Export Phone_Tracking := Record
				Dataset(RecValidation) RejectCodes;
				Phone_Rec;
	End;
	
	Export PolicyHolder_Rec := Record
				Name_rec 													Name;
			  Dataset(Address_Rec)							Addresses;
	End;

	Export PolicyHolder_Tracking := Record
				Dataset(RecValidation) RejectCodes;
				PolicyHolder_Rec;
	End;
	
	Export Policies_Rec :=Record
				STRING30									 				PolicyID;
				STRING31								 	 				PolicyNumber;
				STRING31								 	 				Orig_PolicyNumber;
				STRING1							 			 				ClaimPolicy;
				STRING2			 							 				InsuranceType;
				STRING100							 		 				InsuranceCompany;
				STRING30 									 				UnderwritingOrganization;
				STRING2											 			PolicyType;
				STRING1										 				RiskType;
				STRING2										 				PolicyState;
				STRING8										 				InceptionDate;
				STRING8										 				TermEffectiveDate;
				STRING8										 				TermExpirationDate;
				STRING8 									 				CancellationDate;
				STRING4										 				CancellationReasonCode;
				STRINg8										 				ReinstatementDate;
				Dataset(PolicyHolder_Rec)				  PolicyHolders;
				// Dataset(Name_Rec) 								PolicyholderNames;
				// Dataset(Address_Rec)  						PolicyholderAddresses;		
				STRING50 									 				AdditionalInsuredName; 
				STRING2		 												AdditionalInsuredType;
				STRING8 													SicOrNAICCode;
				STRING3	 													PaymentMethod;
				STRING30													AgencyName;	    
				STRING50													AgencyEmailAddress;	    
				STRING255													AgencyCode;	    
				STRING5	 													AgencySubCode;
				STRING10 													NationalProducerNumber;	
			END;

	Export Policies_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned PolicySeqNo;
				Policies_Rec;
	End;
	
	// Export ReserveId_Tracking := Record
				// Dataset(RecValidation) RejectCodes;
				// ReserveID_Rec;
	// End;

	Export EstimateAppraisal_Rec :=	Record
			STRING8 		EstimateAppraisalDate;
			STRING12		Amount;
			STRING2 		PerformedBy;
			STRING66 		AppraiserName; 
			Address_Rec Location;
	End;	

	Export LeasingFinanceCompany_Rec := Record
			STRING2 		Type;
			STRING50		Name;				
			Address_Rec LeasingFinanceAddress;			
	END;

	Export LeasingFinanceCompany_Tracking := Record
		Dataset(RecValidation) RejectCodes;
		LeasingFinanceCompany_Rec;			
	End;
	
	Export Vehicle_Rec := Record
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
			Dataset(LeasingFinanceCompany_Rec) LeasingFinanceCompany;
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
			Address_Rec Wherevehicleseen;
			STRING1 		TitleDisposition;
			STRING1 		DriveableInd;
			STRING1 		Disposition;
	End;

	export Vehicle_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned Vehicleseqno;
		Vehicle_Rec;
	End;

	Export Reserve_Rec:= Record
		 STRING20 		ReserveID;
		 STRING66 		AssignedAdjusterName;
		 STRING12 		AssignedAdjusterID;
		 STRING1 			ReserveCategory;
		 STRING1 			ReserveTransactionType;		
		 STRING8 			DateReserveEstablished;		
		 STRING12 		ReserveAmount; 
		 STRING8		 	DateReserveChanged; 
		 STRING8 		  DateReserveClosed;
		 STRING25			TortThresholdType;
		 STRING2 			TortThresholdState;
		 STRING12 		DemandAmount;
		 STRING12 		SettlementAmount;
		 STRING1 			LawsuitFiled;
		 STRING8 			LawsuitFilingDate;
		 STRING1 			Physicaldamagetopartyvehicle;
		 STRING1 			AttorneyInvolved;
		 STRING8		 	DateofAttorneyInvolvement;
		 STRING50 		PreExistingDisability;
		 STRING1 			PartyPermanentlyDisabled;
		 STRING3 			DisabilityRating;

	END;

	export Reserve_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned reserveseqno;
		unsigned partyseqno;
		unsigned coverageseqno;
		Reserve_Rec;
	End;
	
	export Reserve_Tracking1 := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned reserveseqno;
		unsigned CIUseqno;
		unsigned coverageseqno;
	 Reserve_Rec;
	End;

 EXPORT TheftRecovery_Rec := record
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
  EXPORT	Salvage_Rec := record
		STRING1 		VINMissingInd;
		STRING1 		EngineMissingInd;
		STRING1 		TransmissionMissingInd;
		STRING8 		DateSalvageResolvedSold;
		STRING12 		ActualCashValuePriortoLoss;
		STRING12 		ValueReceived;
		STRING12 		ActualSalvageValue;
			end;			
	Export Coverages_Rec :=	Record
		 STRING4 			CoverageType;
		 Dataset(Reserve_Rec) Reserves;		
	End;

	Export Coverages_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned partyseqno;
	  unsigned coverageseqno;
		Coverages_Rec;		 
	End;
	Export Coverages_Tracking1 := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned CIUseqno;
		unsigned coverageseqno;
		Coverages_Rec;		 
	End;
	export RepairFacility_Rec :=
	record
		STRING100   RepairFacilityName;
		Address_Rec;	
	end;
	Export ClaimInvolvedUnits_Rec := Record
			STRING8			UnitID;
			STRING30 		OwnerPartyID;
			Dataset({STRING30 PolicyId}) PolicyIds;
			STRING255		PropertyDamageDescription;
			STRING2 		NumberofOccupants;		
			EstimateAppraisal_Rec EstimateAppraisal;			
			STRING1 		TotalLossInd;
			STRING1 		OwnerRetainingSalvage;
			STRING1 		UnrelatedPriorDamage;
			STRING12 		PriorDamageEstimateAmount;
			STRING1 		SupplementPresent;
			STRING12		SupplementAmount;
			STRING1 		AdditionalInsuranceCoverage;
			STRING2 		AdditionalFirstPartyInsuranceCoverage;	
			RepairFacility_Rec RepairFacility;	
			Vehicle_Rec Vehicle;	
			TheftRecovery_Rec TheftRecovery;	
			Salvage_Rec Salvage;
			Dataset(Coverages_Rec) Coverages;					
	End;
	Export ClaimInvolvedUnits_Recnew := Record
			STRING8			UnitID;
			STRING30 		OwnerPartyID;
			STRING30    PolicyId;
			STRING255		PropertyDamageDescription;
			STRING2 		NumberofOccupants;		
			EstimateAppraisal_Rec EstimateAppraisal;			
			STRING1 		TotalLossInd;
			STRING1 		OwnerRetainingSalvage;
			STRING1 		UnrelatedPriorDamage;
			STRING12 		PriorDamageEstimateAmount;
			STRING1 		SupplementPresent;
			STRING12		SupplementAmount;
			STRING1 		AdditionalInsuranceCoverage;
			STRING2 		AdditionalFirstPartyInsuranceCoverage;
			RepairFacility_Rec RepairFacility;	
			Vehicle_Rec Vehicle;	
			TheftRecovery_Rec TheftRecovery;	
			Salvage_Rec Salvage;
			Dataset(Coverages_Rec) Coverages;				
	End;
	Export ClaimInvolvedUnits_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned CIUseqno;
		ClaimInvolvedUnits_Rec;		 
	End;

  Export ClaimInvolvedUnits_Trackingnew := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned CIUseqno;
		ClaimInvolvedUnits_Recnew;		 
	End;
	Export Roles_Rec:= RECORD 
				STRING2 Role;
	END;

	Export Procedures_Rec := Record
		 STRING5			ProcedureCode;
		 STRING2 			CodeModifier1;
		 STRING2 			CodeModifier2;
		 STRING2 			CodeModifier3;
		 STRING2 			CodeModifier4;
	End;

	Export Procedures_Tracking := Record
		Dataset(RecValidation) RejectCodes;
		Procedures_Rec;		 
	End;
	
	Export MedicalBills_Rec	:=	Record
		 STRING42			MedicalBillID;
		 STRING36			BillNumber;
		 STRING10			BillLineNumber;
		 STRING1      ISDup;
     STRING36     MedicalProviderId;
		 STRING11      TIN;
		 STRING2 			PlaceofService;
		 STRING25			TypeofService;
		 STRING1			ServiceTypeUnit;
		 STRING8			NumberofUnits;
		 STRING8	 		BeginningDateofService;
		 STRING8	 		EndingDateofService;
		 STRING8	 		AdmittanceDate;
		 STRING8	 		DischargeDate;
		 STRING8	 		BillReceivedDate;
		 STRING1			BillRejected;
		 STRING2			DiagnosisVersionCode;
		 Dataset({STRING10	DiagnosisCode}) DiagnosisCodes;
		 STRING3 			DiagnosisRelatedGroupCode_DRG;  
		 STRING12			ProcedureCode;
		 STRING2 			CodeModifier1;
		 STRING2 			CodeModifier2;
		 STRING2 			CodeModifier3;
		 STRING2 			CodeModifier4;
		 STRING12			ICDProcedureCode1;
		 STRING12			ICDProcedureCode2;
		 STRING12			ICDProcedureCode3;
		 STRING12			ICDProcedureCode4;
		 STRING12			ICDProcedureCode5;
		 STRING4      RevenueCode;
		 STRING12			ChargeAmount;
		 STRING3 			AdjustmentNumber;
		 STRING25			AdjustmentReason;
		 String12  		PaidAmount;		
		 STRING36			BillingProviderID;
		 dataset(Address_Rec) ProviderAddresses;
		 dataset(Phone_Rec) ProviderPhoneNumbers;
	End;

	Export MedicalBills_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned medicalbillseqno;
		unsigned partyseqno;
		MedicalBills_Rec;		 
	End;

  Export MedicalBills_Recnew	:=	Record
		 STRING42			MedicalBillID;
		 STRING36			BillNumber;
		 STRING10			BillLineNumber;
		 STRING1      ISDup;
		 STRING36     MedicalProviderId;
		 STRING11      TIN;
		 STRING2 			PlaceofService;
		 STRING25			TypeofService;
		 STRING1			ServiceTypeUnit;
		 STRING8			NumberofUnits;
		 STRING8	 		BeginningDateofService;
		 STRING8	 		EndingDateofService;
		 STRING8	 		AdmittanceDate;
		 STRING8	 		DischargeDate;
		 STRING8	 		BillReceivedDate;
		 STRING1			BillRejected;
		 STRING2			DiagnosisVersionCode;
		 STRING10	    DiagnosisCode;
		 STRING3 			DiagnosisRelatedGroupCode_DRG;  
		 STRING12			ProcedureCode;
		 STRING2 			CodeModifier1;
		 STRING2 			CodeModifier2;
		 STRING2 			CodeModifier3;
		 STRING2 			CodeModifier4;
		 STRING12			ICDProcedureCode1;
		 STRING12			ICDProcedureCode2;
		 STRING12			ICDProcedureCode3;
		 STRING12			ICDProcedureCode4;
		 STRING12			ICDProcedureCode5;
		 STRING4      RevenueCode;
		 STRING12			ChargeAmount;
		 STRING3 			AdjustmentNumber;
		 STRING25			AdjustmentReason;
		 String12  		PaidAmount;		
		 STRING36			BillingProviderID;
		 dataset(Address_Rec) ProviderAddresses;
		 dataset(Phone_Rec) ProviderPhoneNumbers;
	End;

	Export MedicalBills_Trackingnew := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned medicalbillseqno;
		MedicalBills_Recnew;		 
	End;
	
	Export PharmacyBills_Rec := Record
		 STRING65		PharmacyBillID;
		 STRING55		BillNumber;
		 STRING10		BillLineNumber;
		 STRING36   MedicalProviderId;
		 STRING1		TransactionType;
		 STRING12		ChargeAmount;
		 STRING12   PaidAmount;		
		 STRING12		PrescriptionNumber;
		 STRING8		PrescriptionSequenceNumber;
		 STRING8 		PrescriptionWrittenDate;	
		 STRING8 		DatePrescriptionFilled;		
	END;

	Export PharmacyBills_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
	unsigned	pharmacybillseqno;
	unsigned partyseqno;
		PharmacyBills_Rec;		 
	End;
	
	Export MedicalProviders_Rec	:= Record
			STRING36		ProviderID;
			STRING15			ProviderIDSuffix;
			STRING10		NationalProviderIdentificationNumber;
			STRING1			ProviderType;
			Dataset({STRING10 Taxonomy}) Taxonomies;	
			STRING60		FacilityName;
			STRING12		FacilityNumber;
			Name_Rec 		ProviderName;
	END;

	Export MedicalProviders_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned medicalproviderseqno;
		unsigned partyseqno;
		MedicalProviders_Rec;		 
	End;

  Export MedicalProviders_Recnew	:= Record
			STRING36		ProviderID;
			STRING15			ProviderIDSuffix;
			STRING10		NationalProviderIdentificationNumber;
			STRING1			ProviderType;
			STRING10    Taxonomy;	
			STRING60		FacilityName;
			STRING12		FacilityNumber;
			Name_Rec 		ProviderName;
	END;

	Export MedicalProviders_Trackingnew := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		unsigned medicalproviderseqno;
		MedicalProviders_Recnew;		 
	End;
	
		Export Parties_Rec := Record 
			STRING30		PartyID;
			STRING2			Type;
			Dataset({STRING30 PolicyID}) PolicyIDs;
			STRING8   	DatePartyAdded;	
			Dataset({String2 Role}) Roles;			
			STRING11			SSN;
			STRING11			TIN;
			STRING11			FEIN;
			Name_Rec 		NameParty;
			Dataset(Address_Rec) PartyAddresses;
			Dataset(Phone_Rec)   PartyPhoneNos;
			STRING8 		PartyDOB;
			STRING1			Gender;
			STRING1			MaritalStatus;
			STRING1			SeatbeltInd;
			STRING100		InjuryDesc;
			STRING2			InjurySeverityCode;
			STRING1			WageLossInd;
			STRING25		LicenseNumber;
			STRING2			LicenseState;
			STRING2			RelationtoInsured;			
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
			Dataset(Coverages_Rec) Coverages;	
			Dataset(MedicalBills_Rec) MedicalBills;
			Dataset(PharmacyBills_Rec) PharmacyBills;	
			Dataset(MedicalProviders_Rec) MedicalProviders;		
	End;

	Export Parties_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		    unsigned partyseqno;
				Parties_Rec;
	End;
	
	Export Parties_Recnew := Record 
			STRING30		PartyID;
			STRING2			Type;
			STRING30 PolicyID;
			STRING8   	DatePartyAdded;	
			Dataset({String2 Role}) Roles;			
			STRING11			SSN;
			STRING11			TIN;
			STRING11			FEIN;
			Name_Rec 		NameParty;
			Dataset(Address_Rec) PartyAddresses;
			Dataset(Phone_Rec)   PartyPhoneNos;
			STRING8 		PartyDOB;
			STRING1			Gender;
			STRING1			MaritalStatus;
			STRING1			SeatbeltInd;
			STRING100		InjuryDesc;
			STRING2			InjurySeverityCode;
			STRING1			WageLossInd;
			STRING25		LicenseNumber;
			STRING2			LicenseState;
			STRING2			RelationtoInsured;			
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
			Dataset(Coverages_Rec) Coverages;	
			Dataset(MedicalBills_Rec) MedicalBills;
			Dataset(PharmacyBills_Rec) PharmacyBills;	
			Dataset(MedicalProviders_Rec) MedicalProviders;		
	End;

  Export Parties_Trackingnew := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		    unsigned partyseqno;
				Parties_Recnew;	
	end;
	Export PrimaryAdjuster_Rec := Record
				STRING66 	Name; 
				STRING12 	ID; 	
  			Dataset(Phone_Rec)  PhoneNumbers;
				// STRING2 	TelClassification; 
				// STRING3 	TelCountryCodeExchange; 		
				// STRING3 	TelAreaCode; 
				// STRING7 	TelPhoneNumber; 
				// STRING10 	TelExtension; 
				// STRING1 	TelPrimaryPhoneIndicator;	
	End;

	Export PrimaryAdjuster_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
				PrimaryAdjuster_Rec;
	End;
	
	Export Claim_Rec	:=	Record
				unsigned4 RawRecordNumber;
				string9  	AccountNumber;
				string1  	Typeofupdate;
				STRING8 	ValuationDate;
				STRING50 	Claim_Number;
				STRING50 	Orig_Claim_Number;
				STRING6 	AMBest_Number;   
				STRING5 	NAIC_Code; 
				STRING8 	DateofLoss;					
				STRING25  TimeofLoss;
				STRING8 	DateReported; 					
				STRING255	LossLocation;	
				STRING2  	LossLocationState;	
				STRING2	 	LocationAddressType;   
				STRING10 	LocationAddressStreetNumber;    
				STRING161 	LocationAddressStreetName;  
				STRING18 	LocationAddressApartmentNumber;  
				STRING30 	LocationAddressCity;  
				STRING2  	LocationAddressState;  
				STRING5	 	LocationAddressZipCode;  
				STRING4	 	LocationAddressZipCode4; 
				STRING6	 	LocationAddressNonUSPostalCode; 
				STRING1500 LossDescriptionField;
				STRING2  	LossTypeCategory;
				STRING1  	AuthoritiesContactedPoliceReportFiled;
				STRING1  	AtFaultIndicator; 
				STRING3  	PercentLiable; 
				STRING2  	WeatherConditions; 
				STRING50 	ClaimHandlingOfficeId; 
				STRING40 	ClaimHandlingOffice; 
				STRING1  	FastPayindicator; 
				PrimaryAdjuster_Rec PrimaryAdjuster;
				STRING1 	MultiVehicleInd; 
				STRING1 	HitandRunInd; 
				STRING1 	CatastropheInd; 
				STRING10 	CatastropheNumber; 
				STRING2 	WhoReportedLoss; 
				STRING1 	HowLosswasReported; 
				STRING1 	ClaimDisposition; 	
				STRING8 	ClosedDate;
				STRING1 	AmbulancetoScene;
				STRING1 	SuitIndicator;	
				STRING8 	DateInsuranceCoReceived;		
				STRING1 	ReportType_ReportingStatus;
				STRING25 	ReferenceNumber;
				STRING1 	PreviouslyReported;
				STRING1 	LossViolations_Citations;
				STRING255 Remarks;
				STRING1 	PhantomVehicleAccidentIndicators;
				STRING1 	Accidentwitnessed;			
				STRING1 	Molddamageclaimed;		
				STRING50	InvestigatingAgencyName;	 		//Missing in XML
				STRING2 	InvestigatingAgencyType;
				STRING66 	InvestigatingAgencyOfficerName;
				STRING6 	InvestigatingAgencyPrecinct;
				STRING20 	InvestigatingAgencyReportCaseNumber;
				STRING8   InvestigatingAgencyDateOfIncidentReport;
				STRING2 	InvestigatingAgencyAddressType;
				STRING10 	InvestigatingAgencyAddrStreetNumber;
				STRING161	InvestigatingAgencyAddrStreetName;
				STRING18 	InvestigatingAgencyAddrApartmentNumber;	 
				STRING30 	InvestigatingAgencyAddrCity;	   
				STRING2 	InvestigatingAgencyAddrState;	   
				STRING5 	InvestigatingAgencyAddrZipcode;	   
				STRING4 	InvestigatingAgencyAddrZip4;				
				STRING6 	InvestigatingAgencyAddrNonUSPostalCode;				
				STRING2   StateOfJurisdiction;
				STRING2   ClaimType;
				STRING6   WCClassCode;
				
				Dataset(Notes_Rec) 						Notes;
				
				Dataset(Payments_Rec) 				Payments;
				
				Dataset(SIUReferral_Rec) 			SIUReferrals;
				
				Dataset(Subrogations_Rec) 		Subrogations;
				
				Dataset(Policies_Rec) 				Policies;
				
				Dataset(Parties_Rec) 					Parties;
				
				Dataset(ClaimInvolvedUnits_Rec) ClaimInvolvedUnits;
	End;

	// MAC_PrepRecord(Claim_Rec, Claim_RecPrep, 'Claim',	true);
		
	EXPORT Claim_Tracking := Record
		ContributionScrubClaimsCompass.Spray_Layout.ScrubTracking;
		Claim_Rec;
	End;
	Export Claim_rec1   := Record
	unsigned4 claimgroupnumber;
	
	Claim_Rec;
	end;
	// export Claim_Prep := Record
		// ScrubTracking;
		// Claim_RecPrep;
	// End;

	EXPORT t_flatrec := record
		STRING40 fldValue;
	END;				
			 Export Payments_RecO := Record
				STRING12 	PaymentID; 
				STRING20 	ReserveID;
				STRING42 MedicalBillID;
				STRING42 PharmacyBillID;
				DATASET(t_flatrec) ReserveIDList;
				DATASET(t_flatrec) MedicalBillIDList;
				DATASET(t_flatrec) PharmacyBillIDList;
				//SET OF STRING2 	ReserveID;
				//SET OF STRING2 MedicalBillID;
				//SET OF STRING2 PharmacyBillID;
				//DATASET(t_flatrec) ReserveID;					
				//DATASET(t_flatrec) MedicalBill;		
				//DATASET(t_flatrec) PharmacyBill;
				//STRING20 	ReserveID;
				STRING1 	PaymentTransactionType;
				STRING8 	DateofPayment;
				STRING15 	Amount;
				STRING1 	ManualCheckInd;
				STRING1 	PayeeType;
				STRING150 PayeeName;
				STRING2 	AddressType; 
				STRING10 	StreetNumber;
				STRING161 	StreetName;
				STRING18 	ApartmentBuildingNumber;
				STRING30 	City;
				STRING2 	State;
				STRING5 	ZipCode;
				STRING4  	ZipCode4;
				STRING15 	PayeeSSNTINFEIN;
				STRING15 	TINEntityType;
			 END;
			 
// MAC_PrepRecord(Payments_Rec, Payments_RecPrep, 'PAYMENT',true);
	
	// export Payments_Prep := Record
		// ScrubTracking;
		// Payments_RecPrep;
	// end;	
/* 	Export Account_Rec := Record
   		String11 		AccountNumber;
   		String1 		AccountStatus;
   		String100		AccountName;
   		String20 		ProductCode;
   		String30 		ProductName;
   		String255 	ProductDescription;
   	End;
*/

  Export Account_Rec := Record
   		String11 		AccountNumber;
   		String1 		AccountStatus;
			string5 		CustomerNumber;
   		String30 		CustomerName;
   		String 			ReturnNode;
   		String1 		fraud_model_cf02_flag;
			String1 		subro_model_cf03_flag;
			String1 		ccfc_allowed_flg;
			String1 		cdsc_allowed_flg;
			String1 		custom_fraud_business_rule_flag;
			String1 		carrier_watch_list_flag;
			String1 		nicb_watch_list_flag;
			String1 		flg_nicb_member;
   	End;

  Export Account_Rec_new := Record
   		String11 		AccountNumber;
   		String1 		AccountStatus;
			string5 		CustomerNumber;
   		String30 		CustomerName;
   		String 			ReturnNode;
   		String1 		fraud_model_cf02_flag;
			String1 		subro_model_cf03_flag;
			String1 		ccfc_allowed_flg;
			String1 		cdsc_allowed_flg;
			String1 		custom_fraud_business_rule_flag;
			String1 		carrier_watch_list_flag;
			String1 		nicb_watch_list_flag;
			String1 		flg_nicb_member;
			String1 		auto_carriers_share_data;
			String1 		workers_carriers_share_data;
			String1 		auto_share_with_fdn;
			String1 		workers_share_with_fdn;
   	End;
		
	Export DateRuleRec := Record
		Unsigned4   CompareType;
		String8			CompareDate;
		String10    RejectCode;
	End;

	EXPORT CDFCContribWithBatch := RECORD (Claim_Rec)
		Unsigned8 		SequenceId;
		STRING9 			Batch_Id;
		UNSIGNED8 		RecordNumber;
		UNSIGNED8			ClaimGroupNumber;
		string9      Customernumber;
		string       Contribution;
		STRING9   		Contributor_Id;
		String1 		auto_carriers_share_data;
		String1 		workers_carriers_share_data;
		String1 		auto_share_with_fdn;
		String1 		workers_share_with_fdn;
		UNSIGNED1			File_Seq;
	END;	

	export RejCodeMapping :=
	record
		unsigned4				CodeFlag;
		string20        RejectCode;
	end;

	EXPORT DateErrorMessageLayout	:= RECORD
		string			FieldName;
		Unsigned4   CompareType;
		string			ErrorCode;
	END;

end;