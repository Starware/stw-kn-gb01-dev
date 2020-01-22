[MERGE INTO les_var_def l 
      USING (SELECT '@var_nam@' var_nam, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, @cust_lvl@ cust_lvl, 
                    @ena_flg@ ena_flg, @const_flg@ const_flg, '@def_typ@' def_typ, '@char_val@' char_val, to_number('@int_val@') int_val, 
                    to_number('@flt_val@') flt_val, to_date('@dt_val@','YYYYMMDDHH24MISS') dt_val, '@def_cmd@' def_cmd, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.var_nam = input.var_nam
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.addon_id = input.addon_id
             AND l.cust_lvl = input.cust_lvl) 
 WHEN NOT MATCHED THEN
     INSERT (var_nam, appl_id, frm_id, addon_id, cust_lvl, ena_flg, const_flg, def_typ, char_val, int_val, flt_val, dt_val, def_cmd, 
             grp_nam) 
     VALUES (input.var_nam, input.appl_id, input.frm_id, input.addon_id, input.cust_lvl, input.ena_flg, input.const_flg, input.def_typ, 
             input.char_val, input.int_val, input.flt_val, input.dt_val, input.def_cmd, input.grp_nam)]
| 

   create cache time stamp
      where obj_nam = "MCSVars"
        and idx_val = "LES"