[MERGE INTO tim_zon_mapping t 
      USING (SELECT '@java_id@' java_id, '@win32_id@' win32_id, to_number('@ena_flg@') ena_flg
                    FROM dual) input 
         ON (t.java_id = input.java_id)
 WHEN NOT MATCHED THEN
     INSERT (java_id, win32_id, ena_flg) 
     VALUES (input.java_id, input.win32_id, input.ena_flg)]
