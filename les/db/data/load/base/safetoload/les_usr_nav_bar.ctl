[MERGE INTO les_usr_nav_bar l
      USING (SELECT '@usr_id@' usr_id, '@nav_bar_id@' nav_bar_id, @nav_bar_seq@ nav_bar_seq, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (l.usr_id = input.usr_id
             AND l.nav_bar_id = input.nav_bar_id)
 WHEN NOT MATCHED THEN
     INSERT (usr_id, nav_bar_id, nav_bar_seq, grp_nam)
     VALUES (input.usr_id, input.nav_bar_id, input.nav_bar_seq, input.grp_nam)]
