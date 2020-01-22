[MERGE INTO les_dyn_cfg l 
      USING (SELECT '@dyn_cfg_id@' dyn_cfg_id, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, @cust_lvl@ cust_lvl, 
                    '@inp_mod@' inp_mod, '@var_nam_lst@' var_nam_lst, '@les_cmd_id@' les_cmd_id, 
                    to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.dyn_cfg_id = input.dyn_cfg_id
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.addon_id = input.addon_id
             AND l.cust_lvl = input.cust_lvl) 
 WHEN NOT MATCHED THEN
     INSERT (dyn_cfg_id, appl_id, frm_id, addon_id, cust_lvl, inp_mod, var_nam_lst, les_cmd_id, moddte, mod_usr_id, grp_nam) 
     VALUES (input.dyn_cfg_id, input.appl_id, input.frm_id, input.addon_id, input.cust_lvl, input.inp_mod, input.var_nam_lst, 
             input.les_cmd_id, input.moddte, input.mod_usr_id, input.grp_nam)]
|
   create cache time stamp 
     where obj_nam = "DynCfg"
        and idx_val = "LES"