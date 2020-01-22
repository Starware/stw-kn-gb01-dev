[MERGE INTO doc_rule d 
      USING (SELECT '@doc_typ@' doc_typ, @seqnum@ seqnum, '@docfmt@' docfmt, @docqty@ docqty, '@exitpnt@' exitpnt, '@devsrc@' devsrc, 
                    '@docgrp@' docgrp, '@locale_typ@' locale_typ, '@locale_id@' locale_id, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, 
                    '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (d.doc_typ = input.doc_typ
             AND d.seqnum = input.seqnum) 
 WHEN NOT MATCHED THEN
     INSERT (doc_typ, seqnum, docfmt, docqty, exitpnt, devsrc, docgrp, locale_typ, locale_id, moddte, mod_usr_id) 
     VALUES (input.doc_typ, input.seqnum, input.docfmt, input.docqty, input.exitpnt, input.devsrc, input.docgrp, input.locale_typ, 
             input.locale_id, input.moddte, input.mod_usr_id)]
