[MERGE INTO actcod a 
      USING (SELECT '@actcod@' actcod, '@actcod_typ@' actcod_typ, to_number('@voc_cod@') voc_cod, to_number('@lms_flg@') lms_flg, 
                    '@worktype_id@' worktype_id, to_number('@indflg@') indflg, '@asgn_typ@' asgn_typ, '@disc_proc_id@' disc_proc_id, 
                    to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (a.actcod = input.actcod)
 WHEN NOT MATCHED THEN
     INSERT (actcod, actcod_typ, voc_cod, lms_flg, worktype_id, indflg, asgn_typ, disc_proc_id, ins_dt, last_upd_dt, ins_user_id, 
             last_upd_user_id) 
     VALUES (input.actcod, input.actcod_typ, input.voc_cod, input.lms_flg, input.worktype_id, input.indflg, input.asgn_typ, 
             input.disc_proc_id, input.ins_dt, input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
