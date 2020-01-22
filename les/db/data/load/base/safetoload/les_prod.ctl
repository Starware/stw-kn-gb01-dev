[MERGE INTO les_prod l
      USING (SELECT '@prod_id@' prod_id, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (l.prod_id = input.prod_id)
 WHEN NOT MATCHED THEN
     INSERT (prod_id, grp_nam)
     VALUES (input.prod_id, input.grp_nam)]