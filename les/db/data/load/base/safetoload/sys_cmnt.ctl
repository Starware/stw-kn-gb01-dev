[MERGE INTO sys_cmnt s 
      USING (SELECT '@sys_obj_typ@' sys_obj_typ, '@sys_obj_id@' sys_obj_id, @cust_lvl@ cust_lvl, '@cmnt@' cmnt, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (s.sys_obj_typ = input.sys_obj_typ
             AND s.sys_obj_id = input.sys_obj_id
             AND s.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (sys_obj_typ, sys_obj_id, cust_lvl, cmnt, grp_nam) 
     VALUES (input.sys_obj_typ, input.sys_obj_id, input.cust_lvl, input.cmnt, input.grp_nam)]