[MERGE INTO profile_def p 
      USING (SELECT nvl('@appl_id@', 'LES') appl_id, '@frm_id@' frm_id, '@prf_cmd@' prf_cmd, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (p.appl_id = input.appl_id
             AND p.frm_id = input.frm_id)
 WHEN NOT MATCHED THEN
     INSERT (appl_id, frm_id, prf_cmd, grp_nam) 
     VALUES (input.appl_id, input.frm_id, input.prf_cmd, input.grp_nam)]
