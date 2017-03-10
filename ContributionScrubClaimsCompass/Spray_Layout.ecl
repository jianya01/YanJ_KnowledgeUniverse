// Import ContributionScrubs;
EXPORT Spray_Layout := Module

	Export Field_Rec := Record
		STRING 				FieldValue 										{xpath('')};
	End;
	
	Export Date_Rec:= Record
		 STRING 			Month  												{XPATH('Month')};
		 STRING 			Day  	 												{XPATH('Day')};
		 STRING 			Year   												{XPATH('Year')};
	End;

	Export Address_Rec := Record
		 STRING 			AddressType										{XPATH('Type')};
		 STRING 			StreetNumber									{XPATH('StreetNumber')};
		 STRING 			StreetName										{XPATH('StreetName')};
		 STRING 			ApartmentNumber								{XPATH('ApartmentBuildingNumber')};
		 STRING 			City													{XPATH('City')};
		 STRING 			State													{XPATH('State')};
		 STRING 			Zipcode												{XPATH('Zipcode')};
		 STRING 			ZipCode4 											{XPATH('Zip4')};		 
		 STRING 			NonUSPostalCode								{XPATH('NonUSPostalCode')};		 
	End;

	Export Phone_Rec := Record
		 STRING 			Classification 								{XPATH('Classification')}; 
		 STRING 			CountryCodeExchange 					{XPATH('CountryCodeExchange')}; 		
		 STRING 			AreaCode 											{XPATH('AreaCode')}; 
		 STRING 			PhoneNumber 									{XPATH('PhoneNumber')}; 
		 STRING 			Extension 										{XPATH('Extension')}; 
		 STRING 			PrimaryPhoneIndicator 				{XPATH('PrimaryPhone')};
	End;

	Export Name_Rec := Record
		 STRING 			NamePrefix 										{XPATH('Prefix')};
		 STRING 			FirstName 										{XPATH('First')};
		 STRING 			MiddleName 										{XPATH('Middle')};
		 STRING 			LastName 											{XPATH('Last')};
		 STRING 			NameSuffix 										{XPATH('Suffix')};
		 STRING 			BusinessName 									{XPATH('BusinessName')}; 
	End;	

	Export PrimaryAdjuster_Rec := Record
		 STRING 			Name 													{XPATH('Name')}; 
		 STRING 			ID 														{XPATH('Id')}; 		
		 Dataset(Phone_Rec) PrimaryAdjPhoneNums			{XPATH('TelephoneNumbers/TelephoneNumber')};
	END;

	Export InvestigatingAgency_Rec	:= Record
		 STRING 			Name 													{XPATH('Name')};	 		//Missing in XML
		 STRING 			Type 													{XPATH('Type')};
		 STRING 			OfficerName 									{XPATH('OfficerName')};
		 STRING 			Precinct 											{XPATH('Precinct')};
		 STRING 			ReportCaseNumber 							{XPATH('ReportCaseNumber')};
		 Date_Rec		 	DateofIncidentReport		 			{XPATH('DateOfIncidentReport')};
		 Dataset(Address_Rec) AgencyAddress 				{XPATH('AgencyAddress')};
	End;

	Export Note_Rec := Record 		
	   STRING 			NoteID 							 					{XPATH('Id')};
		 Date_Rec 		EntryDate  										{XPATH('EntryDate')};		
		 STRING 			Category 											{XPATH('Category')}; 
		 STRING 			DetailedText 									{XPATH('DetailedText')}; 
		 STRING 			AuthorName 										{XPATH('AuthorName')};
		 STRING 			AuthorId 											{XPATH('AuthorId')};
	End;				

	Export DriverInfo_Rec  := Record
		 STRING 			LicenseNumber 								{XPATH('LicenseNumber')};
		 STRING 			LicenseState 									{XPATH('LicenseState')};
		 STRING 			RelationtoInsured 						{XPATH('RelationToInsured')};
	End;

	Export CasualtyClaim_Rec:=Record
		 STRING 			TortThresholdType  						{XPATH('TortThresholdType')};
		 STRING 			TortThresholdState  					{XPATH('TortThresholdState')};
		 STRING 			DemandAmount  								{XPATH('DemandAmount')};
		 STRING 			SettlementAmount 							{XPATH('SettlementAmount')};
		 STRING 			LawsuitFiled 									{XPATH('LawsuitFiled')};
		 Dataset(Date_Rec) LawsuitFilingDate    		{XPATH('LawsuitFilingDate')};
		 STRING 			Physicaldamagetopartyvehicle {XPATH('PhysicalDamageToPartyVehicle')};
		 STRING 			AttorneyInvolved  						{XPATH('AttorneyInvolved')};
		 Dataset(Date_Rec) DateofAttorneyInvolvement {XPATH('DateOfAttorneyInvolvement')};
		 STRING 			PreExistingDisability  				{XPATH('PreExistingDisability')};
		 STRING 			PartyPermanentlyDisabled  		{XPATH('PartyPermanentlyDisabled')};
		 STRING 			DisabilityRating  						{XPATH('DisabilityRating')};
	END;	

	Export Reserve_Rec:= Record
		 STRING 			ReserveID  										{XPATH('ReserveId')};
		 STRING 			AssignedAdjusterName  				{XPATH('AssignedAdjusterName')};
		 STRING 			AssignedAdjusterID  					{XPATH('AssignedAdjusterId')};
		 STRING 			ReserveCategory  							{XPATH('ReserveCategory')};
		 STRING 			ReserveTransactionType  			{XPATH('ReserveTransactionType')};		
		 Dataset(Date_Rec) DateReserveEstablished		{XPATH('DateReserveEstablished')};		
		 STRING 			ReserveAmount  								{XPATH('ReserveAmount')}; 
		 Dataset(Date_rec) DateReserveChanged		  	{XPATH('DateReserveChanged')}; 
		 Dataset(Date_rec) DateReserveClosed	  		{XPATH('DateReserveClosed')};
		 Dataset(CasualtyClaim_Rec) CasualtyClaims	{XPATH('CasualtyClaim')};
	END;

	Export Coverages_Rec :=	Record
		 STRING 			CoverageType  								{XPATH('Type')};
		 Dataset(Reserve_Rec) Reserves    					{XPATH('Reserves/Reserve')};		
	End;

	Export Procedures_Rec:=Record
		 STRING 			ProcedureCode 								{XPATH('Code')};
		 STRING 			CodeModifier1 								{XPATH('CodeModifier1')};
		 STRING 			CodeModifier2 								{XPATH('CodeModifier2')};
		 STRING 			CodeModifier3 								{XPATH('CodeModifier3')};
		 STRING 			CodeModifier4 								{XPATH('CodeModifier4')};
	End;

	Export MedicalBills_Rec	:=	Record
		 STRING 			MedicalBillID  								{XPATH('MedicalBillId')};
		 STRING 			BillNumber  									{XPATH('BillNumber')};
		 STRING 			BillLineNumber  							{XPATH('BillLineNumber')};
		 STRING       IsDup                         {XPATH('IsDup')};
		 STRING       MedicalProviderId 			      {XPATH('MedicalProviderId')};
		 STRING       TIN                           {XPATH('Tin')};
		 STRING 			PlaceofService  							{XPATH('PlaceOfService')};
		 STRING 			TypeofService  								{XPATH('TypeOfService')};
		 STRING 			ServiceTypeUnit  							{XPATH('ServiceTypeUnit')};
		 STRING 			NumberofUnits  								{XPATH('NumberOfUnits')};
		 Dataset(Date_Rec)	BeginningDateofService 	{XPATH('BeginningDateOfService')};
		 Dataset(Date_Rec) 	EndingDateofService 		{XPATH('EndingDateOfService')};
		 Dataset(Date_Rec) 	AdmittanceDate 					{XPATH('AdmittanceDate')};
		 Dataset(Date_Rec) 	DischargeDate 					{XPATH('DischargeDate')};
		 Dataset(Date_Rec)	BillReceivedDate 				{XPATH('BillReceivedDate')};
		 STRING 			BillRejected 									{XPATH('BillRejected')};
		 STRING 			DiagnosisVersionCode 					{XPATH('DiagnosisVersionCode')};
		 Dataset(Field_Rec)	DiagnosisCodes 					{XPATH('DiagnosisCodes/DiagnosisCode')};
		 STRING 			DiagnosisRelatedGroupCode_DRG {XPATH('DiagnosisRelatedGroupCode')};  
		 Dataset(Procedures_Rec) Procedures 				{XPATH('Procedure')};
		 STRING 			ICDProcedureCode1 						{XPATH('IcdProcedureCode1')};
		 STRING 			ICDProcedureCode2 						{XPATH('IcdProcedureCode2')};
		 STRING 			ICDProcedureCode3 						{XPATH('IcdProcedureCode3')};
		 STRING 			ICDProcedureCode4 						{XPATH('IcdProcedureCode4')};
		 STRING 			ICDProcedureCode5 						{XPATH('IcdProcedureCode5')};
		 STRING       RevenueCode                   {XPATH('RevenueCode')};
		 STRING 			ChargeAmount 									{XPATH('ChargeAmount')};
		 STRING 			AdjustmentNumber 							{XPATH('AdjustmentNumber')};
		 STRING 			AdjustmentReason 							{XPATH('AdjustmentReason')};
		  Dataset(Field_Rec) PaidAmount 							{XPATH('PaidAmount')};
		// STRING				PaidAmount										{XPATH('PaidAmount')};
		 STRING 			BillingProviderID 						{XPATH('BillingProviderId')};
		 dataset(Address_Rec) ProviderAddresses     {XPATH('ProviderAddresses/Address')};
		 dataset(Phone_Rec) ProviderPhoneNumbers    {XPATH('ProviderPhoneNumbers/PhoneNumber')};
	End;

	Export PharmacyBills_Rec := Record
		 STRING 			PharmacyBillID 								{XPATH('PharmacyBillId')};
		 STRING 			BillNumber 										{XPATH('BillNumber')};
		 STRING 			BillLineNumber 								{XPATH('BillLineNumber')};
		 STRING       MedicalProviderId 			      {XPATH('MedicalProviderId')};
		 STRING 			TransactionType 							{XPATH('TransactionType')};
		 STRING 			ChargeAmount 									{XPATH('ChargeAmount')};
		 STRING       PaidAmount 										{XPATH('PaidAmount')};
		 STRING 			PrescriptionNumber 						{XPATH('PrescriptionNumber')};
		 STRING 			PrescriptionSequenceNumber 		{XPATH('PrescriptionSequenceNumber')};
		 Dataset(Date_Rec) PrescriptionWrittenDate	{XPATH('PrescriptionWrittenDate')};	
		 Dataset(Date_Rec) DatePrescriptionFilled 	{XPATH('PrescriptionFilledDate')};		
	END;

	Export MedicalProviders_Rec	:= Record
		 STRING 			ProviderID  									{XPATH('ProviderId')};
		 STRING 			ProviderIDSuffix  						{XPATH('ProviderIdSuffix')};
		 STRING 			NationalProviderIdentificationNumber  {XPATH('NationalProviderIdentificationNumber')};
		 STRING 			ProviderType  								{XPATH('ProviderType')};
		 Dataset(Field_Rec) Taxonomies 						  {XPATH('Taxonomies/Taxonomy')};	
		 STRING 			FacilityName  								{XPATH('FacilityName')};
		 STRING 			FacilityNumber  							{XPATH('FacilityNumber')};
		 Dataset(Name_Rec) 		ProviderName 									{XPATH('ProviderName')};
	END;
	
	Export Parties_Rec := Record 
		 STRING 			PartyID 											{XPATH('Id')};
		 STRING 			Type 													{XPATH('Type')};
		 Dataset(Field_Rec) PolicyIDs 							{XPATH('PolicyIds/PolicyId')};
		 Date_Rec  	DatePartyAdded  								{XPATH('DatePartyAddedToClaim')};	
		 Dataset(Field_Rec) Roles  									{XPATH('Roles/Role')};			
		 STRING 			SSN 													{XPATH('Ssn')};
		 STRING 			TIN 													{XPATH('Tin')};
		 STRING 			FEIN 													{XPATH('Fein')};
		 Name_Rec 		NameParty									    {XPATH('Name')};
		 Dataset(Address_Rec) PartyAddresses 			{XPATH('Addresses/Address')};
		 Dataset(Phone_Rec)   PartyPhoneNos			  {XPATH('PhoneNumbers/PhoneNumber')};
		 Dataset(Date_Rec) 	  PartyDOB						{XPATH('DateOfBirth')};
		 STRING 			Gender 												{XPATH('Gender')};
		 STRING 			MaritalStatus 								{XPATH('MaritalStatus')};
		 STRING 			SeatbeltInd 									{XPATH('SeatbeltIndicator')};
		 STRING 			InjuryDesc 										{XPATH('InjuryDescription')};
		 STRING 			InjurySeverityCode 						{XPATH('InjurySeverityCode')};
		 STRING 			WageLossInd 									{XPATH('WageLossIndicator')};
		 DriverInfo_Rec DriverInfo								  {XPATH('Driver')};		
		 STRING 			Fatality 											{XPATH('Fatality')};
		 STRING 			PermissiveUse 								{XPATH('PermissiveUse')};
		 STRING 			MedicareEligible 							{XPATH('MedicareEligible')};
		 STRING 			PercentLiable 								{XPATH('PercentLiable')};
		 STRING 			LiabilityInd 									{XPATH('LiabilityIndicator')};
		 STRING 			EmailAddress 									{XPATH('EmailAddress')};
		 STRING 			AlternateEmailAddress 				{XPATH('AlternateEmailAddress')};
		 STRING 			WhentoContact 								{XPATH('WhenToContact')};
		 STRING 			WheretoContact 								{XPATH('WhereToContact')};
		 STRING 			IndividualBusinessInd 				{XPATH('IndividualBusinessIndicator')};
		 Dataset(Date_Rec)     DateOfDeath                   {XPATH('DateOfDeath')};
		 Dataset(Coverages_Rec) Coverages  							{XPATH('Coverages/Coverage')};	
		 Dataset(MedicalBills_Rec) MedicalBills 	 				{XPATH('MedicalBills/MedicalBill')};
		 Dataset(PharmacyBills_Rec) PharmacyBills 				{XPATH('PharmacyBills/PharmacyBill')};	
		 Dataset(MedicalProviders_Rec) MedicalProviders 	{XPATH('MedicalProviders/MedicalProvider')};		
	EnD;

	Export EstimateAppraisal_Rec :=	Record
		 Dataset(Date_Rec) EstimateAppraisalDate 		{XPATH('Date')};
		 STRING 			Amount  											{XPATH('Amount')};
		 STRING 			PerformedBy  									{XPATH('PerformedBy')};
		 STRING 			AppraiserName  								{XPATH('AppraiserName')}; 
		 dataset(Address_Rec) Location	    				{XPATH('Location')};		
	End;	

	Export LeasingFinanceCompany_Rec := Record
		 STRING 			Type  												{XPATH('Type')};
		 STRING 			Name  												{XPATH('Name')};				
		 Dataset(Address_Rec) LeasingFinanceAddress {XPATH('Address')};			
	END;

	Export Airbags_Rec := Record
		 STRING 			Deployed  										{XPATH('Deployed')};
		 STRING 			DriverAirbagDeployed  				{XPATH('DriverAirbagDeployed')};
		 STRING 			PassengerAirbagDeployed  			{XPATH('PassengerAirbagDeployed')};
		 STRING 			LeftSideAirbagDeployed  			{XPATH('LeftSideAirbagDeployed')};
		 STRING 			RightSideAirbagDeployed  			{XPATH('RightSideAirbagDeployed')};
	END;

	Export Vehicle_Rec := Record
		 STRING 			VIN  													{XPATH('Vin')};
		 STRING 			Year  												{XPATH('Year')};
		 STRING 			Make  												{XPATH('Make')};
		 STRING 			Model  												{XPATH('Model')};
		 STRING 			BodyType  										{XPATH('BodyType')};
		 STRING 			Color  												{XPATH('Color')};
		 STRING 			LicensePlateNumber  					{XPATH('LicensePlateNumber')};
		 STRING 			LicensePlateState  						{XPATH('LicensePlateState')};
		 STRING 			OdometerReading  							{XPATH('OdometerReading')};
		 STRING 			LienholderInd  								{XPATH('LienHolderIndicator')};
		 STRING 			RentalVehicleInd  						{XPATH('RentalVehicleIndicator')};
		 STRING 			LeasedVehicleInd  						{XPATH('LeasedVehicleIndicator')};		
		 Dataset(LeasingFinanceCompany_Rec) LeasingFinanceCompany {XPATH('LeasingFinancingCompanies/LeasingFinancingCompany')};
		 STRING 			BusinessUseInd  							{XPATH('BusinessUseIndicator')}; 
		 STRING 			SeatbeltInd  									{XPATH('SeatbeltIndicator')};
		 STRING 			AirbagsPresent  							{XPATH('AirbagsPresent')};
		 STRING 			AntiTheftDevicePresent  			{XPATH('AntiTheftDevicePresent')};	
		 RECORDOF(Airbags_Rec) Airbags 						{XPATH('Airbags')};
		 STRING 			PointofFirstImpact  					{XPATH('PointOfFirstImpact')};
		 STRING 			VehicleDamageDesc  						{XPATH('VehicleDamageDescription')};
		 STRING 			VehicleStolen  								{XPATH('VehicleStolen')};
		 STRING 			VehicleParked  								{XPATH('VehicleParked')};
		 dataset(Address_Rec) Wherevehicleseen 			{XPATH('WhereVehicleCanBeSeen')};
		 STRING 			TitleDisposition  						{XPATH('TitleDisposition')};
		 STRING 			DriveableInd  								{XPATH('DriveableIndicator')};
		 STRING 			Disposition  									{XPATH('Disposition')};
	End;

	Export 	TheftRecovery_Rec := Record
		 STRING 			RecoveringAgency  						{XPATH('RecoveringAgency')};
		 STRING 			RecoveryLocationCity 					{XPATH('RecoveryLocationCity')};
		 STRING 			RecoveryLocationCounty 				{XPATH('RecoveryLocationCounty')};
		 STRING 			RecoveryLocationState 				{XPATH('RecoveryLocationState')};
		 STRING 			RecoveryLocation 							{XPATH('RecoveryLocation')};
		 Dataset(Phone_Rec) 	RecoveringAgencyTelephone		  	{XPATH('RecoveryAgencyTelephone')};
		 Dataset(Date_Rec) 		RecoveredDate 				{XPATH('RecoveredDate')};
		 STRING 			ConditionofRecoveredStolenVehicle {XPATH('ConditionOfRecoveredStolenVehicle')};
		 STRING 			TheftType 										{XPATH('TheftType')};		
	END;

	Export Salvage_Rec := Record
		 STRING 			VINMissingInd 								{XPATH('VinMissingIndicator')};
		 STRING 			EngineMissingInd 							{XPATH('EngineMissingIndicator')};
		 STRING 			TransmissionMissingInd 				{XPATH('TransmissionMissingIndicator')};
		 Dataset(Date_Rec) DateSalvageResolvedSold 	{XPATH('DateSalvageResolvedSold')};
		 STRING 			ActualCashValuePriortoLoss 		{XPATH('ActualCashValuePriorToLoss')};
		 STRING 			ValueReceived 								{XPATH('ValueReceived')};
		 STRING 			ActualSalvageValue 						{XPATH('ActualSalvageValue')};
	END;

	Export RepairFacility_Rec     := Record
		 STRING       RepairFacilityName            {XPATH('RepairFacilityName')};
		 Address_Rec;
	End;
  Export ClaimInvolvedUnits_Rec	:=	Record
		 STRING 			UnitID  											{XPATH('UnitId')};
		 STRING 			OwnerPartyID  								{XPATH('OwnerPartyId')};
		 Dataset(Field_Rec) PolicyIDs  							{XPATH('PolicyIds/PolicyId')};
		 STRING 			PropertyDamageDescription  		{XPATH('PropertyDamageDescription')};
		 STRING 			NumberofOccupants  						{XPATH('NumberOfOccupants')};		
		 dataset(EstimateAppraisal_Rec) EstimateAppraisal {XPATH('EstimateAppraisal')};			
		 STRING 			TotalLossInd  								{XPATH('TotalLossIndicator')};
		 STRING 			OwnerRetainingSalvage  				{XPATH('OwnerRetainingSalvage')};
		 STRING 			UnrelatedPriorDamage  				{XPATH('UnrelatedPriorDamage')};
		 STRING 			PriorDamageEstimateAmount  		{XPATH('UnrelatedPriorDamageEstimateAmount')};
		 STRING 			SupplementPresent  						{XPATH('SupplementPresent')};
		 STRING 			SupplementAmount  						{XPATH('SupplementAmount')};
		 STRING 			AdditionalInsuranceCoverage  	{XPATH('AdditionalInsuranceCoverage')};
		 STRING 			AdditionalFirstPartyInsuranceCoverage  
		 																					{XPATH('AdditionalFirstPartyInsuranceCoverage')};
		 dataset(RepairFacility_Rec) RepairFacility {XPATH('RepairFacility')};	
		 Dataset(Vehicle_Rec) Vehicle			  			{XPATH('Vehicle')};	
		 Dataset(TheftRecovery_Rec) TheftRecovery {XPATH('TheftRecovery')};
		 Dataset(Salvage_Rec) 			 Salvage  			{XPATH('Salvage')};
		 Dataset(Coverages_Rec) Coverages	  			{XPATH('Coverages/Coverage')};				
	End;		

	Export SIUReferral_Rec := Record
			STRING 			SIUReferralID  								{XPATH('SiuReferralId')};
			Dataset(Field_Rec) ReserveIds 						{XPATH('ReserveIds/ReserveId')};
			Dataset(Date_Rec) DateReferred		   			{XPATH('DateReferred')};
			Dataset(Date_Rec) DateInvestigationClosed	{XPATH('DateInvestigationClosed')};
			STRING 			TypeofReferral  							{XPATH('TypeOfReferral')};
			STRING 			ReferralReason								{XPATH('ReferralReason')};
			STRING 			Disposition  									{XPATH('Disposition')};
			STRING 			MitigatedAmount  							{XPATH('MitigatedAmount')};
			STRING 			Mitigated  										{XPATH('Mitigated')};
			STRING 			ReferredtoNICB  							{XPATH('ReferredToNICB')};
			STRING 			NICBReferralNumber  					{XPATH('NicbReferralNumber')};
	END;

	Export Subrogations_Rec := Record
			STRING 			SubrogationID  								{XPATH('SubrogationId')}; 
			Dataset(Field_Rec) ReserveIds 						{XPATH('ReserveIds/ReserveId')};
			STRING 			SubroIndicator  							{XPATH('SubroIndicator')};
			Date_Rec 		SubroOpenDate		 							{XPATH('SubroOpenDate')};
			Dataset(Date_Rec) SubroClosedDate 				{XPATH('SubroCloseDate')};
			STRING 			RecoveryAmount  							{XPATH('RecoveryAmount')};
			Dataset(Date_Rec) RecoveryDate 						{XPATH('RecoveryDate')};
			STRING 			RecoveryCategory  						{XPATH('RecoveryCategory')};
			STRING 			Subrogationpotentialind  			{XPATH('SubrogationPotentialIndicator')};
	END;

	 Export Addresses_Rec := Record
			Dataset(Address_Rec) Address 							{XPATH('Address')};		
	End;
	
	Export PolicyHolder_Rec := Record
			Dataset(Name_Rec)		 Name					 				{XPATH('Name')};
			// Dataset(Address_Rec) Addresses 						{XPATH('Addresses/Address')};		
			Dataset(Addresses_Rec) Addresses 						{XPATH('Addresses')};		
	End;
	export PolicyHolders_Rec :=
	record
			dataset(PolicyHolder_Rec) PolicyHolders		{XPATH('PolicyHolder')};
	end;
	
	Export Policies_Rec := Record
			STRING 			PolicyID 											{XPATH('PolicyId')};
			STRING 			PolicyNumber 									{XPATH('PolicyNumber')};
			STRING 			ClaimPolicy 									{XPATH('ClaimPolicy')};
			STRING 			InsuranceType 								{XPATH('InsuranceType')};
			STRING 			InsuranceCompany 							{XPATH('InsuranceCompany')};
			STRING 			UnderwritingOrganization 			{XPATH('UnderwritingOrganization')};
			STRING 			PolicyType 										{XPATH('PolicyType')};
			STRING 			RiskType 											{XPATH('RiskType')};
			STRING 			PolicyState 									{XPATH('PolicyState')};
			Dataset(Date_Rec) InceptionDate 					{XPATH('InceptionDate')};
			Dataset(Date_Rec) TermEffectiveDate 			{XPATH('TermEffectiveDate')};
			Dataset(Date_Rec) TermExpirationDate 			{XPATH('TermExpirationDate')};
			Dataset(Date_Rec) CancellationDate    		{XPATH('CancellationDate')};
			STRING 			CancellationReasonCode 				{XPATH('CancellationReasonCode')};
			Dataset(Date_Rec) ReinstatementDate 			{XPATH('ReinstatementDate')};
			Dataset(PolicyHolders_Rec) PolicyHolders 	{XPATH('PolicyHolders')};
			// Dataset(Name_Rec) PolicyholderNames 			{XPATH('PolicyHolderNames/PartyName')};
			// Dataset(Address_Rec) PolicyholderAddresses {XPATH('PolicyHolderAddresses/PolicyHolderAddress')};		
			STRING 			AdditionalInsuredName 				{XPATH('AdditionalInsuredName')}; 
			STRING 			AdditionalInsuredType 				{XPATH('AdditionalInsuredType')};
			STRING 			SicOrNAICCode 								{XPATH('SicNAICSCode')};
			STRING 			PaymentMethod 								{XPATH('PaymentMethod')};
			STRING 			AgencyName 										{XPATH('Agency/Name')};	    
			STRING 			AgencyEmailAddress 						{XPATH('Agency/EmailAddress')};	    
			STRING 			AgencyCode 										{XPATH('Agency/Code')};	    
			STRING 			AgencySubCode 								{XPATH('AgencySubCode')};
			STRING 			NationalProducerNumber 				{XPATH('NationalProducerNumber')};	
	END;

	Export Payments_Rec := Record
			STRING 			PaymentID  										{XPATH('PaymentId')};				
			Dataset(Field_Rec) ReserveIds 		 				{XPATH('ReserveIds/ReserveId')};
			Dataset(Field_Rec) MedicalBillIds  				{XPATH('MedicalBillIds/MedicalBillId')};
			Dataset(Field_Rec) PharmacyBillIDs 				{XPATH('PharmacyBillIds/PharmacyBillId')};
			STRING 			PaymentCategory  							{XPATH('PaymentCategory')};
			STRING 			PaymentSubCategory  					{XPATH('PaymentSubCategory')};
			STRING 			PaymentTransactionType  			{XPATH('PaymentTransactionType')};
			Date_Rec 		DateofPayment 								{XPATH('DateOfPayment')};
			STRING 			Amount  											{XPATH('PaymentAmount')};
			STRING 			ManualCheckInd  							{XPATH('ManualCheckIndicator')};
			STRING 			PayeeType  										{XPATH('PayeeType')};
			STRING 			PayeeName  										{XPATH('PayeeName')};
			Address_Rec PayeeAddress 									{XPATH('PayeeAddress')};
			STRING 			PayeeSSnTinFein 	 						{XPATH('PayeeSSnTinFein')};
			STRING 			TinEntityType  								{XPATH('TinEntityType')};
	END;

