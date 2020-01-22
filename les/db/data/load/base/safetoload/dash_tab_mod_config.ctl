[MERGE INTO dash_tab_mod_config d 
      USING (SELECT '@mod_config_id@' mod_config_id, '@module_id@' module_id, '@tab_id@' tab_id, @srtseq@ srtseq, '@dda_qual@' dda_qual, 
                    to_number('@refresh_sec@') refresh_sec, '@description@' description, sysdate ctrl_dt, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (d.mod_config_id = input.mod_config_id)
 WHEN NOT MATCHED THEN
     INSERT (mod_config_id, module_id, tab_id, srtseq, dda_qual, refresh_sec, description, ctrl_dt, grp_nam) 
     VALUES (input.mod_config_id, input.module_id, input.tab_id, input.srtseq, input.dda_qual, input.refresh_sec, input.description, 
             input.ctrl_dt, input.grp_nam)]
