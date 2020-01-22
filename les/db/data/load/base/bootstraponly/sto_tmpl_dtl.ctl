[MERGE INTO sto_tmpl_dtl s 
      USING (SELECT @sto_tmpl_dtl_id@ sto_tmpl_dtl_id, @sto_tmpl_hdr_id@ sto_tmpl_hdr_id, '@lvl@' lvl, '@lvl_name@' lvl_name, 
                    @loccnt@ loccnt, '@start_loc@' start_loc, @locftp_id@ locftp_id, to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, 
                    to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, '@ins_user_id@' ins_user_id, 
                    '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (s.sto_tmpl_dtl_id = input.sto_tmpl_dtl_id) 
 WHEN NOT MATCHED THEN
     INSERT (sto_tmpl_dtl_id, sto_tmpl_hdr_id, lvl, lvl_name, loccnt, start_loc, locftp_id, ins_dt, last_upd_dt, ins_user_id, 
             last_upd_user_id) 
     VALUES (input.sto_tmpl_dtl_id, input.sto_tmpl_hdr_id, input.lvl, input.lvl_name, input.loccnt, input.start_loc, input.locftp_id, 
             input.ins_dt, input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
