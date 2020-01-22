[MERGE INTO codmst c 
      USING (SELECT '@colnam@' colnam, '@codval@' codval, @srtseq@ srtseq, to_number('@rqdflg@') rqdflg, '@img_id@' img_id, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (c.colnam = input.colnam
             AND c.codval = input.codval) 
 WHEN NOT MATCHED THEN
     INSERT (colnam, codval, srtseq, rqdflg, img_id, grp_nam) 
     VALUES (input.colnam, input.codval, input.srtseq, input.rqdflg, input.img_id, input.grp_nam)]
;
create cache time stamp 
    where obj_nam = "codmst"
      and idx_val = "LES"