#workunit('name', 'BWR_Test_CMD');
IMPORT KELGlobal, Brazil_HealthCare_FWA_Analytics_Layouts;

OUTPUT(KELGlobal.Q_Patient_Dump.Res0, NAMED('PatientDump'));
OUTPUT(KELGlobal.Q_Provider_Facility_Dump.Res0, NAMED('ProviderFacilityDump'));
OUTPUT(KELGlobal.Q_Medical_Provider_Dump.Res0, NAMED('MedicalProviderDump'));
OUTPUT(KELGlobal.Q_Claim_Dump.Res0, NAMED('ClaimDump'));
OUTPUT(KELGlobal.Q_Service_Dump.Res0, NAMED('ServiceDump'));
OUTPUT(KELGlobal.Q_Flag_Dump.Res0, NAMED('FlagDump'));
OUTPUT(KELGlobal.Q_Address_Dump.Res0, NAMED('AddressDump'));
OUTPUT(KELGlobal.Q_Policy_Dump.Res0, NAMED('PolicyDump'));
OUTPUT(KELGlobal.Q_Policy_Holder_Dump.Res0, NAMED('PolicyHolderDump'));
OUTPUT(KELGlobal.Q_S_S_N_Dump.Res0, NAMED('SSNDump'));