﻿#workunit('name', 'BWR_ProcessAutomation-  I_Telematics_translog');
   
   IMPORT STD,I_Telematics_translog, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_Telematics_translog, //module name
   														  'Vault Ingest - Telematics Transaction log ');	
