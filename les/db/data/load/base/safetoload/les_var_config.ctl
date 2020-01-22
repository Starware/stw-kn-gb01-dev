[MERGE INTO les_var_config l 
      USING (SELECT '@var_nam@' var_nam, '@appl_id@' appl_id, '@frm_id@' frm_id, '@addon_id@' addon_id, @cust_lvl@ cust_lvl, 
                    @vis_flg@ vis_flg, @ena_flg@ ena_flg, '@fld_typ@' fld_typ, '@ctrl_typ@' ctrl_typ, @ctxt_flg@ ctxt_flg, 
                    to_number('@dsp_wid@') dsp_wid, to_number('@dsp_hgt@') dsp_hgt, '@ctrl_prop@' ctrl_prop, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.var_nam = input.var_nam
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.addon_id = input.addon_id
             AND l.cust_lvl = input.cust_lvl) 
 WHEN NOT MATCHED THEN
     INSERT (var_nam, appl_id, frm_id, addon_id, cust_lvl, vis_flg, ena_flg, fld_typ, ctrl_typ, ctxt_flg, dsp_wid, dsp_hgt, ctrl_prop, 
             grp_nam) 
     VALUES (input.var_nam, input.appl_id, input.frm_id, input.addon_id, input.cust_lvl, input.vis_flg, input.ena_flg, input.fld_typ, 
             input.ctrl_typ, input.ctxt_flg, input.dsp_wid, input.dsp_hgt, input.ctrl_prop, input.grp_nam)]
|
    create cache time stamp
      where obj_nam = "MCSVars"
        and idx_val = "LES"