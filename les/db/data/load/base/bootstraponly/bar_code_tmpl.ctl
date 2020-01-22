[MERGE INTO bar_code_tmpl b 
      USING (SELECT '@bar_code_tmpl_id@' bar_code_tmpl_id, @def_flg@ def_flg, '@aim_prefix@' aim_prefix, 
                    sysdate ins_dt, sysdate last_upd_dt, @@usr_id ins_user_id, @@usr_id last_upd_user_id
                    FROM dual) input 
         ON (b.bar_code_tmpl_id = input.bar_code_tmpl_id) 
 WHEN NOT MATCHED THEN
     INSERT (bar_code_tmpl_id, def_flg, aim_prefix, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.bar_code_tmpl_id, input.def_flg, input.aim_prefix, input.ins_dt, input.last_upd_dt, input.ins_user_id, 
             input.last_upd_user_id)]
