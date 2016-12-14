#workunit('name', 'BWR_Aircraft_Test_Script');

IMPORT KELGlobal,FAA;

OUTPUT(FAA.key_aircraft_id, NAMED('RawAircraftFile'));
OUTPUT(KELGlobal.Q_Aircraft_Dump.Res0, NAMED('AircraftDump'));
OUTPUT(KELGlobal.Q_Aircraft_Owner_Dump.Res0, NAMED('AircraftOwnerAssociation'));
OUTPUT(KELGlobal.Q_Aircraft_Person.Res0, NAMED('ShowAircraftOwnerID'));
OUTPUT(KELGlobal.Q_Aircraft_Owner_Name.Res0, NAMED('AircraftOwnerName'));