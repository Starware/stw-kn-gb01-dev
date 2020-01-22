[MERGE INTO les_refs_opt l 
      USING (SELECT '@opt_nam@' opt_nam, '@opt_typ@' opt_typ, @pmsn_mask@ pmsn_mask, to_number('@ena_flg@') ena_flg, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.opt_nam = input.opt_nam) 
 WHEN NOT MATCHED THEN
     INSERT (opt_nam, opt_typ, pmsn_mask, ena_flg, grp_nam) 
     VALUES (input.opt_nam, input.opt_typ, input.pmsn_mask, input.ena_flg, input.grp_nam)]
