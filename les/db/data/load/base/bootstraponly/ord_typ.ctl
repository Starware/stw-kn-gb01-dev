[MERGE INTO ord_typ o 
      USING (SELECT '@wh_id@' wh_id, '@ordtyp@' ordtyp, to_number('@bulk_pck_flg@') bulk_pck_flg, to_number('@allow_shp_res_flg@') allow_shp_res_flg, 
                    sysdate ins_dt, sysdate last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id 
                    FROM dual) input 
         ON (o.wh_id = input.wh_id
             AND o.ordtyp = input.ordtyp)
 WHEN NOT MATCHED THEN
     INSERT (wh_id, ordtyp, bulk_pck_flg, allow_shp_res_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.wh_id, input.ordtyp, input.bulk_pck_flg, input.allow_shp_res_flg, input.ins_dt, input.last_upd_dt, input.ins_user_id, 
             input.last_upd_user_id)]
