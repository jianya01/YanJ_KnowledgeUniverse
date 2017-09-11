﻿USE Brazil_HealthCare_FWA_Analytics_Layouts.Intermedica.Patient(FLAT,
	Patient(
		UID = insurerinsuredid,
		IndustryInsuredID = industryinsuredid,
		IndustryInsuredIDType = industryinsuredidtype,
		FirstName = name,
		DateOfBirth = dateofbirth,
		DateOfDeath = dateofdeath,
		Gender = gender,
		TPAInsuredID = tpainsuredid,
		Email = email,
		IdentityDocumentType = identityproofdetails.documenttype,
		IdentityDocumentID = identityproofdetails.documentid,
		IdentityDescription = identityproofdetails.description,
		IsPolicyHolder = patientsameasprimarymemberindicator,
		IsProposer = patientsameasproposerindicator,
		MedicalHistory = medicalhistory,
		AuthorizationCode = authorizationcode),
	PolicyHolder(
		UID = primaryinsuredmemberkey,
		PolicyCertificateNumber = policycertificatenumber,
		EmployeeID = employeeid,
		EmployeeDateOfJoining = employeedoj,
		EmployeeDateOfExit = employeedoe,
		EffectiveDate = eligibledate,
		ExpirationDate = iligibledate,
		PlanName = planname,
		PlanNumber = plannumber),
	Phone(
		UID = telephones.phonenumber,
		PhoneNumber = telephones.phonenumber,
		CountryCode = telephones.countrycode,
		StateCode = telephones.statecode,
		PhoneType = telephones.phonetype),
	Address(
		Address1 = address.address,
		Address2 = address.addresscomplementary,
		HomeNumber = address.homenumber,
		City = address.cityname,
		State = address.statename,
		ZipCode = address.zipcode,
		HomeCityCode = address.homecitycode,
		Country = address.countryname),
	PatientAddress(
		Subject = insurerinsuredid,
		Address1 = address.address,
		Address2 = address.addresscomplementary,
		ZipCode = address.zipcode),
	PatientPolicyHolderRelation(
		First = insurerinsuredid,
		Second = primaryinsuredmemberkey,
		FamilyLinkID = familylinkid,
		RelationshipCode = relationshipcode),
	PatientPhone(
		Subject = insurerinsuredid,
		PhoneNumber = telephones.phonenumber),
	PatientClaim(
		Subject = insurerinsuredid,
		GeneratedKey = generatedkey),
	PolicyHolderClaim(
		Insured = primaryinsuredmemberkey,
		GeneratedKey = generatedkey),
	PERMITS([Intermedica]));

USE Brazil_HealthCare_FWA_Analytics_Layouts.Intermedica.Policy(FLAT,
	Policy(UID = policynumber,
		ApplicationNumber = applicationnumber,
		Status = policystatus,
		GroupNumber = employergroupnumber,
		DivisionNumber = primaryinsureddivisionnumber,
		Classification = policyclassification,
		GroupPolicyClassification = grouppolicyclassification,
		PlanType = plantype,
		IRDAProductType = irdaproducttype,
		CoverageType = coveragetype,
		CoverageStatus = coveragestatus,
		StartDate = policystartdate,
		EndDate = policyenddate,
		CancellationTerminationDate = policycancellationterminationdate),
	PolicyClaim(
		Insurance = policynumber,
		GeneratedKey = generatedkey),
	PERMITS([Intermedica]));

