[MERGE INTO dda_field_map d 
      USING (SELECT '@dda_id@' dda_id, @cust_lvl@ cust_lvl, '@var_nam@' var_nam, '@link_var_nam@' link_var_nam, 
                    '@map_var_nam@' map_var_nam, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (d.dda_id = input.dda_id
             AND d.cust_lvl = input.cust_lvl
             AND d.var_nam = input.var_nam
             AND d.link_var_nam = input.link_var_nam)
 WHEN NOT MATCHED THEN
     INSERT (dda_id, cust_lvl, var_nam, link_var_nam, map_var_nam, grp_nam) 
     VALUES (input.dda_id, input.cust_lvl, input.var_nam, input.link_var_nam, input.map_var_nam, input.grp_nam)]
;
create cache time stamp
 where obj_nam = "DDAFields"
   and idx_val = "LES"