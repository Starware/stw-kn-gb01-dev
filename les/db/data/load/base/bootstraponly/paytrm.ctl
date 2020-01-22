[MERGE INTO paytrm p 
      USING (SELECT '@dstnam@' dstnam, '@paycod@' paycod, '@payval@' payval, to_number('@codflg@') codflg, 
                    to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id
                    FROM dual) input 
         ON (p.dstnam = input.dstnam
             AND p.paycod = input.paycod) 
 WHEN NOT MATCHED THEN
     INSERT (dstnam, paycod, payval, codflg, moddte, mod_usr_id) 
     VALUES (input.dstnam, input.paycod, input.payval, input.codflg, input.moddte, input.mod_usr_id)]
