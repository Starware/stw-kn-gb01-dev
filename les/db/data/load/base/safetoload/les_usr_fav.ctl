[MERGE INTO les_usr_fav l 
      USING (SELECT '@usr_id@' usr_id, '@opt_nam@' opt_nam, @mnu_seq@ mnu_seq, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.usr_id = input.usr_id
             AND l.opt_nam = input.opt_nam) 
 WHEN NOT MATCHED THEN
     INSERT (usr_id, opt_nam, mnu_seq, grp_nam) 
     VALUES (input.usr_id, input.opt_nam, input.mnu_seq, input.grp_nam)]
