[MERGE INTO cycle_prompt_config c 
      USING (SELECT '@client_id@' client_id, '@wh_id@' wh_id, to_number('@req_entry_sum_single@') req_entry_sum_single, 
                    to_number('@req_entry_dtl_single@') req_entry_dtl_single, to_number('@req_entry_sum_multi@') req_entry_sum_multi, 
                    to_number('@req_entry_dtl_multi@') req_entry_dtl_multi
                    FROM dual) input 
         ON (c.client_id = input.client_id
             AND c.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (client_id, wh_id, req_entry_sum_single, req_entry_dtl_single, req_entry_sum_multi, req_entry_dtl_multi) 
     VALUES (input.client_id, input.wh_id, input.req_entry_sum_single, input.req_entry_dtl_single, input.req_entry_sum_multi, 
             input.req_entry_dtl_multi)]
