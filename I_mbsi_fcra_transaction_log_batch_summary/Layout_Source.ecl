EXPORT Layout_Source := RECORD 
   INTEGER4  batch_job_id,
   INTEGER4  product_id,
   STRING19  start_time,
   STRING19  end_time,
   STRING20  total_process_time,
   STRING9   account,
   INTEGER4  total_order,
   INTEGER4  hits,
   INTEGER4  no_hits,
   INTEGER4  errors,
   STRING19  date_added 
  END;
