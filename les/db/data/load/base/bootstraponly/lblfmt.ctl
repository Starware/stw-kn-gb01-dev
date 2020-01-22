[MERGE INTO lblfmt l 
      USING (SELECT '@lblfmt@' lblfmt, '@def_printer@' def_printer, to_number('@rfid_flg@') rfid_flg, 
                    to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (l.lblfmt = input.lblfmt) 
 WHEN NOT MATCHED THEN
     INSERT (lblfmt, def_printer, rfid_flg, moddte, mod_usr_id) 
     VALUES (input.lblfmt, input.def_printer, input.rfid_flg, input.moddte, input.mod_usr_id)]
