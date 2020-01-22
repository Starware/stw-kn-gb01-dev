[MERGE INTO wh_asset_cat w 
      USING (SELECT '@asset_cat@' asset_cat, '@wh_id@' wh_id, to_number('@ena_flg@') ena_flg, sysdate ins_dt, 
                    sysdate last_upd_dt, @@usr_id ins_user_id, 
                    @@usr_id last_upd_user_id
                    FROM dual) input 
         ON (w.asset_cat = input.asset_cat
             AND w.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (asset_cat, wh_id, ena_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.asset_cat, input.wh_id, input.ena_flg, input.ins_dt, input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
