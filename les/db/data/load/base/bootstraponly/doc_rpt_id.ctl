[MERGE INTO doc_rpt_id d 
      USING (SELECT '@doc_typ@' doc_typ, '@rpt_id@' rpt_id
                    FROM dual) input 
         ON (d.doc_typ = input.doc_typ
             AND d.rpt_id = input.rpt_id) 
 WHEN NOT MATCHED THEN
     INSERT (doc_typ, rpt_id) 
     VALUES (input.doc_typ, input.rpt_id)]
