[MERGE INTO locftp l 
      USING (SELECT @locftp_id@ locftp_id, @length@ length, @width@ width, @height@ height, '@loccod@' loccod, @def_maxqvl@ def_maxqvl, 
                    '@pal_stck_rst@' pal_stck_rst, to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, '@ins_user_id@' ins_user_id, 
                    '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (l.locftp_id = input.locftp_id)
 WHEN NOT MATCHED THEN
     INSERT (locftp_id, length, width, height, loccod, def_maxqvl, pal_stck_rst, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.locftp_id, input.length, input.width, input.height, input.loccod, input.def_maxqvl, input.pal_stck_rst, input.ins_dt, 
             input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]