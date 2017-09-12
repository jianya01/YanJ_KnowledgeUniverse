#workunit('name', 'BWR_ProcessAutomation-  I_clue_inquiry_history');
   
   IMPORT STD,I_clue_inquiry_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_clue_inquiry_history, //module name
   														  'Vault Ingest - CLUE Inquiry History ');	