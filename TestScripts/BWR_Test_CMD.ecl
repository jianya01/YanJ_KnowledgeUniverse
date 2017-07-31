﻿#workunit('name', 'BWR_Test_CMD');
IMPORT KELGlobal, Brazil_HealthCare_FWA_Analytics_Layouts;

OUTPUT(KELGlobal.Q_Patient_Dump_Porto.Res0, NAMED('PatientDump'));
OUTPUT(KELGlobal.Q_Provider_Facility_Dump_Porto.Res0, NAMED('ProviderFacilityDump'));
OUTPUT(KELGlobal.Q_Medical_Provider_Dump_Porto.Res0, NAMED('MedicalProviderDump'));
OUTPUT(KELGlobal.Q_Claim_Dump_Porto.Res0, NAMED('ClaimDump'));
OUTPUT(KELGlobal.Q_Phone_Dump_Porto.Res0, NAMED('PhoneDump'));
OUTPUT(KELGlobal.Q_Address_Dump_Porto.Res0, NAMED('AddressDump'));
OUTPUT(KELGlobal.Q_Policy_Dump_Porto.Res0, NAMED('PolicyDump'));
OUTPUT(KELGlobal.Q_Policy_Holder_Dump_Porto.Res0, NAMED('PolicyHolderDump'));