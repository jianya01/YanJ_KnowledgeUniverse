﻿#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_nonfcra_transaction_log_online');
   
   IMPORT STD,I_mbsi_nonfcra_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_nonfcra_transaction_log_online, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log Online');	