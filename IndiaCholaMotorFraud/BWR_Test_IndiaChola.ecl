#workunit('name', 'BWR_Test_IndiaChola');
IMPORT * FROM IndiaCholaMotorFraud;
IMPORT KEL09 AS KEL;
IMPORT * FROM KEL09.Null; 



OUTPUT(IndiaCholaMotorFraud.ClaimsFile, NAMED('RawClaimFile'));
OUTPUT(IndiaCholaMotorFraud.PolicyFile, NAMED('RawPolicyFile'));
OUTPUT(IndiaCholaMotorFraud.VehicleFile, NAMED('RawVehicleFile'));
OUTPUT(IndiaCholaMotorFraud.PolicyHistoryFile, NAMED('RawPolicyHistoryFile'));
OUTPUT(IndiaCholaMotorFraud.SellerFile, NAMED('RawSellerFile'));
OUTPUT(Q_Dump_Claims.Res0, NAMED('ClaimsDump'));
OUTPUT(Q_Dump_Policies.Res0, NAMED('PolicyDump'));
OUTPUT(Q_Dump_Vehicles.Res0, NAMED('VehiclesDump'));
OUTPUT(Q_Dump_Claim_Vehicle.Res0, NAMED('ClaimVehicleDump'));
OUTPUT(Q_Dump_Claim_Policy.Res0, NAMED('ClaimPolicyDump'));
