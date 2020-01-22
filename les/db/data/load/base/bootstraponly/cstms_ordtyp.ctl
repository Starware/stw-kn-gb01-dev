[MERGE INTO cstms_ordtyp c 
      USING (SELECT '@cstms_ordtyp@' cstms_ordtyp, '@wh_id@' wh_id, to_number('@allow_mix_flg@') allow_mix_flg
                    FROM dual) input 
         ON (c.cstms_ordtyp = input.cstms_ordtyp
             AND c.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (cstms_ordtyp, wh_id, allow_mix_flg) 
     VALUES (input.cstms_ordtyp, input.wh_id, input.allow_mix_flg)]
