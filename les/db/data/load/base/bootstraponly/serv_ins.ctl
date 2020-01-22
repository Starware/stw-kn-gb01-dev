[MERGE INTO serv_ins s 
      USING (SELECT '@serv_id@' serv_id, '@serv_ins_id@' serv_ins_id, @seqnum@ seqnum, '@serv_ins_typ@' serv_ins_typ, 
                    to_number('@stop_serv_flg@') stop_serv_flg, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (s.serv_id = input.serv_id
             AND s.serv_ins_id = input.serv_ins_id) 
 WHEN NOT MATCHED THEN
     INSERT (serv_id, serv_ins_id, seqnum, serv_ins_typ, stop_serv_flg, moddte, mod_usr_id) 
     VALUES (input.serv_id, input.serv_ins_id, input.seqnum, input.serv_ins_typ, input.stop_serv_flg, input.moddte, input.mod_usr_id)]
