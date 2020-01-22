[MERGE INTO profile_def_flds p 
      USING (SELECT nvl('@appl_id@', 'LES') appl_id, '@frm_id@' frm_id, to_number('@fld_rqd_flg@') fld_rqd_flg, '@var_nam@' var_nam, 
                    to_number('@srtseq@') srtseq, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (p.appl_id = input.appl_id
             AND p.frm_id = input.frm_id
             AND p.var_nam = input.var_nam)
 WHEN NOT MATCHED THEN
     INSERT (appl_id, frm_id, fld_rqd_flg, var_nam, srtseq, grp_nam) 
     VALUES (input.appl_id, input.frm_id, input.fld_rqd_flg, input.var_nam, input.srtseq, input.grp_nam)]
