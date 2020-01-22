[MERGE INTO cycle_abc_config c 
      USING (SELECT '@client_id@' client_id, '@supnum@' supnum, '@wh_id@' wh_id, to_number('@a_count_per_cycle@') a_count_per_cycle, 
                    to_number('@b_count_per_cycle@') b_count_per_cycle, to_number('@c_count_per_cycle@') c_count_per_cycle
                    FROM dual) input 
         ON (c.client_id = input.client_id
             AND c.supnum = input.supnum
             AND c.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (client_id, supnum, wh_id, a_count_per_cycle, b_count_per_cycle, c_count_per_cycle) 
     VALUES (input.client_id, input.supnum, input.wh_id, input.a_count_per_cycle, input.b_count_per_cycle, input.c_count_per_cycle)]
