[MERGE INTO les_var_inp l 
      USING (SELECT '@var_nam@' var_nam, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, '@locale_id@' locale_id, 
                    @cust_lvl@ cust_lvl, @ena_flg@ ena_flg, to_number('@min_lgth@') min_lgth, to_number('@max_lgth@') max_lgth, 
                    '@inp_mask@' inp_mask, @dsp_mask_flg@ dsp_mask_flg, @auto_mask_flg@ auto_mask_flg, @mult_line_flg@ mult_line_flg, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.var_nam = input.var_nam
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.addon_id = input.addon_id
             AND l.locale_id = input.locale_id
             AND l.cust_lvl = input.cust_lvl) 
 WHEN NOT MATCHED THEN
     INSERT (var_nam, appl_id, frm_id, addon_id, locale_id, cust_lvl, ena_flg, min_lgth, max_lgth, inp_mask, dsp_mask_flg, auto_mask_flg, 
             mult_line_flg, grp_nam) 
     VALUES (input.var_nam, input.appl_id, input.frm_id, input.addon_id, input.locale_id, input.cust_lvl, input.ena_flg, input.min_lgth, 
             input.max_lgth, input.inp_mask, input.dsp_mask_flg, input.auto_mask_flg, input.mult_line_flg, input.grp_nam)]
|
   create cache time stamp
     where obj_nam = "MCSVars"
       and idx_val = "LES"