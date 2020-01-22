[MERGE INTO doc_typ d 
      USING (SELECT '@doc_typ@' doc_typ, '@doc_typ_cod@' doc_typ_cod, '@lvl_colnam@' lvl_colnam, '@data_cmd@' data_cmd, 
                    '@break_lvl@' break_lvl, to_number('@bill_flg@') bill_flg, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, 
                    '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (d.doc_typ = input.doc_typ) 
 WHEN NOT MATCHED THEN
     INSERT (doc_typ, doc_typ_cod, lvl_colnam, data_cmd, break_lvl, bill_flg, moddte, mod_usr_id) 
     VALUES (input.doc_typ, input.doc_typ_cod, input.lvl_colnam, input.data_cmd, input.break_lvl, input.bill_flg, input.moddte, 
             input.mod_usr_id)]