USE Brazil_HealthCare_FWA_Analytics_Layouts.Intermedica.Provider(FLAT,
	ProviderFacility(FILTER(providertype = 'F'),
		ProviderKey = providerfacilitynumber,
		InsurerProviderNumber = insurerprovidernumber,
		IndustryProviderNumber = industryprovidernumber,
		IndustryProviderIDType = industryprovideridtype,
		Type = providertype,
		TaxID = providertaxid,
		NetworkCode = networkcode,
		FirstName = providername,
		RecentBirthIndicator = recentbirthindicator,
		RegimeOfHospitalisation = regimeofhospitalisation,
		CPFOrCNPJ = providercpforcnpj,
		AuthorizationCode = authorizationcode,
		DrugEnforcementAdministrationNumber = drugenforcementadministrationnumberdea,
		Taxanomy = taxonomy,
		WatchCode = watchcode,
		SpecialityCode = specialitydetails),
	MedicalProvider(FILTER(providertype != 'F'),
		InsurerProviderNumber = insurerprovidernumber,
		IndustryProviderNumber = industryprovidernumber,
		IndustryProviderIDType = industryprovideridtype,
		Type = providertype,
		TaxID = providertaxid,
		NetworkCode = networkcode,
		FirstName = providername,
		RecentBirthIndicator = recentbirthindicator,
		RegimeOfHospitalisation = regimeofhospitalisation,
		CPFOrCNPJ = providercpforcnpj,
		AuthorizationCode = authorizationcode,
		DrugEnforcementAdministrationNumber = drugenforcementadministrationnumberdea,
		Taxanomy = taxonomy,
		ProviderKey = providerfacilitynumber,
		WatchCode = watchcode,
		SpecialityCode = specialitydetails),
	Address(
		Address1 = address.address,
		Address2 = address.addresscomplementary,
		City = address.cityname,
		State = address.statename,
		ZipCode = address.zipcode,
		HomeNumber = address.homenumber,
		Country = address.countryname,
		HomeCityCode = address.homecitycode),
	ProviderFacilityAddress(FILTER(providertype = 'F'),
		ProviderKey = providerfacilitynumber,
		Address1 = address.address,
		Address2 = address.addresscomplementary,
		ZipCode = address.zipcode),
	MedicalProviderAddress(FILTER(providertype != 'F'),
		ProviderKey = insurerprovidernumber,
		Address1 = address.address,
		Address2 = address.addresscomplementary,
		ZipCode = address.zipcode),
	ProviderFacilityClaim(FILTER(providertype = 'F'),
		ProviderKey = providerfacilitynumber,
		GeneratedKey = generatedkey),
	MedicalProviderClaim(FILTER(providertype != 'F'),
		ProviderKey = insurerprovidernumber,
		GeneratedKey = generatedkey),
	PERMITS([Intermedica]));

