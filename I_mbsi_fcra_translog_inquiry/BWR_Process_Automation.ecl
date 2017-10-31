﻿﻿#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_fcra_translog_inquiry');
   
   IMPORT STD,I_mbsi_fcra_translog_inquiry, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_fcra_translog_inquiry, //module name
   														  'Vault Ingest - MBSI FCRA Transaction log - Inquiry History');
