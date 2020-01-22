[MERGE INTO les_var_vp l 
      USING (SELECT '@var_nam@' var_nam, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, @cust_lvl@ cust_lvl, 
                    '@lkp_id@' lkp_id, @ena_flg@ ena_flg, '@cod_col@' cod_col, '@desc_col@' desc_col, 
                    to_number('@add_null_flg@') add_null_flg, to_number('@dis_sgl_flg@') dis_sgl_flg, to_number('@edt_flg@') edt_flg, 
                    '@srt_col@' srt_col, '@grd_lkp_cols@' grd_lkp_cols, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.var_nam = input.var_nam
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.addon_id = input.addon_id
             AND l.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (var_nam, appl_id, frm_id, addon_id, cust_lvl, lkp_id, ena_flg, cod_col, desc_col, add_null_flg, dis_sgl_flg, edt_flg, srt_col, 
             grd_lkp_cols, grp_nam) 
     VALUES (input.var_nam, input.appl_id, input.frm_id, input.addon_id, input.cust_lvl, input.lkp_id, input.ena_flg, input.cod_col, 
             input.desc_col, input.add_null_flg, input.dis_sgl_flg, input.edt_flg, input.srt_col, input.grd_lkp_cols, input.grp_nam)]
|
   create cache time stamp 
     where obj_nam = "MCSVars"
       and idx_val = "LES"