[MERGE INTO les_lkp l 
      USING (SELECT '@lkp_id@' lkp_id, @cust_lvl@ cust_lvl, '@lkp_cmd@' lkp_cmd, to_number(nvl('@static_cmd_flg@', '0')) static_cmd_flg, '@lkp_comp@' lkp_comp, 
                    '@ret_fld@' ret_fld, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.lkp_id = input.lkp_id
             AND l.cust_lvl = input.cust_lvl) 
 WHEN NOT MATCHED THEN
     INSERT (lkp_id, cust_lvl, lkp_cmd, static_cmd_flg, lkp_comp, ret_fld, grp_nam) 
     VALUES (input.lkp_id, input.cust_lvl, input.lkp_cmd, input.static_cmd_flg, input.lkp_comp, input.ret_fld, input.grp_nam)]
|

   create cache time stamp 
    where obj_nam = "MCSLookups" 
      and idx_val = "LES"