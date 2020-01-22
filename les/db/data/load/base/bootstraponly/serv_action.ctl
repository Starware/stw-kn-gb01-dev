[MERGE INTO serv_action s 
      USING (SELECT '@serv_id@' serv_id, '@serv_action_typ@' serv_action_typ, '@serv_action_cod@' serv_action_cod, @seqnum@ seqnum, 
                    '@ems_evt_nam@' ems_evt_nam, '@rpt_id@' rpt_id, '@cmd@' cmd, to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, 
                    to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, '@ins_user_id@' ins_user_id, 
                    '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (s.serv_id = input.serv_id
             AND s.serv_action_typ = input.serv_action_typ
             AND s.serv_action_cod = input.serv_action_cod
             AND s.seqnum = input.seqnum) 
 WHEN NOT MATCHED THEN
     INSERT (serv_id, serv_action_typ, serv_action_cod, seqnum, ems_evt_nam, rpt_id, cmd, ins_dt, last_upd_dt, ins_user_id, 
             last_upd_user_id) 
     VALUES (input.serv_id, input.serv_action_typ, input.serv_action_cod, input.seqnum, input.ems_evt_nam, input.rpt_id, input.cmd, 
             input.ins_dt, input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
