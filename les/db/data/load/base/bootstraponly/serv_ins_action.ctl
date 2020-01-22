[MERGE INTO serv_ins_action s 
      USING (SELECT '@serv_ins_id@' serv_ins_id, '@serv_action_typ@' serv_action_typ, '@serv_action_cod@' serv_action_cod, @seqnum@ seqnum, 
                    '@rf_frm_id@' rf_frm_id, '@gui_frm_id@' gui_frm_id, '@cnfrm_val_var_nam@' cnfrm_val_var_nam, 
                    '@post_cnfrm_val_cmd@' post_cnfrm_val_cmd, '@invsts@' invsts, '@ems_evt_nam@' ems_evt_nam, '@rpt_id@' rpt_id, 
                    '@cmd@' cmd, '@hldnum@' hldnum, '@hldcod@' hldcod, '@hldpfx@' hldpfx, '@reacod@' reacod, 
                    to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (s.serv_ins_id = input.serv_ins_id
             AND s.serv_action_typ = input.serv_action_typ
             AND s.serv_action_cod = input.serv_action_cod
             AND s.seqnum = input.seqnum) 
 WHEN NOT MATCHED THEN
     INSERT (serv_ins_id, serv_action_typ, serv_action_cod, seqnum, rf_frm_id, gui_frm_id, cnfrm_val_var_nam, post_cnfrm_val_cmd, invsts, 
             ems_evt_nam, rpt_id, cmd, hldnum, hldcod, hldpfx, reacod, moddte, mod_usr_id) 
     VALUES (input.serv_ins_id, input.serv_action_typ, input.serv_action_cod, input.seqnum, input.rf_frm_id, input.gui_frm_id, 
             input.cnfrm_val_var_nam, input.post_cnfrm_val_cmd, input.invsts, input.ems_evt_nam, input.rpt_id, input.cmd, input.hldnum, 
             input.hldcod, input.hldpfx, input.reacod, input.moddte, input.mod_usr_id)]
