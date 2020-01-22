[MERGE INTO les_var_lkp l 
      USING (SELECT '@var_nam@' var_nam, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, @srt_seq@ srt_seq, 
                    @cust_lvl@ cust_lvl, '@lkp_id@' lkp_id, @ena_flg@ ena_flg, '@ret_fld@' ret_fld, '@inp_fld@' inp_fld, 
                    @mult_flg@ mult_flg, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.var_nam = input.var_nam
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.addon_id = input.addon_id
             AND l.cust_lvl = input.cust_lvl
             AND l.lkp_id = input.lkp_id)
 WHEN NOT MATCHED THEN
     INSERT (var_nam, appl_id, frm_id, addon_id, srt_seq, cust_lvl, lkp_id, ena_flg, ret_fld, inp_fld, mult_flg, grp_nam) 
     VALUES (input.var_nam, input.appl_id, input.frm_id, input.addon_id, input.srt_seq, input.cust_lvl, input.lkp_id, input.ena_flg, 
             input.ret_fld, input.inp_fld, input.mult_flg, input.grp_nam)]

|
   create cache time stamp 
      where obj_nam = "MCSVars"
       and idx_val = "LES"