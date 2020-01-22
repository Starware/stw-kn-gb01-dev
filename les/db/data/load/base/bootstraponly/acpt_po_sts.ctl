[MERGE INTO acpt_po_sts a 
      USING (SELECT '@wh_id@' wh_id, '@rimsts@' rimsts, sysdate ins_dt, 
                    sysdate last_upd_dt, @@usr_id ins_user_id, 
                    @@usr_id last_upd_user_id
                    FROM dual) input 
         ON (a.wh_id = input.wh_id
             AND a.rimsts = input.rimsts) 
 WHEN NOT MATCHED THEN
     INSERT (wh_id, rimsts, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.wh_id, input.rimsts, input.ins_dt, input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
