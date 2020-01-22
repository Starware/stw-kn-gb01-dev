[MERGE INTO grd_view_detail g 
      USING (SELECT '@lvl_id@' lvl_id, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, '@grd_var_nam@' grd_var_nam, 
                    '@view_nam@' view_nam, '@usr_id@' usr_id, '@view_type@' view_type, '@view_fld_nam@' view_fld_nam, 
                    to_number('@view_fld_width@') view_fld_width, to_number('@view_fld_seq@') view_fld_seq, 
                    to_number('@view_fld_vis@') view_fld_vis, to_number('@view_fld_sort_ord@') view_fld_sort_ord, 
                    @view_fld_sort_typ@ view_fld_sort_typ, to_number('@view_grp_ord@') view_grp_ord, 
                    '@view_formula@' view_formula, '@fixed_style@' fixed_style, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (g.lvl_id = input.lvl_id
             AND g.appl_id = input.appl_id
             AND g.frm_id = input.frm_id
             AND g.addon_id = input.addon_id
             AND g.grd_var_nam = input.grd_var_nam
             AND g.view_nam = input.view_nam
             AND g.usr_id = input.usr_id
             AND g.view_type = input.view_type
             AND g.view_fld_nam = input.view_fld_nam)
 WHEN NOT MATCHED THEN
     INSERT (lvl_id, appl_id, frm_id, addon_id, grd_var_nam, view_nam, usr_id, view_type, view_fld_nam, view_fld_width, view_fld_seq, 
             view_fld_vis, view_fld_sort_ord, view_fld_sort_typ, view_grp_ord, view_formula, fixed_style, grp_nam) 
     VALUES (input.lvl_id, input.appl_id, input.frm_id, input.addon_id, input.grd_var_nam, input.view_nam, input.usr_id, input.view_type, 
             input.view_fld_nam, input.view_fld_width, input.view_fld_seq, input.view_fld_vis, input.view_fld_sort_ord, 
             input.view_fld_sort_typ, input.view_grp_ord, input.view_formula, input.fixed_style, input.grp_nam)]
|
    create cache time stamp
      where obj_nam = "MCSGrdViewDetails"
        and idx_val = "LES"