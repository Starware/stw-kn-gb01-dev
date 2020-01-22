[MERGE INTO les_cmd l 
      USING (SELECT '@les_cmd_id@' les_cmd_id, @cust_lvl@ cust_lvl, '@syntax@' syntax, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, 
                    '@mod_usr_id@' mod_usr_id, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.les_cmd_id = input.les_cmd_id
             AND l.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (les_cmd_id, cust_lvl, syntax, moddte, mod_usr_id, grp_nam) 
     VALUES (input.les_cmd_id, input.cust_lvl, input.syntax, input.moddte, input.mod_usr_id, input.grp_nam)]
|
create cache time stamp
 where obj_nam = "MCSCmds"
   and idx_val = "LES"