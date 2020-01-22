[MERGE INTO file_typ f 
      USING (SELECT '@file_typ@' file_typ, '@file_cat@' file_cat, sysdate ins_dt, sysdate last_upd_dt
                    FROM dual) input 
         ON (f.file_typ = input.file_typ)
 WHEN NOT MATCHED THEN
     INSERT (file_typ, file_cat, ins_dt) 
     VALUES (input.file_typ, input.file_cat, input.ins_dt)]
