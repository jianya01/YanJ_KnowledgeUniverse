﻿﻿#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_fcra_translog_online');
   
   IMPORT STD,I_mbsi_fcra_translog_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_fcra_translog_online, //module name
   														  'Vault Ingest - MBSI FCRA Transaction log - Online');
