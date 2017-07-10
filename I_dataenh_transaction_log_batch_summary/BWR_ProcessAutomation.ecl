#workunit('name', 'BWR_ProcessAutomation-  I_dataenh_transaction_log_batch_summary');
   
   IMPORT STD,I_dataenh_transaction_log_batch_summary, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_dataenh_transaction_log_batch_summary, //module name
   														  'Data Enhancement transaction_log_batch_summary ');	