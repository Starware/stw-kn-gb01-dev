[MERGE INTO wh_serv_exitpnt w 
      USING (SELECT '@serv_id@' serv_id, '@wh_id@' wh_id, '@exitpnt_typ@' exitpnt_typ, '@exitpnt@' exitpnt, 
                    to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (w.serv_id = input.serv_id
             AND w.wh_id = input.wh_id
             AND w.exitpnt_typ = input.exitpnt_typ
             AND w.exitpnt = input.exitpnt) 
 WHEN NOT MATCHED THEN
     INSERT (serv_id, wh_id, exitpnt_typ, exitpnt, moddte, mod_usr_id) 
     VALUES (input.serv_id, input.wh_id, input.exitpnt_typ, input.exitpnt, input.moddte, input.mod_usr_id)]
