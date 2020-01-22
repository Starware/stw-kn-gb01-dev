[MERGE INTO carmtx_dtl c 
      USING (SELECT @carmtx_id@ carmtx_id, '@colnam@' colnam, '@colval@' colval
                    FROM dual) input 
         ON (c.carmtx_id = input.carmtx_id
             AND c.colnam = input.colnam)
 WHEN NOT MATCHED THEN
     INSERT (carmtx_id, colnam, colval) 
     VALUES (input.carmtx_id, input.colnam, input.colval)]
