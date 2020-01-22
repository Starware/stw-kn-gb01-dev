[MERGE INTO sto_tmpl_hdr s 
      USING (SELECT @sto_tmpl_hdr_id@ sto_tmpl_hdr_id, @levels@ levels, @positions@ positions, 
                    to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (s.sto_tmpl_hdr_id = input.sto_tmpl_hdr_id) 
 WHEN NOT MATCHED THEN
     INSERT (sto_tmpl_hdr_id, levels, positions, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.sto_tmpl_hdr_id, input.levels, input.positions, input.ins_dt, input.last_upd_dt, input.ins_user_id, 
             input.last_upd_user_id)]
