EXPORT Layout_Prefix_Vault_New := RECORD
	unsigned8 vault_rid;
  unsigned4 vault_date_first_seen;
  unsigned4 vault_date_last_seen;
	UNSIGNED1 vault_record_status;
	DATA16 vault_UID_Hash;
END;