//CLAIM Section
  Export Claim_Rec := Record 
	 	 STRING  			AccountNumber 								{XPATH('AccountNumber')}; 
		 STRING  			Typeofupdate    							{XPATH('TypeOfUpdate')}; 
		 Dataset(Date_Rec)  ValuationDate     			{XPATH('ValuationDate')};
		 STRING  			Claim_Number    						  {XPATH('Number')};    
		 STRING  			AMBest_Number   							{XPATH('AmBestNumber')};   
		 STRING  			NAIC_Code       							{XPATH('NaicCode')};  
		 Dataset(Date_Rec)	DateOfLoss          		{XPATH('DateOfLoss')};
		 STRING  			TimeofLoss      							{XPATH('TimeOfLoss')};	
		 Dataset(Date_Rec)		  DateReported    		{XPATH('DateReported')};	
		 STRING  			LossLocation    							{XPATH('LossLocation')};
		 STRING2 			LossLocationState							{XPATH('LossLocationState')};
		 Dataset(Address_Rec) LossLocationAddress   {XPATH('LossLocationAddress')}; 
		 STRING  			LossDescriptionField 					{XPATH('LossDescriptionField')};
		 STRING  			LossTypeCategory 							{XPATH('LossTypeCategory')}; 
		 STRING  			AuthoritiesContacted 					{XPATH('AuthoritiesContactedPoliceReportFiled')}; 
		 STRING  			AtFaultIndicator 							{XPATH('AtFaultIndicator')}; 
		 STRING  			PercentLiable 								{XPATH('PercentLiable')}; 
		 STRING  			WeatherConditions 						{XPATH('WeatherConditions')}; 
		 STRING  			ClaimHandlingOfficeId					{XPATH('ClaimHandlingOfficeId')}; 
		 STRING  			ClaimHandlingOffice 					{XPATH('ClaimHandlingOffice')}; 
		 STRING  			FastPayindicator 							{XPATH('FastPayIndicator')}; 
		 Dataset(PrimaryAdjuster_Rec) PrimaryAdjuster   {XPATH('PrimaryAdjuster')};		
		 STRING 			MultiVehicleInd 							{XPATH('MultiVehicleIndicator')}; 
		 STRING 			HitandRunInd 									{XPATH('HitAndRunIndicator')}; 
		 STRING 			CatastropheInd 								{XPATH('CatastropheIndicator')}; 
		 STRING 			CatastropheNumber 						{XPATH('CatastropheNumber')}; 
		 STRING 			WhoReportedLoss 							{XPATH('WhoReportedLoss')}; 
		 STRING 			HowLosswasReported 						{XPATH('HowLossWasReported')}; 
		 STRING 			ClaimDisposition				 			{XPATH('StatusDisposition')}; 	
		 Dataset(Date_Rec)  		ClosedDate		     	{XPATH('ClosedDate')};
		 STRING 			AmbulancetoScene 							{XPATH('AmbulanceToScene')};
		 STRING 			SuitIndicator 								{XPATH('SuitIndicator')};	
		 Dataset(Date_Rec) DateInsuranceCoReceived  {XPATH('DateInsuranceCompanyReceived')};		
		 STRING 			ReportType_ReportingStatus 		{XPATH('ReportTypeReportingStatus')};
		 STRING 			ReferenceNumber 							{XPATH('ReferenceNumber')};
		 STRING 			PreviouslyReported 						{XPATH('PreviouslyReported')};
		 STRING 			LossViolations_Citations 			{XPATH('LossViolationsCitations')};
		 STRING 			Remarks 											{XPATH('Remarks')};
		 STRING 			PhantomVehicleAccidentIndicators {XPATH('PhantomVehicleAccidentIndicators')};
		 STRING 			Accidentwitnessed 							 {XPATH('AccidentWitnessed')};			
		 STRING 			Molddamageclaimed 							 {XPATH('MoldDamageBeingClaimed')};		
		 InvestigatingAgency_Rec InvestigatingAgency   {XPATH('InvestigatingAgency')};	
		 STRING       StateOfJurisdiction              {XPATH('StateOfJurisdiction')};
		 STRING       ClaimType             					 {XPATH('ClaimType')};
		 STRING       WCClassCode             				 {XPATH('WCClassCode')};
		 Dataset(Note_Rec) 							 Notes      				{XPATH('Notes/Note')} ;
		 Dataset(Parties_Rec) 					 Parties      			{XPATH('Parties/Party')} ;
		 Dataset(ClaimInvolvedUnits_Rec) ClaimInvolvedUnits {XPATH('ClaimInvolvedUnits/ClaimInvolvedUnit')} ;
		 Dataset(SIUReferral_Rec) 	 		 SIUReferral      	{XPATH('SiuReferrals/SiuReferral')} ; 
		 Dataset(Subrogations_Rec)   		 Subrogations       {XPATH('Subrogations/Subrogation')} ; 
		 Dataset(Policies_Rec)   		 		 Policies      			{XPATH('Policies/Policy')} ;
		 Dataset(Payments_Rec)   				 Payments           {XPATH('Payments/Payment')} ;
	End;

	Export Account_Spray := Record
		String AccountNumber;
		String AccountStatus;
		String AccountName;
		String ProductCode;
		String ProductName;
		String ProductDescription;
	End;


