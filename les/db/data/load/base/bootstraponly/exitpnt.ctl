[MERGE INTO exitpnt e 
      USING (SELECT '@exitpnt_typ@' exitpnt_typ, '@exitpnt@' exitpnt, '@tblnme@' tblnme
                    FROM dual) input 
         ON (e.exitpnt_typ = input.exitpnt_typ
             AND e.exitpnt = input.exitpnt)
 WHEN NOT MATCHED THEN
     INSERT (exitpnt_typ, exitpnt, tblnme) 
     VALUES (input.exitpnt_typ, input.exitpnt, input.tblnme)]