USE Brazil_HealthCare_FWA_Analytics_Layouts.Intermedica.Claims(FLAT,
	Claim(
		GeneratedKey = generatedkey,
		// ProviderNumber = claimprovidernumber,
		// PatientInsurerNumber = claiminsurernumber,
		InsurerNumber = insureruniqueid,
		Type = claimtype,
		InsurerName = insurer.insurername,
		ThirdPartyAdministratorCode = tpa.tpacode,
		ThirdPartyAdministratorName = tpa.tpaname,
		ReopenDate = claimreopendetails.reopendate,
		ReopenRemarks = claimreopendetails.reopenremarks,
		AuthorizationRequestedIndicator = authorizationrequestedindicator,
		DomiciliaryHospitalisationIndicator = domiciliaryhospitalisationindicator,
		TransactionType = transactiontype,
		DataContributorType = datacontributortype,
		TransactionCreationDateTime = transactioncreationdatetime,
		AuthorizationNumber = authorizationnumber,
		IntimationNumber = claimintimationnumber,
		IntimationDate = claimintimationdate,
		ClaimNumber = claimnumber,
		Status = claimstatus,
		AdmittanceDate = admittancedate,
		DischargeDate = dischargedate,
		DayCareTreatmentIndicator = daycaretreatmentindicator,
		ExtendedCareInpatientRehabilitationIndicator = extendedcareinpatientrehabilitationindicator,
		Nature = claimnature,
		RejectReasonCode = rejectreasoncode,
		RejectionReductionReasonDescription = claimrejectionreductionreasondescription,
		ReopenIndicator = claimreopenindicator,
		CopayApplicabilityIndicator = copayapplicabilityindicator,
		CopayApplicabilityReason = copayapplicabilityreason,
		CopayApplicabilityReasonOtherDescription = copayapplicabilityreasonotherdescription,
		CopayAmount = copayamount,
		DeductibleExcessIndicator = deductibleexcessindicator,
		DeductibleExcessAmount = deductibleexcessamount,
		TotalClaimedAmount = totalclaimedamount,
		TotalSanctionedAmount = totalsanctionedamount,
		TotalOutOfPocketExpenseAmount = totaloutofpocketexpenseamount,
		TotalCorporateAmountFloaterUsedAmount = totalcorporateamountfloaterusedamount,
		TotalDisallowedAmount = totaldisallowedamount,
		TotalPaidAmount = totalpaidamount,
		ThirdPartyAdministratorRemarks = tparemarks,
		PolicySumInsured = policysi,
		PolicyBalanceSumInsured = policybsi,
		MemberSumInsured = membersi,
		MemberBalanceSumInsured = memberbsi,
		CorporateFloaterSumInsured = corporatefloatersi,
		CorporateFloaterBalanceSumInsured = corporatefloaterbsi,
		OPDSumInsured = opdsi,
		OPDBalanceSumInsured = opdbsi,
		BillingStartDate = billingstartdate,
		BillingEndDate = billingenddate,
		BirthRegistration = birthregistration,
		DeathRegistration = deathregistration,
		AdjustmentCode = adjustmentcode,
		AdjustmentNumber = adjustmentnumber,
		AuthorizationCode = authorizationcode,
		Source = source_ae_or_ca,
		AuthorizationTranReferenceNumber = tranreferencenumber,
		AuthorizationRequestReceivedDate = requestreceiveddate,
		AuthorizationRequestStatus = requeststatus,
		AuthorizationRequestStatusDescription = requeststatusdescription,
		AuthorizationRequestImpact = requestimpact),
	PERMITS([Intermedica]));

USE Brazil_HealthCare_FWA_Analytics_Layouts.Intermedica.LineItem(FLAT,
	Claim(
		GeneratedKey = generatedkey,
		DataSource = datasource,
		ExpenseType = expensetype,
		OtherExpenseTypeDescription = otherexpensetypedescription,
		HospitalizationExpensesDetails = hospitalisationexpensesdetails,
		LineType = linetype,
		LineCode = linecode,
		LineDescription = linedescription,
		ClaimedAmount = claimedamount,
		ApprovedAmount = approvedamount,
		RejectedReducedAmount = rejectedreducedamount,
		RejectedReducedReason = rejectedreducedreason,
		DaysBilled = daysbilled,
		DischargeReason = dischargereason,
		TotalProcedures = totalprocedures,
		TotalBedCost = totalbedcost,
		TotalRentals = totalrentals,
		TotalMaterials = totalmaterials,
		TotalConsidered = totalconsidered,
		TotalToSuppliers = totaltosuppliers,
		TotalChargedVsProprietaryCodes = totalchargedvsproprietarycodes,
		QuantityCharged = quantitycharged,
		CheckNumber = checknumber,
		CheckPaidDate = checkpaiddate,
		PaymentType = paymenttype,
		ReimbursementMethodType = reimbursementmethodtype,
		ReimbursementMethodVersion = reimbursementmethodversion,
		ReimbursementCode = reimbursementcode,
		SecondaryReimbursementcode = secondaryreimbursementcode,
		DiagnosisRelatedGroupPricing = drgpricing,
		OutlierCode = outliercode,
		RevenueCode = revenuecode,
		PayeeCode = payeecode,
		ProviderMedicareParticipation = providermedicareparticipation,
		MaxOutOfPocketMetIndividualInd = maxoutofpocketmetindividualind,
		MaxOutOfPocketMetFamilyInd = maxoutofpocketmetfamilyind,
		DeductibleMetIndividualInd = deductiblemetindividualind,
		DeductibleMetFamilyInd = deductiblemetfamilyind,
		PriceIndicator = priceindicator,
		ChargeAmount = chargeamount,
		ReasonableAndCustomaryAmount = reasonableandcustomaryamount),
	PERMITS([Intermedica]));