Export Account_Spray_new := Record
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
		
		
	////Added for normalization process//////
	export  RecValidation := Record
	   unsigned4			ClaimGroupNumber := 0;
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
	
	export  lRecValidation := Record
	   unsigned4			ClaimGroupNumber;
			string7					RejectCode;
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

		// EXPORT claimConnectionToInput := RECORD
		// unsigned8			RecordNumber;
	  // unsigned8			claimGroupNumber;
	  // string        claim_number;
		//string        oclaimnumber;
		// STRING   			AMBest_Number;
		
	//END;
	
	EXPORT CDFCContribWithBatch := RECORD (Claim_Rec)
		Unsigned8 		SequenceId;
		STRING9 			Batch_Id;
		UNSIGNED8 		RecordNumber;
		UNSIGNED8			ClaimGroupNumber;
		STRING9   		Contributor_Id;
		UNSIGNED1			File_Seq;
	END;	
	
	EXPORT	ScrubTracking	:=	record
	unsigned4			RecordNumber;
		unsigned4			ClaimGroupNumber;
		string        claim_number;
		unsigned4			FieldTest;
		unsigned4			FieldAction;
		boolean				IsRejected;
		
		// string1960		RejectCodes;
		Dataset(RecValidation) RejectCodes;
	end;
		
		EXPORT	ScrubTracking1	:=	record
		unsigned4			RecordNumber;
		unsigned4			ClaimGroupNumber;
		string        claim_number;
		unsigned4			FieldTest;
		unsigned4			FieldAction;
		boolean				IsRejected;
		// string1960		RejectCodes;
	dataset(lRecValidation) RejectCodes;
	end;
		

	EXPORT	PlainScrubTracking	:=	record
		ScrubTracking AND NOT RejectCodes;
		RecValidation RejectCodeData;
	END;
	
	EXPORT	DateTracking	:=	record
		ScrubTracking AND NOT RejectCodes;
		RecValidation;
	END;
	
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
		unsigned4 Part;
		// string  		TextData{maxlength(ContributionScrubs.Constants.CSVRecMaxLength)};
	end;
