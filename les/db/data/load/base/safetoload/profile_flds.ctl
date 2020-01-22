[MERGE INTO profile_flds p 
      USING (SELECT nvl('@appl_id@', 'LES') appl_id, '@frm_id@' frm_id, '@prf_nam@' prf_nam, '@var_nam@' var_nam, to_number('@srtseq@') srtseq, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (p.appl_id = input.appl_id
             AND p.frm_id = input.frm_id
             AND p.prf_nam = input.prf_nam
             AND p.var_nam = input.var_nam)
 WHEN NOT MATCHED THEN
     INSERT (appl_id, frm_id, prf_nam, var_nam, srtseq, grp_nam) 
     VALUES (input.appl_id, input.frm_id, input.prf_nam, input.var_nam, input.srtseq, input.grp_nam)]
