[MERGE INTO les_var_valdt l 
      USING (SELECT '@var_nam@' var_nam, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, @cust_lvl@ cust_lvl, 
                    '@valdt_cmd@' valdt_cmd, @ena_flg@ ena_flg, nvl('@valdt_mod@', 'I') valdt_mod, @ret_fld_flg@ ret_fld_flg, '@ret_fld@' ret_fld, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.var_nam = input.var_nam
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.addon_id = input.addon_id
             AND l.cust_lvl = input.cust_lvl) 
 WHEN NOT MATCHED THEN
     INSERT (var_nam, appl_id, frm_id, addon_id, cust_lvl, valdt_cmd, ena_flg, valdt_mod, ret_fld_flg, ret_fld, grp_nam) 
     VALUES (input.var_nam, input.appl_id, input.frm_id, input.addon_id, input.cust_lvl, input.valdt_cmd, input.ena_flg, input.valdt_mod, 
             input.ret_fld_flg, input.ret_fld, input.grp_nam)]
|
   create cache time stamp 
     where obj_nam = "MCSVars"
        and idx_val = "LES"