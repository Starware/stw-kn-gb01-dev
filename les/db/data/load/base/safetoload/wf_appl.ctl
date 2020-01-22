[MERGE INTO wf_appl w 
      USING (SELECT '@appl_id@' appl_id, @cust_lvl@ cust_lvl, '@descr_id@' descr_id, '@start_frm_id@' start_frm_id, '@prod_id@' prod_id, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (w.appl_id = input.appl_id
             AND w.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (appl_id, cust_lvl, descr_id, start_frm_id, prod_id, grp_nam) 
     VALUES (input.appl_id, input.cust_lvl, input.descr_id, input.start_frm_id, input.prod_id, input.grp_nam)]
|
   create cache time stamp 
     where obj_nam = "MCSWorkFlow"
       and idx_val = "LES"