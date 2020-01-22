[MERGE INTO rftmst r 
      USING (SELECT '@devcod@' devcod, '@wh_id@' wh_id, '@curwrkare@' curwrkare, '@curstoloc@' curstoloc, '@hmewrkare@' hmewrkare, 
                    '@vehtyp@' vehtyp, '@rftmod@' rftmod, to_date('@actdte@','YYYYMMDDHH24MISS') actdte, 
                    to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id, 
                    to_number('@cur_wrk_zone_id@') cur_wrk_zone_id
                    FROM dual) input 
         ON (r.devcod = input.devcod
             AND r.wh_id = input.wh_id) 
 WHEN NOT MATCHED THEN
     INSERT (devcod, wh_id, curwrkare, curstoloc, hmewrkare, vehtyp, rftmod, actdte, moddte, mod_usr_id, cur_wrk_zone_id) 
     VALUES (input.devcod, input.wh_id, input.curwrkare, input.curstoloc, input.hmewrkare, input.vehtyp, input.rftmod, input.actdte, 
             input.moddte, input.mod_usr_id, input.cur_wrk_zone_id)]
