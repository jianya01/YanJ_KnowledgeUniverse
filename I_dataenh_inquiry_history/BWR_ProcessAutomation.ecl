﻿#workunit('name', 'BWR_ProcessAutomation-  I_dataenh_inquiry_history');
   
   IMPORT STD,I_dataenh_inquiry_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_dataenh_inquiry_history, //module name
   														  'Vault Ingest - Data Enhancement Inquiry history ');	