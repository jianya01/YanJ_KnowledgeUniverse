//This is the code to execute in a builder window
#OPTION('multiplePersistInstances', FALSE);
#workunit('name','I_infutorcid_fcra_did_qa.BWR_Ingest - Ingest - SALT V3.11.2');
IMPORT I_infutorcid_fcra_did_qa,SALT311;
//If you are not ingesting as part of a header build you can use the below;
// Set CloseOlds to TRUE to ensure that all 'Old' open records will be closed.
// and EndDate := 'YYYYMMDD' to close Olds with.
CloseOlds := FALSE;
EndDate := ''; // Today()-1 (day or second) will be used.
ingestMod := I_infutorcid_fcra_did_qa.Ingest(CloseOlds, EndDate);
f_AllRecords := '~temp::vault_rid::I_infutorcid_fcra_did_qa::ingest::AllRecords';
f_ActiveRecords := '~temp::vault_rid::I_infutorcid_fcra_did_qa::ingest::ActiveRecords';
O := OUTPUT(ingestMod.AllRecords_Notag,,f_AllRecords,COMPRESSED,OVERWRITE); // Remove _Notag to keep 'what happened' byte
N_U := OUTPUT(ingestMod.NewRecords_Notag+ingestMod.UpdatedRecords_Notag,,f_ActiveRecords,COMPRESSED,OVERWRITE); // Remove _Notag to keep 'what happened' byte
PARALLEL(
         ingestMod.DoStats,
         O,
         N_U,
         ingestMod.ValidityStats,
         OUTPUT(ingestMod.StandardStats(), ALL, NAMED('StandardStats'))
         );
