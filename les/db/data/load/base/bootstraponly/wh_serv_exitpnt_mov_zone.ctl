[MERGE INTO wh_serv_exitpnt_mov_zone w 
      USING (SELECT '@serv_id@' serv_id, '@wh_id@' wh_id, '@exitpnt_typ@' exitpnt_typ, '@exitpnt@' exitpnt, 
                    @src_mov_zone_id@ src_mov_zone_id, @dst_mov_zone_id@ dst_mov_zone_id, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, 
                    '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (w.serv_id = input.serv_id
             AND w.wh_id = input.wh_id
             AND w.exitpnt_typ = input.exitpnt_typ
             AND w.exitpnt = input.exitpnt
             AND w.src_mov_zone_id = input.src_mov_zone_id
             AND w.dst_mov_zone_id = input.dst_mov_zone_id) 
 WHEN NOT MATCHED THEN
     INSERT (serv_id, wh_id, exitpnt_typ, exitpnt, src_mov_zone_id, dst_mov_zone_id, moddte, mod_usr_id) 
     VALUES (input.serv_id, input.wh_id, input.exitpnt_typ, input.exitpnt, input.src_mov_zone_id, input.dst_mov_zone_id, input.moddte, 
             input.mod_usr_id)]
