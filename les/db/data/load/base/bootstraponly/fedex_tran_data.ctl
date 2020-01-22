[MERGE INTO fedex_tran_data f 
      USING (SELECT '@srvnam@' srvnam, '@tran_id@' tran_id, @fld_pos@ fld_pos, '@parnam@' parnam, '@parfmt@' parfmt, to_number('@fld_len@') fld_len, 
                    to_number('@fld_typ@') fld_typ
                    FROM dual) input 
         ON (f.srvnam = input.srvnam
             AND f.tran_id = input.tran_id
             AND f.fld_pos = input.fld_pos)
 WHEN NOT MATCHED THEN
     INSERT (srvnam, tran_id, fld_pos, parnam, parfmt, fld_len, fld_typ) 
     VALUES (input.srvnam, input.tran_id, input.fld_pos, input.parnam, input.parfmt, input.fld_len, input.fld_typ)]
