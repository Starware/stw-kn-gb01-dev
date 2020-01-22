[MERGE INTO profile_mst p 
      USING (SELECT nvl('@appl_id@', 'LES') appl_id, '@frm_id@' frm_id, '@prf_nam@' prf_nam, to_number('@dis_edit_flg@') dis_edit_flg, 
                    to_number('@prf_default@') prf_default, '@default_criteria@' default_criteria, '@opt_nam@' opt_nam, '@usr_id@' usr_id, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (p.appl_id = input.appl_id
             AND p.frm_id = input.frm_id
             AND p.prf_nam = input.prf_nam)
 WHEN NOT MATCHED THEN
     INSERT (appl_id, frm_id, prf_nam, dis_edit_flg, prf_default, default_criteria, opt_nam, usr_id, grp_nam) 
     VALUES (input.appl_id, input.frm_id, input.prf_nam, input.dis_edit_flg, input.prf_default, input.default_criteria, input.opt_nam, 
             input.usr_id, input.grp_nam)]
