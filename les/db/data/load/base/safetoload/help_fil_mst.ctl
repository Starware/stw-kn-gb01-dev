[MERGE INTO help_fil_mst h
      USING (SELECT '@help_fil_id@' help_fil_id, '@locale_id@' locale_id, '@help_fil@' help_fil, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (h.help_fil_id = input.help_fil_id
             AND h.locale_id = input.locale_id)
 WHEN NOT MATCHED THEN
     INSERT (help_fil_id, locale_id, help_fil, grp_nam)
     VALUES (input.help_fil_id, input.locale_id, input.help_fil, input.grp_nam)]
