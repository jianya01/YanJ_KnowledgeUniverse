﻿#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_fcra_translog_extension');
   
   IMPORT STD,I_mbsi_fcra_translog_extension, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_fcra_translog_extension, //module name
   														  'Vault Ingest - MBSI FCRA Transaction log - Extension');	