/////////////////////////////////////////////////////////////////////////////

	export	SummaryXML	:=
	record
		ScrubTracking;
		string  		TextData{maxlength(1000000)};
	end;
/////////////////////////////////////////////////////////////////////////////

	export	SummarySprayInp	:= record
	 RecValidation;
	 Claim_Rec Claim;
	end;
	
	EXPORT Notes_Tracking := Record
		RecValidation;
		Unsigned          NoteseqNO;
    STRING 			      NoteID ;							 															
		Date_Rec 		      EntryDate ;
	  STRING 		      	Category ;											 
		STRING 			      DetailedText ;								
		STRING 			      AuthorName ;										
		STRING 		        AuthorId ;															
	 
	END;
	

	Export CasualtyClaim_Tracking:=Record
	   RecValidation;
		 STRING 			TortThresholdType ;
		 STRING 			TortThresholdState ;
		 STRING 			DemandAmount ;
		 STRING 			SettlementAmount;
		 STRING 			LawsuitFiled ;
		 Dataset(Date_Rec) LawsuitFilingDate ;
		 STRING 			Physicaldamagetopartyvehicle ;
		 STRING 			AttorneyInvolved ;
		 Dataset(Date_Rec) DateofAttorneyInvolvement;
		 STRING 			PreExistingDisability ;
		 STRING 			PartyPermanentlyDisabled ;
		 STRING 			DisabilityRating  ;
	END;	
	
	EXPORT PharmacyBills_Tracking :=Record
	   RecValidation;
		 unsigned     pharmacybillseqno;
	   STRING 			PharmacyBillID ;
		 STRING 			BillNumber ;
		 STRING 			BillLineNumber ;
		 STRING       MedicalProviderId ;
		 STRING 			TransactionType;
		 STRING 			ChargeAmount ;
		 STRING       PaidAmount ;
		 STRING 			PrescriptionNumber;
		 STRING 			PrescriptionSequenceNumber;
		 dataset(Date_Rec) 		PrescriptionWrittenDate;	
		 dataset(Date_Rec) 		DatePrescriptionFilled;		
	END;
	
	EXPORT PharmacyBills_Tracking1 :=Record
	   RecValidation;
		 unsigned     partyseqno;
		 unsigned     pharmacybillseqno;
	   STRING 			PharmacyBillID ;
		 STRING 			BillNumber ;
		 STRING 			BillLineNumber ;
		 STRING       MedicalProviderId ;
		 STRING 			TransactionType;
		 STRING 			ChargeAmount ;
		 STRING       PaidAmount ;
		 STRING 			PrescriptionNumber;
		 STRING 			PrescriptionSequenceNumber;
		 dataset(Date_Rec) 		PrescriptionWrittenDate;	
		 dataset(Date_Rec) 		DatePrescriptionFilled;		
	END;

	Export Payments_Tracking := Record
	    RecValidation;
			unsigned    paymentseqno;
			STRING 			PaymentID;  													
			dataset(Field_Rec)   ReserveIds ;		 				
			dataset(Field_Rec)   MedicalBillIds;  				
			dataset(Field_Rec)   PharmacyBillIDs; 				
			STRING 			PaymentCategory;  							
	    STRING 			PaymentSubCategory ;
	    STRING 			PaymentTransactionType;  		
			Date_Rec 		DateofPayment; 								
			STRING 			Amount;  										
			STRING 			ManualCheckInd;  							
			STRING 			PayeeType;  										
			STRING 			PayeeName;  										
			Address_Rec PayeeAddress; 									
			STRING 			PayeeSSnTinFein; 	 						
			STRING 			TinEntityType;
	
	END;
	
  Export Payments_Tracking1 := Record
	    RecValidation;
			unsigned    paymentseqno;
			STRING 			PaymentID;  													
			String      ReserveId;		 				
	END;
	
	Export Payments_Tracking2 := Record
	    RecValidation;
			unsigned    paymentseqno;
			STRING 			PaymentID;  	 				
			String    	MedicalBillId;	
	END;
	
	Export Payments_Tracking3 := Record
	    RecValidation;
			unsigned    paymentseqno;
			STRING 			PaymentID;  	 				
			String      PharmacyBillID;
	END;

	
	
	Export SIUReferral_tracking := Record
	    RecValidation;
			unsigned    siuseqno;
			STRING 			SIUReferralID;  								
	    Dataset(Field_Rec)       ReserveIds;					
		  Dataset(Date_Rec) 		DateReferred;		   						
			Dataset(Date_Rec) 		DateInvestigationClosed	;	 	
			STRING 			TypeofReferral ; 							
			STRING 			ReferralReason;								
			STRING 			Disposition  	;								
			STRING 			MitigatedAmount;  							
			STRING 			Mitigated;  										
			STRING 			ReferredtoNICB;  							
			STRING 			NICBReferralNumber;  				
	END;
	
	Export SIUReferral_tracking1 := Record
	    RecValidation;
			unsigned    siuseqno;
			STRING 			SIUReferralID;  								
	    STRING      ReserveId;					
			Dataset(Date_Rec)	DateReferred;		   						
			Dataset(Date_Rec) DateInvestigationClosed	; 	
			STRING 			TypeofReferral ; 							
			STRING 			ReferralReason;								
			STRING 			Disposition  	;								
			STRING 			MitigatedAmount;  							
			STRING 			Mitigated;  										
			STRING 			ReferredtoNICB;  							
			STRING 			NICBReferralNumber;  				
	END;
		
	
  Export Reserve_Tracking:= Record
     RecValidation;
		  unsigned    coverageseqno;
		 unsigned    Reserveseqno;
		 unsigned    partyseqno;
		 STRING 			ReserveID  										;
		 STRING 			AssignedAdjusterName  				;
		 STRING 			AssignedAdjusterID  					;
		 STRING 			ReserveCategory  							;
		 STRING 			ReserveTransactionType  			;		
		 dataset(Date_Rec) DateReserveEstablished	 ;		
		 STRING 			ReserveAmount  								; 
		 dataset(Date_rec)		 	DateReserveChanged	; 
		 dataset(Date_rec) 		DateReserveClosed	    ;  				
	   Dataset(CasualtyClaim_rec) CasualtyClaims  ;
	 end;
	
 Export Reserve_Tracking1:= Record
     RecValidation;
		 unsigned    coverageseqno;
		 unsigned    CIUseqno;
		 unsigned    Reserveseqno;
		 STRING 			ReserveID  										;
		 STRING 			AssignedAdjusterName  				;
		 STRING 			AssignedAdjusterID  					;
		 STRING 			ReserveCategory  							;
		 STRING 			ReserveTransactionType  			;		
		 dataset(Date_Rec) DateReserveEstablished	 ;		
		 STRING 			ReserveAmount  								; 
		 dataset(Date_rec)		 	DateReserveChanged	; 
		 dataset(Date_rec) 		DateReserveClosed	    ;  				
	   Dataset(CasualtyClaim_rec) CasualtyClaims  ;
	 end;	
	Export MedicalBills_Tracking	:=	Record
	   RecValidation;
		 unsigned    medicalbillseqno;
		 STRING 			MedicalBillID ;
		 STRING 			BillNumber ;
		 String       ISDup;
		 STRING 			BillLineNumber;
		 STRING       MedicalProviderId;
		 STRING       TIN;
		 STRING 			PlaceofService;
		 STRING 			TypeofService;
		 STRING 			ServiceTypeUnit;
		 STRING 			NumberofUnits;
		 dataset(Date_Rec)	BeginningDateofService;
		 dataset(Date_Rec)  EndingDateofService;
		 dataset(Date_Rec) 	AdmittanceDate;
		 dataset(Date_Rec) 	DischargeDate;
		 dataset(Date_Rec) 	BillReceivedDate;
		 STRING 			BillRejected;
		 STRING 			DiagnosisVersionCode;
		 Dataset(Field_Rec)	DiagnosisCodes;
		 STRING 			DiagnosisRelatedGroupCode_DRG ;  
		 Dataset(Procedures_Rec) Procedures;
		 STRING 			ICDProcedureCode1;
		 STRING 			ICDProcedureCode2;
		 STRING 			ICDProcedureCode3 ;
		 STRING 			ICDProcedureCode4 ;
		 STRING 			ICDProcedureCode5 ;
		 STRING       RevenueCode;
		 STRING 			ChargeAmount;
		 STRING 			AdjustmentNumber;
		 STRING 			AdjustmentReason;
		Dataset(Field_Rec)       PaidAmount;		
		 STRING 			BillingProviderID;
		 dataset(Address_Rec) ProviderAddresses;
		 dataset(Phone_Rec) ProviderPhoneNumbers;
	End;

  Export MedicalBills_Tracking1	:=	Record
	  RecValidation;
		 unsigned    medicalbillseqno;
		 unsigned     partyseqno;
		 STRING 			MedicalBillID ;
		 STRING 			BillNumber ;
		 String       ISDup;
		 STRING 			BillLineNumber;
		 STRING       MedicalProviderId;
		 STRING       TIN;
		 STRING 			PlaceofService;
		 STRING 			TypeofService;
		 STRING 			ServiceTypeUnit;
		 STRING 			NumberofUnits;
		 dataset(Date_Rec)	BeginningDateofService;
		 dataset(Date_Rec)  EndingDateofService;
		 dataset(Date_Rec) 	AdmittanceDate;
		 dataset(Date_Rec) 	DischargeDate;
		 dataset(Date_Rec) 	BillReceivedDate;
		 STRING 			BillRejected;
		 STRING 			DiagnosisVersionCode;
		 Dataset(Field_Rec)	DiagnosisCodes;
		 STRING 			DiagnosisRelatedGroupCode_DRG ;  
		 Dataset(Procedures_Rec) Procedures;
		 STRING 			ICDProcedureCode1;
		 STRING 			ICDProcedureCode2;
		 STRING 			ICDProcedureCode3 ;
		 STRING 			ICDProcedureCode4 ;
		 STRING 			ICDProcedureCode5 ;
		 STRING       RevenueCode;
		 STRING 			ChargeAmount;
		 STRING 			AdjustmentNumber;
		 STRING 			AdjustmentReason;
		 Dataset(Field_Rec)       PaidAmount;		
		 STRING 			BillingProviderID;
		 dataset(Address_Rec) ProviderAddresses;
		 dataset(Phone_Rec) ProviderPhoneNumbers;
    End;
	Export Vehicle_Tracking := Record
	  RecValidation;
		unsigned      Vehicleseqno;
		 STRING 			VIN;  
		 STRING 			Year ;
		 STRING 			Make;
		 STRING 			Model;
		 STRING 			BodyType ;
		 STRING 			Color ;
		 STRING 			LicensePlateNumber; 
		 STRING 			LicensePlateState;
		 STRING 			OdometerReading ;
		 STRING 			LienholderInd ; 	
		 STRING 			RentalVehicleInd ;
		 STRING 			LeasedVehicleInd;  			
		 Dataset(LeasingFinanceCompany_Rec) LeasingFinanceCompany ;
		 STRING 			BusinessUseInd ;
		 STRING 			SeatbeltInd ;
		 STRING 			AirbagsPresent ;
		 STRING 			AntiTheftDevicePresent ; 	
		 RECORDOF(Airbags_Rec) Airbags; 		
		 STRING 			PointofFirstImpact ;
		 STRING 			VehicleDamageDesc;  
		 STRING 			VehicleStolen ;
		 STRING 			VehicleParked ;
		 dataset(Address_Rec) Wherevehicleseen ;
		 STRING 			TitleDisposition ;
		 STRING 			DriveableInd ;
		 STRING 			Disposition;
	End;
 
  Export RepairFacility_Tracking    := Record
       unsigned4 claimgroupnumber;  
		 STRING       RepairFacilityName;
		 Address_Rec;
	End;

  Export Address_Tracking := Record
     RecValidation;
		 STRING 			AddressType;
		 STRING 			StreetNumber;
		 STRING 			StreetName;
		 STRING 			ApartmentNumber	;
		 STRING 			City	;
		 STRING 			State;
		 STRING 			Zipcode;
		 STRING 			ZipCode4 ;		 
		 STRING 			NonUSPostalCode;		 
	End;
  
	Export MedicalProviders_Tracking	:= Record
    RecValidation;
		unsigned      medicalproviderseqno;
		 STRING 			ProviderID  ;
		 STRING 			ProviderIDSuffix ;
		 STRING 			NationalProviderIdentificationNumber ;
		 STRING 			ProviderType ;
		 Dataset(Field_Rec) Taxonomies ;	
		 STRING 			FacilityName ;
		 STRING 			FacilityNumber ;
		Dataset(Name_Rec)		ProviderName ;
	END;
   
	 Export MedicalProviders_Tracking1	:= Record
    RecValidation;
		unsigned      medicalproviderseqno;
		unsigned      partyseqno;
		 STRING 			ProviderID  ;
		 STRING 			ProviderIDSuffix ;
		 STRING 			NationalProviderIdentificationNumber ;
		 STRING 			ProviderType ;
     Dataset(Field_Rec) Taxonomies ;
		 STRING 			FacilityName ;
		 STRING 			FacilityNumber ;
		 Dataset(Name_Rec) 		ProviderName ;
	END;

 Export Policies_Tracking := Record
      RecValidation;
			unsigned    PolicySeqNo;
			STRING 			PolicyID 	;
			STRING 			PolicyNumber ;
			STRING 			ClaimPolicy ;
			STRING 			InsuranceType ;
			STRING 			InsuranceCompany 	;
			STRING 			UnderwritingOrganization 	;
			STRING 			PolicyType ;
			STRING 			RiskType ;
			STRING 			PolicyState ;
			Dataset(Date_Rec) InceptionDate ;
			Dataset(Date_Rec) TermEffectiveDate;
			Dataset(Date_Rec) TermExpirationDate ;
			Dataset(Date_Rec) CancellationDate;
			STRING 			CancellationReasonCode ;
			Dataset(Date_Rec) ReinstatementDate ;
			Dataset(PolicyHolders_Rec) PolicyHolders ;		
			STRING 			AdditionalInsuredName ; 
			STRING 			AdditionalInsuredType ;
			STRING 			SicOrNAICCode ;
			STRING 			PaymentMethod ;
			STRING 			AgencyName ;	    
			STRING 			AgencyEmailAddress;	    
			STRING 			AgencyCode;	    
			STRING 			AgencySubCode ;
			STRING 			NationalProducerNumber ;	
	END;

  Export EstimateAppraisal_Tracking :=	Record
       	 
		 Dataset(Date_Rec) 		EstimateAppraisalDate ;
		 STRING 			Amount ;
		 STRING 			PerformedBy ;
		 STRING 			AppraiserName ; 
		 dataset(Address_Rec) Location;		
	End;		

 Export Coverages_Tracking :=	Record
     RecValidation;
		  unsigned coverageseqno;
		 unsigned partyseqno;
		 STRING 			CoverageType ;
		 Dataset(Reserve_Rec) Reserves ;		
	End;
	
	 Export Coverages_Tracking1 :=	Record
     RecValidation;
		 unsigned coverageseqno;
		 unsigned CIUseqno;
		 STRING 	CoverageType ;
		 Dataset(Reserve_Rec) Reserves ;		
	End;
	
  Export 	TheftRecovery_Tracking := Record
   
		STRING 			RecoveringAgency ;
		 STRING 			RecoveryLocationCity ;
		 STRING 			RecoveryLocationCounty ;
		 STRING 			RecoveryLocationState;
		 STRING 			RecoveryLocation ;
		 Dataset(Phone_Rec) 	RecoveringAgencyTelephone	;
		 Dataset(Date_Rec) 		RecoveredDate ;
		 STRING 			ConditionofRecoveredStolenVehicle ;
		 STRING 			TheftType ;		
	END;

  Export Salvage_Tracking := Record
     
		 STRING 			VINMissingInd ;
		 STRING 			EngineMissingInd ;
		 STRING 			TransmissionMissingInd ;
		 Dataset(Date_Rec) DateSalvageResolvedSold ;
		 STRING 			ActualCashValuePriortoLoss ;
		 STRING 			ValueReceived ;
		 STRING 			ActualSalvageValue ;
	END;
	
  Export Parties_Tracking:= Record
    RecValidation;
		unsigned       partyseqno;
		STRING 			PartyID ;
		 STRING 			Type 	;
		 Dataset(Field_Rec) PolicyIDs ;
		 Date_Rec  	DatePartyAdded  ;	
		 Dataset(Field_Rec) Roles;			
		 STRING 			SSN ;
		 STRING 			TIN ;
		 STRING 			FEIN ;
		 Name_Rec 		NameParty	;
		 Dataset(Address_Rec) PartyAddresses 	;
		 Dataset(Phone_Rec)   PartyPhoneNos	;
		 Dataset(Date_Rec) 	  PartyDOB	;
		 STRING 			Gender 	;
		 STRING 			MaritalStatus;
		 STRING 			SeatbeltInd ;
		 STRING 			InjuryDesc ;
		 STRING 			InjurySeverityCode ;
		 STRING 			WageLossInd ;
		 DriverInfo_Rec DriverInfo;		
		 STRING 			Fatality;
		 STRING 			PermissiveUse ;
		 STRING 			MedicareEligible;
		 STRING 			PercentLiable ;
		 STRING 			LiabilityInd ;
		 STRING 			EmailAddress ;
		 STRING 			AlternateEmailAddress ;
		 STRING 			WhentoContact ;
		 STRING 			WheretoContact ;
		 STRING 			IndividualBusinessInd ;
		 Dataset(Date_Rec)     DateOfDeath  ;
		  // Dataset(Coverages_Tracking) Coverages  ;	
		  // Dataset(MedicalBills_Tracking) MedicalBills ;
		  // Dataset(PharmacyBills_Tracking) PharmacyBills ;	
		  // Dataset(MedicalProviders_Tracking) MedicalProviders ;		
	EnD;
	
