[MERGE INTO sys_help s 
      USING (SELECT '@help_obj_typ@' help_obj_typ, '@help_obj_id@' help_obj_id, '@appl_id@' appl_id, '@frm_id@' frm_id, 
                    '@addon_id@' addon_id, @cust_lvl@ cust_lvl, '@help_id@' help_id, '@help_fil_id@' help_fil_id, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (s.help_obj_typ = input.help_obj_typ
             AND s.help_obj_id = input.help_obj_id
             AND s.appl_id = input.appl_id
             AND s.frm_id = input.frm_id
             AND s.addon_id = input.addon_id
             AND s.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (help_obj_typ, help_obj_id, appl_id, frm_id, addon_id, cust_lvl, help_id, help_fil_id, grp_nam) 
     VALUES (input.help_obj_typ, input.help_obj_id, input.appl_id, input.frm_id, input.addon_id, input.cust_lvl, input.help_id, 
             input.help_fil_id, input.grp_nam)]
|
    create cache time stamp
      where obj_nam = "SYS_HELP"
        and idx_val = "LES"