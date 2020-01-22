[MERGE INTO prop_frm p 
      USING (SELECT '@frm_id@' frm_id, '@var_nam@' var_nam, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (p.frm_id = input.frm_id
             AND p.var_nam = input.var_nam)
 WHEN NOT MATCHED THEN
     INSERT (frm_id, var_nam, grp_nam) 
     VALUES (input.frm_id, input.var_nam, input.grp_nam)]
