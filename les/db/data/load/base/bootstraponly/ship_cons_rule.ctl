[MERGE INTO ship_cons_rule s 
      USING (SELECT '@wh_id@' wh_id, @srtseq@ srtseq, '@existing_ship_cmd@' existing_ship_cmd
                    FROM dual) input 
         ON (s.wh_id = input.wh_id
             AND s.srtseq = input.srtseq) 
 WHEN NOT MATCHED THEN
     INSERT (wh_id, srtseq, existing_ship_cmd) 
     VALUES (input.wh_id, input.srtseq, input.existing_ship_cmd)]
