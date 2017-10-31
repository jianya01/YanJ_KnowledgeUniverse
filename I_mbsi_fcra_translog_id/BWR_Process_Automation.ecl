﻿﻿#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_fcra_translog_id');
   
   IMPORT STD,I_mbsi_fcra_translog_id, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_fcra_translog_id, //module name
   														  'Vault Ingest - MBSI FCRA Transaction log - ID');
