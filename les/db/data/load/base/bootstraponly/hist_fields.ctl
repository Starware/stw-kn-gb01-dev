[MERGE INTO hist_fields h 
      USING (SELECT '@tblname@' tblname, '@fieldname@' fieldname, '@comtyp@' comtyp
                    FROM dual) input 
         ON (h.tblname = input.tblname
             AND h.fieldname = input.fieldname)
 WHEN NOT MATCHED THEN
     INSERT (tblname, fieldname, comtyp) 
     VALUES (input.tblname, input.fieldname, input.comtyp)]
