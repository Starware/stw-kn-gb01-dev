[MERGE INTO doc_rule_fld d 
      USING (SELECT '@doc_typ@' doc_typ, @seqnum@ seqnum, '@colnam@' colnam, '@colval@' colval, '@colopr@' colopr, 
                    to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (d.doc_typ = input.doc_typ
             AND d.seqnum = input.seqnum
             AND d.colnam = input.colnam)
 WHEN NOT MATCHED THEN
     INSERT (doc_typ, seqnum, colnam, colval, colopr, moddte, mod_usr_id) 
     VALUES (input.doc_typ, input.seqnum, input.colnam, input.colval, input.colopr, input.moddte, input.mod_usr_id)]
