﻿#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_person');
   
   IMPORT STD,I_rules_transaction_log_person, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_person, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_person');	
														  
										
										
														  
														  