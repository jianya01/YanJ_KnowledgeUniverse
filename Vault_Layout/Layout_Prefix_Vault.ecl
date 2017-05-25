EXPORT Layout_Prefix_Vault := RECORD
	unsigned8 vault_rid;
  unsigned4 vault_date_first_seen;
  unsigned4 vault_date_last_seen;
	UNSIGNED1 vault_record_status;
	Integer vault_UID_Hash;
END;