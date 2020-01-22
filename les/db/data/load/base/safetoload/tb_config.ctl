[MERGE INTO tb_config t 
      USING (SELECT '@appl_id@' appl_id, '@frm_id@' frm_id, '@btn_key@' btn_key, nvl('@par_btn_key@' ,'----') par_btn_key, @cust_lvl@ cust_lvl, 
                    @btn_posn@ btn_posn, @btn_ena_flg@ btn_ena_flg, @btn_vis_flg@ btn_vis_flg, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (t.appl_id = input.appl_id
             AND t.frm_id = input.frm_id
             AND t.btn_key = input.btn_key
             AND t.par_btn_key = input.par_btn_key
             AND t.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (appl_id, frm_id, btn_key, par_btn_key, cust_lvl, btn_posn, btn_ena_flg, btn_vis_flg, grp_nam) 
     VALUES (input.appl_id, input.frm_id, input.btn_key, input.par_btn_key, input.cust_lvl, input.btn_posn, input.btn_ena_flg, 
             input.btn_vis_flg, input.grp_nam)]

|
create cache time stamp
 where obj_nam = "ButtonBar"
   and idx_val = 'LES'
|
   create cache time stamp 
     where obj_nam = "MCSToolbar"
       and idx_val = "LES"