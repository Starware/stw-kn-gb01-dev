[MERGE INTO wf_frm w 
      USING (SELECT '@frm_id@' frm_id, @cust_lvl@ cust_lvl, '@descr_id@' descr_id, '@frm_progid@' frm_progid, '@dda_id@' dda_id, 
                    '@tb_config_frm_id@' tb_config_frm_id, nvl('@frm_cache_flg@', 0) frm_cache_flg, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (w.frm_id = input.frm_id
             AND w.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (frm_id, cust_lvl, descr_id, frm_progid, dda_id, tb_config_frm_id, frm_cache_flg, grp_nam) 
     VALUES (input.frm_id, input.cust_lvl, input.descr_id, input.frm_progid, input.dda_id, input.tb_config_frm_id, input.frm_cache_flg, 
             input.grp_nam)]
|
create cache time stamp
 where obj_nam = "MCSForm"
   and idx_val = 'LES'
|
   create cache time stamp 
     where obj_nam = "MCSWorkFlow" 
       and idx_val = 'LES'