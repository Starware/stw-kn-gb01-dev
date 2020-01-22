[MERGE INTO cap_def c 
      USING (SELECT '@cap_cod@' cap_cod, '@cap_tbl@' cap_tbl, '@cap_col@' cap_col, '@cap_typ@' cap_typ, '@cap_color@' cap_color, 
                    to_number('@cap_seq@') cap_seq
                    FROM dual) input 
         ON (c.cap_cod = input.cap_cod)
 WHEN NOT MATCHED THEN
     INSERT (cap_cod, cap_tbl, cap_col, cap_typ, cap_color, cap_seq) 
     VALUES (input.cap_cod, input.cap_tbl, input.cap_col, input.cap_typ, input.cap_color, input.cap_seq)]
