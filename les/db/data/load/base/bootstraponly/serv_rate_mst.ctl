[MERGE INTO serv_rate_mst s 
      USING (SELECT '@serv_rate_id@' serv_rate_id, '@qty_by_cod@' qty_by_cod, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, 
                    '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (s.serv_rate_id = input.serv_rate_id) 
 WHEN NOT MATCHED THEN
     INSERT (serv_rate_id, qty_by_cod, moddte, mod_usr_id) 
     VALUES (input.serv_rate_id, input.qty_by_cod, input.moddte, input.mod_usr_id)]
