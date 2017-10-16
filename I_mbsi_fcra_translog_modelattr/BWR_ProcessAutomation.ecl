﻿#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_fcra_translog_modelattr');
   
   IMPORT STD,I_mbsi_fcra_translog_modelattr, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_fcra_translog_modelattr, //module name
   														  'Vault Ingest - MBSI FCRA Transaction log - Model Attribute ');	
