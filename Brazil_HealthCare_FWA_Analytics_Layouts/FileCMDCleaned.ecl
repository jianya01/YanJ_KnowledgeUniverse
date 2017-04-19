﻿IMPORT Brazil_HealthCare_FWA_Analytics_Layouts;

EXPORT FileCMDCleaned := MODULE
	EXPORT PatientUserDefinition := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Patient, 11, TRANSFORM({STRING PatientKey, INTEGER DefinitionCounter, STRING100 UserDefinition},
       SELF.PatientKey := LEFT.PATIENT_KEY;
       SELF.DefinitionCounter := COUNTER;
       SELF.UserDefinition := CASE(COUNTER,
              1 => LEFT.PAT_USER_DEF_01,
              2 => LEFT.PAT_USER_DEF_02,
              3 => LEFT.PAT_USER_DEF_03,
              4 => LEFT.PAT_USER_DEF_04,
              5 => LEFT.PAT_USER_DEF_05,
              6 => LEFT.PAT_USER_DEF_06,
              7 => LEFT.PAT_USER_DEF_07,
              8 => LEFT.PAT_USER_DEF_08,
              9 => LEFT.PAT_USER_DEF_09,
              10 => LEFT.PAT_USER_DEF_10,
							11 => LEFT.PAT_USER_DEF_18, '')));
							
	EXPORT ProviderUserDefinition := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Provider, 11, TRANSFORM({STRING ProviderKey, STRING ProviderType, INTEGER DefinitionCounter, STRING100 UserDefinition},
       SELF.ProviderKey := LEFT.PROVIDER_KEY;
			 SELF.ProviderType := LEFT.PROVIDER_TYPE;
       SELF.DefinitionCounter := COUNTER;
       SELF.UserDefinition := CASE(COUNTER,
              1 => LEFT.PROV_USER_DEF_01,
              2 => LEFT.PROV_USER_DEF_02,
              3 => LEFT.PROV_USER_DEF_03,
              4 => LEFT.PROV_USER_DEF_04,
              5 => LEFT.PROV_USER_DEF_05,
              6 => LEFT.PROV_USER_DEF_06,
              7 => LEFT.PROV_USER_DEF_07,
              8 => LEFT.PROV_USER_DEF_08,
              9 => LEFT.PROV_USER_DEF_09,
              10 => LEFT.PROV_USER_DEF_10, '')));
							
	EXPORT ClaimUserDefinition := NORMALIZE(Brazil_HealthCare_FWA_Analytics_Layouts.Medical, 11, TRANSFORM({STRING ClaimKey, STRING ClaimLineNumber, INTEGER DefinitionCounter, STRING100 UserDefinition, INTEGER RejectionReasonCounter, STRING100 RejectionReason, INTEGER DiagnosisCodeCounter, STRING100 DiagnosisCode, INTEGER ProcedureCodeModifierCounter, STRING100 ProcedureCodeModifier, INTEGER ProcedureCodeCounter, STRING100 ProcedureCode,  INTEGER DrugCounter, STRING11 NationalDrugCode, STRING6 NationalDrugCodeQuantity, STRING2 NationalDrugCodeUnits},
       SELF.ClaimKey := LEFT.CLAIM_NUM;
			 SELF.ClaimLineNumber := LEFT.CLAIM_LINE_NUM;
       SELF.DefinitionCounter := COUNTER;
       SELF.UserDefinition := CASE(COUNTER,
              1 => LEFT.MED_USER_DEF_01,
              2 => LEFT.MED_USER_DEF_02,
              3 => LEFT.MED_USER_DEF_03,
              4 => LEFT.MED_USER_DEF_04,
              5 => LEFT.MED_USER_DEF_05,
              6 => LEFT.MED_USER_DEF_06,
              7 => LEFT.MED_USER_DEF_07,
              8 => LEFT.MED_USER_DEF_08,
              9 => LEFT.MED_USER_DEF_09,
              10 => LEFT.MED_USER_DEF_10, '');
			 SELF.RejectionReasonCounter := COUNTER;
			 SELF.RejectionReason := CASE(COUNTER,
              1 => LEFT.REJ_REASON_1,
              2 => LEFT.REJ_REASON_1,
              3 => LEFT.REJ_REASON_1,
              4 => LEFT.REJ_REASON_1,
              5 => LEFT.REJ_REASON_1,
              6 => LEFT.REJ_REASON_1, '');
			 SELF.DiagnosisCodeCounter := COUNTER;
			 SELF.DiagnosisCode := CASE(COUNTER,
              1 => LEFT.DIAG_CD_1,
              2 => LEFT.DIAG_CD_2,
              3 => LEFT.DIAG_CD_3,
              4 => LEFT.DIAG_CD_4,
              5 => LEFT.DIAG_CD_5,
              6 => LEFT.DIAG_CD_6,
              7 => LEFT.DIAG_CD_7,
              8 => LEFT.DIAG_CD_8,
              9 => LEFT.DIAG_CD_9,
              10 => LEFT.DIAG_CD_10,
							11 => LEFT.DIAG_CD_11,
							12 => LEFT.DIAG_CD_12,'');
			 SELF.ProcedureCodeModifierCounter := COUNTER;
			 SELF.ProcedureCodeModifier := CASE(COUNTER,
              1 => LEFT.CPT_HCPCS_PROC_CD_MODIFIER_1,
              2 => LEFT.CPT_HCPCS_PROC_CD_MODIFIER_2,
              3 => LEFT.CPT_HCPCS_PROC_CD_MODIFIER_3,
              4 => LEFT.CPT_HCPCS_PROC_CD_MODIFIER_4,'');
			 SELF.ProcedureCodeCounter := COUNTER;
			 SELF.ProcedureCode := CASE(COUNTER,
              1 => LEFT.ICD_PROC_CD_1,
              2 => LEFT.ICD_PROC_CD_2,
              3 => LEFT.ICD_PROC_CD_3,
              4 => LEFT.ICD_PROC_CD_4,
              5 => LEFT.ICD_PROC_CD_5,'');
			 SELF.DrugCounter := COUNTER;
       SELF.NationalDrugCode := CASE(COUNTER,
              1 => LEFT.NDC_CD_1,
              2 => LEFT.NDC_CD_2,
              3 => LEFT.NDC_CD_3,
              4 => LEFT.NDC_CD_4,
              5 => LEFT.NDC_CD_5,
              6 => LEFT.NDC_CD_6,
              7 => LEFT.NDC_CD_7,
              8 => LEFT.NDC_CD_8,
              9 => LEFT.NDC_CD_9,
              10 => LEFT.NDC_CD_10, '');
			 SELF.NationalDrugCodeQuantity := CASE(COUNTER,
              1 => LEFT.NDC_CD_1_QTY,
              2 => LEFT.NDC_CD_2_QTY,
              3 => LEFT.NDC_CD_3_QTY,
              4 => LEFT.NDC_CD_4_QTY,
              5 => LEFT.NDC_CD_5_QTY,
              6 => LEFT.NDC_CD_6_QTY,
              7 => LEFT.NDC_CD_7_QTY,
              8 => LEFT.NDC_CD_8_QTY,
              9 => LEFT.NDC_CD_9_QTY,
              10 => LEFT.NDC_CD_10_QTY, '');
			 SELF.NationalDrugCodeUnits := CASE(COUNTER,
              1 => LEFT.NDC_CD_1_UOM,
              2 => LEFT.NDC_CD_2_UOM,
              3 => LEFT.NDC_CD_3_UOM,
              4 => LEFT.NDC_CD_4_UOM,
              5 => LEFT.NDC_CD_5_UOM,
              6 => LEFT.NDC_CD_6_UOM,
              7 => LEFT.NDC_CD_7_UOM,
              8 => LEFT.NDC_CD_8_UOM,
              9 => LEFT.NDC_CD_9_UOM,
              10 => LEFT.NDC_CD_10_UOM, '')));
							
	EXPORT TabledFlags := TABLE(Brazil_HealthCare_FWA_Analytics_Layouts.Flags, 
	{Flag_ID, Flag_Description, Flag_Aggregate_Value, Flag_Aggregate_Component, Flag_Proc_CD_Mins, Flag_Misc1, Flag_Misc2, Flag_Misc3, Flag_Misc4, Flag_Misc5},
	Flag_ID, Flag_Description, Flag_Aggregate_Value, Flag_Aggregate_Component, Flag_Proc_CD_Mins, Flag_Misc1, Flag_Misc2, Flag_Misc3, Flag_Misc4, Flag_Misc5);
	
	EXPORT FlagNotes := NORMALIZE(TabledFlags, 11, TRANSFORM({STRING FlagKey, INTEGER MiscCounter, STRING20 Misc},
       SELF.FlagKey := LEFT.flag_id;
       SELF.MiscCounter := COUNTER;
       SELF.Misc := CASE(COUNTER,
              1 => LEFT.flag_misc1,
              2 => LEFT.flag_misc2,
              3 => LEFT.flag_misc3,
              4 => LEFT.flag_misc4,
              5 => LEFT.flag_misc5, '')));
	
END;