[MERGE INTO usr_lc_manfst m
      USING (SELECT '@wh_id@' wh_id, '@traknm@' traknm, '@mfsmsn@' mfsmsn
                    FROM dual) input 
         ON (m.wh_id = input.wh_id
             AND m.traknm = input.traknm)
 WHEN NOT MATCHED THEN
     INSERT (wh_id, traknm, mfsmsn)
     VALUES (input.wh_id, input.traknm, input.mfsmsn)]
;
