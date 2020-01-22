[MERGE INTO doc_lblfmt d 
      USING (SELECT '@doc_typ@' doc_typ, '@lblfmt@' lblfmt
                    FROM dual) input 
         ON (d.doc_typ = input.doc_typ
             AND d.lblfmt = input.lblfmt) 
 WHEN NOT MATCHED THEN
     INSERT (doc_typ, lblfmt) 
     VALUES (input.doc_typ, input.lblfmt)]
