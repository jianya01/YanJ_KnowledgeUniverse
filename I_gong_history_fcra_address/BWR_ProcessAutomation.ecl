﻿#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_gong_history_fcra_address');
   
IMPORT STD,I_gong_history_fcra_address, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_gong_history_fcra_address, //module name
   														  'Vault Ingest - I_gong_history_fcra_address','','');	