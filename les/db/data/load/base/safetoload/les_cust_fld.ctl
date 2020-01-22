[MERGE INTO les_cust_fld l
      USING (SELECT '@var_nam@' var_nam, '@frm_id@' frm_id, @ena_flg@ ena_flg, '@ctrl_typ@' ctrl_typ, '@ctrl_tag@' ctrl_tag,
                    '@par_ctrl@' par_ctrl, to_number('@par_ctrl_idx@') par_ctrl_idx, to_number('@tab_idx@') tab_idx,
                    to_number('@ctrl_wid@') ctrl_wid, to_number('@ctrl_hgt@') ctrl_hgt, '@own_table@' own_table, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (l.var_nam = input.var_nam
             AND l.frm_id = input.frm_id)
 WHEN NOT MATCHED THEN
     INSERT (var_nam, frm_id, ena_flg, ctrl_typ, ctrl_tag, par_ctrl, par_ctrl_idx, tab_idx, ctrl_wid, ctrl_hgt, own_table, grp_nam)
     VALUES (input.var_nam, input.frm_id, input.ena_flg, input.ctrl_typ, input.ctrl_tag, input.par_ctrl, input.par_ctrl_idx, input.tab_idx,
             input.ctrl_wid, input.ctrl_hgt, input.own_table, input.grp_nam)]
|
create cache time stamp
 where obj_nam = "MCSCustFld"
   and idx_val = "LES"