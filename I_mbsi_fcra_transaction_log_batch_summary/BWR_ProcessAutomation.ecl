#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_fcra_transaction_log_batch_summary');
   
   IMPORT STD,I_mbsi_fcra_transaction_log_batch_summary, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_fcra_transaction_log_batch_summary, //module name
   														  'Vault Ingest - MBSI FCRA Transaction log batch summary');	
														  
														  
														  
														  
														  
														  
										
										
														  
														  