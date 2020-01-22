[MERGE INTO grd_view_def g 
      USING (SELECT '@lvl_id@' lvl_id, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, '@grd_var_nam@' grd_var_nam, 
                    '@view_nam@' view_nam, '@usr_id@' usr_id, to_number('@sys_flg@') sys_flg, to_number('@grp_flg@') grp_flg, 
                    '@grp_ttl_formula@' grp_ttl_formula, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (g.lvl_id = input.lvl_id
             AND g.appl_id = input.appl_id
             AND g.frm_id = input.frm_id
             AND g.addon_id = input.addon_id
             AND g.grd_var_nam = input.grd_var_nam
             AND g.view_nam = input.view_nam
             AND g.usr_id = input.usr_id)
 WHEN NOT MATCHED THEN
     INSERT (lvl_id, appl_id, frm_id, addon_id, grd_var_nam, view_nam, usr_id, sys_flg, grp_flg, grp_ttl_formula, grp_nam) 
     VALUES (input.lvl_id, input.appl_id, input.frm_id, input.addon_id, input.grd_var_nam, input.view_nam, input.usr_id, input.sys_flg, 
             input.grp_flg, input.grp_ttl_formula, input.grp_nam)]
|
    create cache time stamp
      where obj_nam = "MCSGrdViewDef"
        and idx_val = "LES"