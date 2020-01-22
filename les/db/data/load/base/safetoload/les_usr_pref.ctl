[MERGE INTO les_usr_pref l
      USING (SELECT '@usr_id@' usr_id, '@pref_id@' pref_id, '@pref_val@' pref_val, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (l.usr_id = input.usr_id
             AND l.pref_id = input.pref_id)
 WHEN NOT MATCHED THEN
     INSERT (usr_id, pref_id, pref_val, grp_nam)
     VALUES (input.usr_id, input.pref_id, input.pref_val, input.grp_nam)]
