EXPORT Layout_Prefix_Vault := RECORD
	UNSIGNED4 vault_date_first_seen;
	UNSIGNED4 vault_date_last_seen;
	STRING1 vault_active_flag;
	UNSIGNED8 vault_rid;
END;