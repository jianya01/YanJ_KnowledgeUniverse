﻿#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_fcra_translog_model');
   
   IMPORT STD,I_mbsi_fcra_translog_model, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_fcra_translog_model, //module name
   														  'Vault Ingest - MBSI FCRA Transaction log - Model');	
