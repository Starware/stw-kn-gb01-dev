[MERGE INTO def_serv d 
      USING (SELECT '@def_serv_id@' def_serv_id, '@wh_id@' wh_id, '@def_serv_cod@' def_serv_cod, '@client_id@' client_id, 
                    '@carcod@' carcod, '@prtnum@' prtnum, '@prt_client_id@' prt_client_id, '@invsts@' invsts, '@invtyp@' invtyp, 
                    '@supnum@' supnum, '@cstnum@' cstnum, '@csttyp@' csttyp, '@ordnum@' ordnum, '@ordtyp@' ordtyp, '@ordlin@' ordlin, 
                    '@ordsln@' ordsln, to_number('@dst_mov_zone_id@') dst_mov_zone_id, '@srvlvl@' srvlvl, '@serv_id@' serv_id, 
                    '@serv_rate_id@' serv_rate_id, @serv_req_flg@ serv_req_flg, '@trlr_typ@' trlr_typ, '@vehtyp@' vehtyp, 
                    '@rate_serv_nam@' rate_serv_nam, '@adr_id@' adr_id, '@stop_act_typ@' stop_act_typ, '@comcod@' comcod, 
                    to_number('@untcst@') untcst, '@usr_id@' usr_id, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, 
                    '@mod_usr_id@' mod_usr_id, '@trlr_cod@' trlr_cod
                    FROM dual) input 
         ON (d.def_serv_id = input.def_serv_id
             AND d.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (def_serv_id, wh_id, def_serv_cod, client_id, carcod, prtnum, prt_client_id, invsts, invtyp, supnum, cstnum, csttyp, ordnum, 
             ordtyp, ordlin, ordsln, dst_mov_zone_id, srvlvl, serv_id, serv_rate_id, serv_req_flg, trlr_typ, vehtyp, rate_serv_nam, adr_id, 
             stop_act_typ, comcod, untcst, usr_id, moddte, mod_usr_id, trlr_cod) 
     VALUES (input.def_serv_id, input.wh_id, input.def_serv_cod, input.client_id, input.carcod, input.prtnum, input.prt_client_id, 
             input.invsts, input.invtyp, input.supnum, input.cstnum, input.csttyp, input.ordnum, input.ordtyp, input.ordlin, input.ordsln, 
             input.dst_mov_zone_id, input.srvlvl, input.serv_id, input.serv_rate_id, input.serv_req_flg, input.trlr_typ, input.vehtyp, 
             input.rate_serv_nam, input.adr_id, input.stop_act_typ, input.comcod, input.untcst, input.usr_id, input.moddte, 
             input.mod_usr_id, input.trlr_cod)]