USE Brazil_HealthCare_FWA_Analytics_Layouts.Intermedica.Diagnosis(FLAT,
	Claim(
		GeneratedKey = generatedkey,
		HospitalizationType = hospitalizationtype,
		HospitalizationDueToMaternityIndicator = hospitalizationduetomaternityindicator,
		HospitalizationDueToInjuryIndicator = hospitalizationduetoinjuryindicator,
		PatientReasonForVisitDiagnosisCode = patientreasonforvisitdiagnosiscode,
		PlaceOfService = placeofservice,
		UnitOfServiceType = unitofservicetype,
		UnitsOfService = unitsofservice,
		UnitsOfServiceAllowed = unitsofserviceallowed,
		DiagnosisTypeSource = diagnosistype.source,
		DiagnosisCode = diagnosistype.diagnosiscode,
		DiagnosisCodeType = diagnosistype.codetype,
		DiagnosisDescription = diagnosistype.description,
		ProcedureTypeSource = proceduretype.source,
		ProcedureCode = proceduretype.procedurecode,
		ProcedureCodeType = proceduretype.procedurecodetype,
		ProcedureDescription = proceduretype.description,
		NDCCode = ndcdetails.code,
		NDCQuantity = ndcdetails.quantity,
		NDCUnitsOfMeasure = ndcdetails.unitsofmeasure,
		TreatmentType = treatmentdetails.treatmenttype,
		SurgeryType = treatmentdetails.surgerytype,
		MedicineSystem = treatmentdetails.medicinesystem,
		TreatmentGiven = treatmentdetails.treatmentgiven,
		DiseaseFirstDetectedDate = illnessdetails.diseasefirstdetecteddate,
		FirstConsultationDate = illnessdetails.firstconsultationdate,
		PresentComplaints = illnessdetails.presentcomplaints,
		PresentAilmentDuration = illnessdetails.presentailmentduration,
		PedCompilationIndicator = illnessdetails.pedcomplicationindicator,
		PedComplicationDetails = illnessdetails.pedcomplicationdetails,
		PreviousSurgeryComplicationIndicator = illnessdetails.prevsurgerycomplicationindicator,
		AlcoholConsumptionIndicator = illnessdetails.alcoholconsumptionindicator,
		CongenitalDiseaseIndicator = illnessdetails.congenitaldiseaseindicator,
		MedicalHistory = illnessdetails.medicalhistory,
		DeliveryDate = maternitydetails.deliverydate,
		PrematureBabyIndicator = maternitydetails.prematurebabyindicator,
		InjuryDate = injurytype.injurydate,
		InjuryCause = injurytype.injurycause,
		InjuryCauseDescription = injurytype.injurycausedescription,
		MedicolegalIndicator = injurytype.medicolegalindicator),
	PERMITS([Intermedica]));
		
USE Brazil_HealthCare_FWA_Analytics_Layouts.Intermedica.Authorisation(FLAT,
	Claim(
		GeneratedKey = generatedkey,
		AuthorizationRequestReceivedDate = requestreceiveddate,
		AuthorizationDate = authorizationdate,
		AuthorizationExpectedStayLength = expectedstaylength,
		AuthorizationReuestRejectionIndicator = requestrejectionindicator,
		AuthorizationReuestRejectionReason = requestrejectionreason,
		AuthorizationRequestStatus = requeststatus,
		AuthorizationRequestStatusDescription = requeststatusdescription),
	PERMITS([Intermedica]));