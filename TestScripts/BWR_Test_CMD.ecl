#workunit('name', 'BWR_Test_CMD');
IMPORT KELGlobal, Brazil_HealthCare_FWA_Analytics_Layouts;

OUTPUT(KELGlobal.Q_Patient_Dump_Porto.Res0, NAMED('PatientDump'));
OUTPUT(KELGlobal.Q_Provider_Dump_Porto.Res0, NAMED('ProviderDump'));
OUTPUT(KELGlobal.Q_Claim_Dump_Porto.Res0, NAMED('ClaimDump'));
OUTPUT(KELGlobal.Q_Phone_Dump_Porto.Res0, NAMED('PhoneDump'));
OUTPUT(KELGlobal.Q_Address_Dump_Porto.Res0, NAMED('AddressDump'));
OUTPUT(KELGlobal.Q_Policy_Holder_Dump_Porto.Res0, NAMED('PolicyHolderDump'));
OUTPUT(KELGlobal.Q_Patient_Phone_Dump_Porto.Res0, NAMED('PatientPhoneDump'));
OUTPUT(KELGlobal.Q_Patient_Policy_Holder_Relation_Dump_Porto.Res0, NAMED('PatientPolicyHolderRelationDump'));
OUTPUT(KELGlobal.Q_Patient_Address_Dump_Porto.Res0, NAMED('PatientAddressDump'));
OUTPUT(KELGlobal.Q_Policy_Holder_Claim_Dump_Porto.Res0, NAMED('PolicyHolderClaimDump'));
OUTPUT(KELGlobal.Q_Patient_Claim_Dump_Porto.Res0, NAMED('PatientClaimDump'));
OUTPUT(KELGlobal.Q_Provider_Address_Dump_Porto.Res0, NAMED('ProviderFacilityAddressDump'));
OUTPUT(KELGlobal.Q_Provider_Claim_Dump_Porto.Res0, NAMED('ProviderFacilityClaimDump'));
OUTPUT(KELGlobal.Q_Provider_Segment_Dump_Porto.Res0, NAMED('ProviderSegmentDump'));
OUTPUT(KELGlobal.Q_Segment_Dump_Porto.Res0, NAMED('SegmentDump'));


// OUTPUT(KELGlobal.Q_Patient_Dump.Res0, NAMED('PatientDump'));
// OUTPUT(KELGlobal.Q_Provider_Facility_Dump.Res0, NAMED('ProviderFacilityDump'));
// OUTPUT(KELGlobal.Q_Medical_Provider_Dump.Res0, NAMED('MedicalProviderDump'));
// OUTPUT(KELGlobal.Q_Claim_Dump.Res0, NAMED('ClaimDump'));
// OUTPUT(KELGlobal.Q_Phone_Dump.Res0, NAMED('PhoneDump'));
// OUTPUT(KELGlobal.Q_Address_Dump.Res0, NAMED('AddressDump'));
// OUTPUT(KELGlobal.Q_Policy_Dump.Res0, NAMED('PolicyDump'));
// OUTPUT(KELGlobal.Q_Policy_Holder_Dump.Res0, NAMED('PolicyHolderDump'));
// OUTPUT(KELGlobal.Q_Patient_Phone_Dump.Res0, NAMED('PatientPhoneDump'));
// OUTPUT(KELGlobal.Q_Patient_Policy_Holder_Relation_Dump.Res0, NAMED('PatientPolicyHolderRelationDump'));
// OUTPUT(KELGlobal.Q_Patient_Address_Dump.Res0, NAMED('PatientAddressDump'));
// OUTPUT(KELGlobal.Q_Policy_Holder_Claim_Dump.Res0, NAMED('PolicyHolderClaimDump'));
// OUTPUT(KELGlobal.Q_Patient_Claim_Dump.Res0, NAMED('PatientClaimDump'));
// OUTPUT(KELGlobal.Q_Policy_Claim_Dump.Res0, NAMED('PolicyClaimDump'));
// OUTPUT(KELGlobal.Q_Provider_Facility_Address_Dump.Res0, NAMED('ProviderFacilityAddressDump'));
// OUTPUT(KELGlobal.Q_Medical_Provider_Address_Dump.Res0, NAMED('MedicalProviderAddressDump'));
// OUTPUT(KELGlobal.Q_Provider_Facility_Claim_Dump.Res0, NAMED('ProviderFacilityClaimDump'));
// OUTPUT(KELGlobal.Q_Medical_Provider_Claim_Dump.Res0, NAMED('MedicalProviderClaimDump'));