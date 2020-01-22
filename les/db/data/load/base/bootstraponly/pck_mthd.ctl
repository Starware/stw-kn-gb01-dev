[MERGE INTO pck_mthd p 
      USING (SELECT '@pck_mthd_id@' pck_mthd_id, '@pck_mthd_nam@' pck_mthd_nam, '@wh_id@' wh_id, to_number('@list_flg@') list_flg, to_number('@ctn_flg@') ctn_flg, 
                    '@skip_pick_valdt@' skip_pick_valdt, to_number('@inline_rpl_flg@') inline_rpl_flg, to_number('@rsv_pck_rel@') rsv_pck_rel,
                   sysdate ins_dt, sysdate last_upd_dt, '@ins_user_id@' ins_user_id, 
                    '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (p.pck_mthd_id = input.pck_mthd_id) 
 WHEN NOT MATCHED THEN
     INSERT (pck_mthd_id, pck_mthd_nam, wh_id, list_flg, ctn_flg, skip_pick_valdt, inline_rpl_flg, rsv_pck_rel, 
             ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.pck_mthd_id, input.pck_mthd_nam, input.wh_id, input.list_flg, input.ctn_flg, input.skip_pick_valdt, 
             input.inline_rpl_flg, input.rsv_pck_rel, input.ins_dt, input.last_upd_dt, 
             input.ins_user_id, input.last_upd_user_id)]
