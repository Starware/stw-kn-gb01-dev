[MERGE INTO doc_typ_arg d 
      USING (SELECT '@doc_typ@' doc_typ, '@doc_typ_arg@' doc_typ_arg, to_number('@rqdflg@') rqdflg, 
                    to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (d.doc_typ = input.doc_typ
             AND d.doc_typ_arg = input.doc_typ_arg)
 WHEN NOT MATCHED THEN
     INSERT (doc_typ, doc_typ_arg, rqdflg, moddte, mod_usr_id) 
     VALUES (input.doc_typ, input.doc_typ_arg, input.rqdflg, input.moddte, input.mod_usr_id)]