Export Parties_Tracking1:= Record
    RecValidation;
		 unsigned       partyseqno;
		 STRING 			PartyID ;
		 STRING 			Type 	;
		 STRING      PolicyID ;
		 Date_Rec    	DatePartyAdded  ;	
		 Dataset(Field_Rec) Roles;			
		 STRING 			SSN ;
		 STRING 			TIN ;
		 STRING 			FEIN ;
		 Name_Rec 		NameParty	;
		 Dataset(Address_Rec) PartyAddresses 	;
		 Dataset(Phone_Rec)   PartyPhoneNos	;
		 Dataset(Date_Rec) 	  PartyDOB	;
		 STRING 			Gender 	;
		 STRING 			MaritalStatus;
		 STRING 			SeatbeltInd ;
		 STRING 			InjuryDesc ;
		 STRING 			InjurySeverityCode ;
		 STRING 			WageLossInd ;
		 DriverInfo_Rec DriverInfo;		
		 STRING 			Fatality;
		 STRING 			PermissiveUse ;
		 STRING 			MedicareEligible;
		 STRING 			PercentLiable ;
		 STRING 			LiabilityInd ;
		 STRING 			EmailAddress ;
		 STRING 			AlternateEmailAddress ;
		 STRING 			WhentoContact ;
		 STRING 			WheretoContact ;
		 STRING 			IndividualBusinessInd ;
		 Dataset(Date_Rec)     DateOfDeath  ;
		 Dataset(MedicalBills_rec) MedicalBills ;
		 Dataset(MedicalProviders_rec) MedicalProviders ;
		 Dataset(PharmacyBills_rec) PharmacyBills ;
		 Dataset(Coverages_rec) Coverages  ;	
	End;
	
	Export Subrogations_Tracking := Record
	    RecValidation;
			unsigned   subrogationseqno;
			STRING 			SubrogationID  	; 
			Dataset(Field_Rec) ReserveIds ;
			STRING 			SubroIndicator ;
			Date_Rec 		SubroOpenDate	;
			Dataset(Date_Rec) SubroClosedDate ;
			STRING 			RecoveryAmount  ;
			Dataset(Date_Rec) RecoveryDate ;
			STRING 			RecoveryCategory ;
			STRING 			Subrogationpotentialind ;
	END;
	
	Export Subrogations_Tracking1 := Record
	     RecValidation;
			unsigned   subrogationseqno;
			STRING 			SubrogationID  	; 
			String      ReserveId ;
			STRING 			SubroIndicator ;
			Date_Rec 		SubroOpenDate	;
			Dataset(Date_Rec) SubroClosedDate ;
			STRING 			RecoveryAmount  ;
			Dataset(Date_Rec) RecoveryDate ;
			STRING 			RecoveryCategory ;
			STRING 			Subrogationpotentialind ;
	END;
	

	
	
	 Export ClaimInvolvedUnits_Tracking	:=	Record
	   RecValidation;
		 unsigned     CIUSeqNo;
		 STRING 			UnitID ;
		 STRING 			OwnerPartyID ;
		 Dataset(Field_Rec) PolicyIDs ;
		 STRING 			PropertyDamageDescription ;
		 STRING 			NumberofOccupants;		
		 dataset(EstimateAppraisal_Rec) EstimateAppraisal;			
		 STRING 			TotalLossInd ;
		 STRING 			OwnerRetainingSalvage;
		 STRING 			UnrelatedPriorDamage;
		 STRING 			PriorDamageEstimateAmount;
		 STRING 			SupplementPresent;
		 STRING 			SupplementAmount;
		 STRING 			AdditionalInsuranceCoverage ;
		 STRING 			AdditionalFirstPartyInsuranceCoverage ;
		 dataset(RepairFacility_Rec) RepairFacility ;	
		 Dataset(Vehicle_Rec) Vehicle	;	
		 Dataset(TheftRecovery_Rec) TheftRecovery ;
		 Dataset(Salvage_Rec) 			 Salvage  ;
		 //Dataset(Coverages_Tracking) Coverages	;				
	End;
	
	Export ClaimInvolvedUnits_Tracking1	:=	Record
	   RecValidation;
		 unsigned     CIUSeqNo;
		 STRING 			UnitID ;
		 STRING 			OwnerPartyID ;
		Dataset(Field_Rec) PolicyIDs ;
		 STRING 			PropertyDamageDescription ;
		 STRING 			NumberofOccupants;		
		 dataset(EstimateAppraisal_Rec) EstimateAppraisal;			
		 STRING 			TotalLossInd ;
		 STRING 			OwnerRetainingSalvage;
		 STRING 			UnrelatedPriorDamage;
		 STRING 			PriorDamageEstimateAmount;
		 STRING 			SupplementPresent;
		 STRING 			SupplementAmount;
		 STRING 			AdditionalInsuranceCoverage ;
		 STRING 			AdditionalFirstPartyInsuranceCoverage ;
		 dataset(RepairFacility_Rec) RepairFacility ;	
		 Dataset(Vehicle_Rec) Vehicle	;	
		 Dataset(TheftRecovery_Rec) TheftRecovery ;
		 Dataset(Salvage_Rec) 			 Salvage  ;
		 Dataset(Coverages_rec) Coverages	;				
	End;
	
 	Export PrimaryAdjuster_Tracking := Record
	   RecValidation;
		 STRING 			Name ; 
		 STRING 			ID 	; 		
		 Dataset(Phone_Rec) PrimaryAdjPhoneNums		;
	END;

  Export subroreserveid := Record
    //lrejData;
		RecValidation;
		//string entitylevel;
		String      ReserveId ;
		end;
  Export reserveid := Record
    //lrejData;
		RecValidation;
		//string entitylevel;
		String20      ReserveId ;
		end;		

  Export siureserveid := Record
    //lrejData;
		RecValidation;
		//string entitylevel;
		String20      ReserveId ;
		end;		

  Export Paymentreserveid := Record
    RecValidation;
		String      ReserveId ;
		end;		
  Export PaymentMedicalbillid := Record
    RecValidation;
		String      MedicalBillId ;
		end;
  Export Medicalbillid:= record
  RecValidation;
		String      MedicalBillId ;
		end;
  Export Pharmacybillid:= record
  RecValidation;
		String      PharmacyBillId ;
		end;
  Export PaymentPharmacybillid := Record
    RecValidation;
		String      PharmacyBillId ;
		end;
  Export Providerid:= Record
   RecValidation;
   STRING 			ProviderID ; 
   end;
  Export Medicalproviderid := Record
    RecValidation;
		String    MedicalProviderId ;
		end;
  Export Pharmacyproviderid := Record
    RecValidation;
		String    MedicalProviderId ;
		end;
  Export partyid := Record
   Recvalidation;
   string partyid;
   end;
  Export ciupartyid := Record
   Recvalidation;
   string ownerpartyid;
    end;
 Export Policyid := Record
   Recvalidation;
   string Policyid;
    end;
  Export partyPolicyid := Record
   Recvalidation;
   string Policyid;
	 string type;
    end;
End;
