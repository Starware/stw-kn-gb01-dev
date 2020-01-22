[MERGE INTO zonmst z 
      USING (SELECT @wrk_zone_id@ wrk_zone_id, '@wrkzon@' wrkzon, '@wh_id@' wh_id, '@bldg_id@' bldg_id, '@wrkare@' wrkare, 
                    to_number('@maxdev@') maxdev, to_number('@oosflg@') oosflg, to_number('@trvseq@') trvseq, to_number('@prithr@') prithr, 
                    to_number('@maxprithr@') maxprithr, '@pck_exp_are@' pck_exp_are, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, 
                    '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (z.wrk_zone_id = input.wrk_zone_id) 
 WHEN NOT MATCHED THEN
     INSERT (wrk_zone_id, wrkzon, wh_id, bldg_id, wrkare, maxdev, oosflg, trvseq, prithr, maxprithr, pck_exp_are, moddte, mod_usr_id) 
     VALUES (input.wrk_zone_id, input.wrkzon, input.wh_id, input.bldg_id, input.wrkare, input.maxdev, input.oosflg, input.trvseq, 
             input.prithr, input.maxprithr, input.pck_exp_are, input.moddte, input.mod_usr_id)]
