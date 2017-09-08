EXPORT Layout_ECLIngest_Prefix := RECORD
	unsigned8 vault_rid;
  unsigned4 vault_date_first_seen;
  unsigned4 vault_date_last_seen;
	STRING1 Vault_Active_flag;
END;