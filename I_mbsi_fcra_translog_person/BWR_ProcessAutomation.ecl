﻿#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_fcra_translog_person');
   
   IMPORT STD,I_mbsi_fcra_translog_person, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_fcra_translog_person, //module name
   														  'Vault Ingest - MBSI FCRA Transaction log - Person ');	
