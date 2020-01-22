[MERGE INTO wh_basepoint w 
      USING (SELECT '@wh_id@' wh_id, '@basepoint_id@' basepoint_id, @latitude@ latitude, @longitude@ longitude
                    FROM dual) input 
         ON (w.wh_id = input.wh_id
             AND w.basepoint_id = input.basepoint_id)
 WHEN NOT MATCHED THEN
     INSERT (wh_id, basepoint_id, latitude, longitude) 
     VALUES (input.wh_id, input.basepoint_id, input.latitude, input.longitude)]
