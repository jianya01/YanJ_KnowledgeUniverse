﻿IMPORT Brazil_HealthCare_FWA_Analytics_Layouts;

EXPORT FileCMDCleaned := MODULE
	EXPORT UserDefinition := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.UserDefinitions, 11, TRANSFORM({STRING GeneratedKey, INTEGER PatientDefinitionCounter, STRING100 PatientUserDefinition, INTEGER ProviderDefinitionCounter, STRING100 ProviderUserDefinition, INTEGER MedicalDefinitionCounter, STRING100 MedicalUserDefinition},
       SELF.GeneratedKey := LEFT.generatedkey;
       SELF.PatientDefinitionCounter := COUNTER;
       SELF.PatientUserDefinition := CASE(COUNTER,
              1 => LEFT.pat_latest_update_date,
              2 => LEFT.pat_user_def_01,
              3 => LEFT.pat_user_def_02,
              4 => LEFT.pat_user_def_03,
              5 => LEFT.pat_user_def_04,
              6 => LEFT.pat_user_def_05,
              7 => LEFT.pat_user_def_06,
              8 => LEFT.pat_user_def_07,
              9 => LEFT.pat_user_def_08,
              10 => LEFT.pat_user_def_09,
							11 => LEFT.pat_user_def_10, '');
			SELF.ProviderDefinitionCounter := COUNTER;
      SELF.ProviderUserDefinition := CASE(COUNTER,
              1 => LEFT.prov_latest_update_date,
              2 => LEFT.prov_user_def_01,
              3 => LEFT.prov_user_def_02,
              4 => LEFT.prov_user_def_03,
              5 => LEFT.prov_user_def_04,
              6 => LEFT.prov_user_def_05,
              7 => LEFT.prov_user_def_06,
              8 => LEFT.prov_user_def_07,
              9 => LEFT.prov_user_def_08,
              10 => LEFT.prov_user_def_09, '');
			SELF.MedicalDefinitionCounter := COUNTER;
      SELF.MedicalUserDefinition := CASE(COUNTER,
              1 => LEFT.med_user_def_01,
              2 => LEFT.med_user_def_02,
              3 => LEFT.med_user_def_03,
              4 => LEFT.med_user_def_04,
              5 => LEFT.med_user_def_05,
              6 => LEFT.med_user_def_06,
              7 => LEFT.med_user_def_07,
              8 => LEFT.med_user_def_08,
              9 => LEFT.med_user_def_09,
							10 => LEFT.med_user_def_10, '')));
							
	EXPORT ProviderSpecialityCode := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.Provider, LEFT.specialitydetails, TRANSFORM({STRING50 providerkey, STRING20 providertype, STRING10 specialitycode}, 
			SELF.providerkey := LEFT.providerkey;
			SELF.providertype := LEFT.providertype;
			SELF := RIGHT));
			
	EXPORT AuthorizationRejectionCode := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.Authorisation, LEFT.requestrejectioncode, TRANSFORM({STRING200 generatedkey, STRING requestrejectioncode}, 
			SELF.generatedkey := LEFT.generatedkey;
			SELF := RIGHT));
			
	EXPORT DiagnosisType := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.Diagnosis, LEFT.diagnosistype, TRANSFORM({STRING200 generatedkey, string2 source, string20 diagnosiscode, string2 codetype, string300 description},
			SELF.generatedkey := LEFT.generatedkey;
			SELF := RIGHT));
			
	EXPORT ProcedureType := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.Diagnosis, LEFT.proceduretype, TRANSFORM({STRING200 generatedkey, string2 source, string50 procedurecode, string10 procedurecodetype, string300 description},
			SELF.generatedkey := LEFT.generatedkey;
			SELF := RIGHT));
			
	EXPORT NCDDetails := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.Diagnosis, LEFT.ndcdetails, TRANSFORM({STRING200 generatedkey, string11 code, string6 quantity, string2 unitsofmeasure},
			SELF.generatedkey := LEFT.generatedkey;
			SELF := RIGHT));
			
	EXPORT TreatmentDetails := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.Diagnosis, LEFT.treatmentdetails, TRANSFORM({STRING200 generatedkey, string treatmenttype, string surgerytype, string medicinesystem, string treatmentgiven},
		SELF.generatedkey := LEFT.generatedkey;
		SELF := RIGHT));
			
	EXPORT IllnessDetails := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.Diagnosis, LEFT.illnessdetails, TRANSFORM({STRING200 generatedkey, string diseasefirstdetecteddate, string firstconsultationdate, string500 presentcomplaints, string3 presentailmentduration, string1 pedcomplicationindicator, string500 pedcomplicationdetails, string1 prevsurgerycomplicationindicator, string1 alcoholconsumptionindicator, string1 congenitaldiseaseindicator, string1000 medicalhistory},
		SELF.generatedkey := LEFT.generatedkey;
		SELF := RIGHT));
			
	EXPORT MaternityDetails := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.Diagnosis, LEFT.maternitydetails, TRANSFORM({STRING200 generatedkey, string8 deliverydate, string1 prematurebabyindicator},
		SELF.generatedkey := LEFT.generatedkey;
		SELF := RIGHT));
			
	EXPORT InjuryType := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Porto.Diagnosis, LEFT.injurytype, TRANSFORM({STRING200 generatedkey, string8 injurydate, string50 injurycause, string300 injurycausedescription, string1 medicolegalindicator},
		SELF.generatedkey := LEFT.generatedkey;
		SELF := RIGHT));
END;
