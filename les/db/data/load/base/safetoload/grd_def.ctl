[MERGE INTO grd_def g 
      USING (SELECT '@lvl_id@' lvl_id, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, @cust_lvl@ cust_lvl, 
                    '@parent_lvl_id@' parent_lvl_id, '@grd_var_nam@' grd_var_nam, '@grd_cmd@' grd_cmd, '@grd_init_qual@' grd_init_qual, 
                    '@par_col@' par_col, '@child_col@' child_col, @enable_flg@ enable_flg, to_number(nvl('@ext_parm_flg@', '1')) ext_parm_flg, 
                    '@grd_mnu_nam@' grd_mnu_nam, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (g.lvl_id = input.lvl_id
             AND g.appl_id = input.appl_id
             AND g.frm_id = input.frm_id
             AND g.addon_id = input.addon_id
             AND g.cust_lvl = input.cust_lvl
             AND g.parent_lvl_id = input.parent_lvl_id
             AND g.grd_var_nam = input.grd_var_nam) 
 WHEN NOT MATCHED THEN
     INSERT (lvl_id, appl_id, frm_id, addon_id, cust_lvl, parent_lvl_id, grd_var_nam, grd_cmd, grd_init_qual, par_col, child_col, 
             enable_flg, ext_parm_flg, grd_mnu_nam, grp_nam) 
     VALUES (input.lvl_id, input.appl_id, input.frm_id, input.addon_id, input.cust_lvl, input.parent_lvl_id, input.grd_var_nam, 
             input.grd_cmd, input.grd_init_qual, input.par_col, input.child_col, input.enable_flg, input.ext_parm_flg, input.grd_mnu_nam, 
             input.grp_nam)]
|
    create cache time stamp
      where obj_nam = "MCSGrdDef"
        and idx_val = "LES"