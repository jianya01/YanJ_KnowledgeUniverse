EXPORT Layout_Source := RECORD 
		INTEGER4 batch_job_id,
		INTEGER4 batch_seq_number,
		INTEGER1 type,
		STRING   request_data{BLOB},
		STRING   response_data{BLOB},
		STRING9  request_format,
		STRING9  response_format,
		STRING30 user_added,
		STRING19 date_added 
	END;