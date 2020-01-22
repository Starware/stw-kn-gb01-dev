[MERGE INTO wf_flw w 
      USING (SELECT '@appl_id@' appl_id, @cust_lvl@ cust_lvl, '@frm_id@' frm_id, '@nxt_frm_id@' nxt_frm_id, '@prv_frm_id@' prv_frm_id, 
                    '@home_frm_id@' home_frm_id, '@frm_id_cmd@' frm_id_cmd, @static_frm_flg@ static_frm_flg, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (w.appl_id = input.appl_id
             AND w.cust_lvl = input.cust_lvl
             AND w.frm_id = input.frm_id)
 WHEN NOT MATCHED THEN
     INSERT (appl_id, cust_lvl, frm_id, nxt_frm_id, prv_frm_id, home_frm_id, frm_id_cmd, static_frm_flg, grp_nam) 
     VALUES (input.appl_id, input.cust_lvl, input.frm_id, input.nxt_frm_id, input.prv_frm_id, input.home_frm_id, input.frm_id_cmd, 
             input.static_frm_flg, input.grp_nam)]
| 
   create cache time stamp 
     where obj_nam = "MCSWorkFlow"
       and idx_val = "LES"