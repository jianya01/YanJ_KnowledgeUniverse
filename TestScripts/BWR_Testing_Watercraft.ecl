#workunit('name', 'BWR_Watercraft_Test_Script');

IMPORT KELGlobal, Watercraft, _Control, UT;

RawWatercraft := Watercraft.File_Base_Search_Prod;
OUTPUT(RawWatercraft, NAMED('RawWatercraftSearchFile'));

OutputTemp := KELGlobal.Q_Watercraft_Dump.Res0;
OUTPUT(OutputTemp, NAMED('WatercraftDump'));

OUTPUT(KELGlobal.Q_Watercraft_Owner_Dump.Res0, NAMED('WatercraftOwnerDump'));
OUTPUT(KELGlobal.Q_Watercraft_Owner_Name.Res0, NAMED('WatercraftOwnerName'));
OUTPUT(KELGlobal.Q_Person_Watercraft_Count.Res0, NAMED('PersonWatercraftCount'));
OUTPUT(KELGlobal.Q_Watercraft_Location.Res0, NAMED('WatercraftLocation')); 