IMPORT Brazil_HealthCare_FWA_Analytics_Layouts;

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
							
	
END;
