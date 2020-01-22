[MERGE INTO trlr_usr t 
      USING (SELECT '@trlr_id@' trlr_id, '@usr_id@' usr_id, to_number('@lock_flg@') lock_flg, 
                    to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (t.trlr_id = input.trlr_id
             AND t.usr_id = input.usr_id) 
 WHEN NOT MATCHED THEN
     INSERT (trlr_id, usr_id, lock_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.trlr_id, input.usr_id, input.lock_flg, input.ins_dt, input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
