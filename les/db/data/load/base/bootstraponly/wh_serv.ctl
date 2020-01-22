[MERGE INTO wh_serv w 
      USING (SELECT '@serv_id@' serv_id, '@wh_id@' wh_id, @seqnum@ seqnum, to_number('@mixed_prt_flg@') mixed_prt_flg, '@spec_serv_cod@' spec_serv_cod, 
                    to_number('@serv_enaflg@') serv_enaflg, '@lodlvl@' lodlvl, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id, 
                    to_number('@audit_thresh_cost@') audit_thresh_cost, '@crncy_code@' crncy_code, to_number('@accum_flg@') accum_flg
                    FROM dual) input 
         ON (w.serv_id = input.serv_id
             AND w.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (serv_id, wh_id, seqnum, mixed_prt_flg, spec_serv_cod, serv_enaflg, lodlvl, moddte, mod_usr_id, audit_thresh_cost, crncy_code, 
             accum_flg) 
     VALUES (input.serv_id, input.wh_id, input.seqnum, input.mixed_prt_flg, input.spec_serv_cod, input.serv_enaflg, input.lodlvl, 
             input.moddte, input.mod_usr_id, input.audit_thresh_cost, input.crncy_code, input.accum_flg)]
