//This is the code to execute in a builder window
#OPTION('multiplePersistInstances', FALSE);
#workunit('name','I_clue_transaction_log_vin.BWR_Ingest - Ingest - SALT V3.8.0');
IMPORT I_clue_transaction_log_vin,SALT38;
//If you are not ingesting as part of a header build you can use the below;
//Set CloseOlds to TRUE to ensure that all 'Old' open records will be closed
ingestMod := I_clue_transaction_log_vin.Ingest(FALSE);
f_AllRecords := '~temp::vault_rid::I_clue_transaction_log_vin::ingest::AllRecords';
f_ActiveRecords := '~temp::vault_rid::I_clue_transaction_log_vin::ingest::ActiveRecords';
O := OUTPUT(ingestMod.AllRecords_Notag,,f_AllRecords,COMPRESSED,OVERWRITE); // Remove _Notag to keep 'what happened' byte
N_U := OUTPUT(ingestMod.NewRecords_Notag+ingestMod.UpdatedRecords_Notag,,f_ActiveRecords,COMPRESSED,OVERWRITE); // Remove _Notag to keep 'what happened' byte
ingestMod.DoStats;
O;
N_U;
