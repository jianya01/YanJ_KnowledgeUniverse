// Sample file with 149 records for test run
#workunit('name', 'BWR_ProcessAutomation-  CCtlogPol');
   
   IMPORT STD,CCtlogPol, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(CCtlogPol, //module name
   														// (STRING)Std.Date.Today(), 
   														'Vault SALT38PV3 Ingest CCtlogPol Test forBuildLog');	


/* #workunit('name', 'BWR_ProcessAutomation-  DEtranOL');
   
   IMPORT STD,DEtranOL, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(DEtranOL, //module name
   														(STRING)Std.Date.Today(), 
   														'Vault SALT38PV3 Ingest DEtranOL Test forBuildLog');	
*/