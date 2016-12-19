#workunit('name', 'BWR_Aircraft_Test_Script');

IMPORT KELGlobal,FAA, _Control;

OUTPUT(FAA.aircraft_did_reg((UNSIGNED8)did_out IN _Control.LexIDFilterSet), NAMED('RawAircraftFile'));
OUTPUT(KELGlobal.Q_Aircraft_Dump.Res0, NAMED('AircraftDump'));
OUTPUT(KELGlobal.Q_Aircraft_Owner_Dump.Res0, NAMED('AircraftOwnerAssociation'));

OUTPUT(KELGlobal.Q_Aircraft_Owner_Name.Res0, NAMED('AircraftCounts'));
OUTPUT(KELGlobal.Q_Person_Aircraft_Counts.Res0, NAMED('PersonAircraftCount'));
// OUTPUT(KELGlobal.Q_Aircraft_Location.Res0, NAMED('AircraftAddress')); //Not working for now