[MERGE INTO sto_zone s 
      USING (SELECT @sto_zone_id@ sto_zone_id, '@sto_zone_cod@' sto_zone_cod, '@bldg_id@' bldg_id, '@wh_id@' wh_id, to_number('@conflg@') conflg, 
                    to_number('@con_pal_flg@') con_pal_flg, to_number('@fifflg@') fifflg, '@pckcod@' pckcod, '@prox_put_cod@' prox_put_cod, 
                    to_number('@rnwl_sto_flg@') rnwl_sto_flg, to_number('@set_locsts_flg@') set_locsts_flg, to_number('@set_maxqvl_flg@') set_maxqvl_flg, 
                    to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (s.sto_zone_id = input.sto_zone_id) 
 WHEN NOT MATCHED THEN
     INSERT (sto_zone_id, sto_zone_cod, bldg_id, wh_id, conflg, con_pal_flg, fifflg, pckcod, prox_put_cod, rnwl_sto_flg, set_locsts_flg, 
             set_maxqvl_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.sto_zone_id, input.sto_zone_cod, input.bldg_id, input.wh_id, input.conflg, input.con_pal_flg, input.fifflg, 
             input.pckcod, input.prox_put_cod, input.rnwl_sto_flg, input.set_locsts_flg, input.set_maxqvl_flg, input.ins_dt, 
             input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
