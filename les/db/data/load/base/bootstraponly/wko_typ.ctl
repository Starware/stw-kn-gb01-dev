[MERGE INTO wko_typ w 
      USING (SELECT '@wh_id@' wh_id, '@wko_typ@' wko_typ, to_number('@disass_flg@') disass_flg, '@prcare@' prcare, '@prdlin@' prdlin
                    FROM dual) input 
         ON (w.wh_id = input.wh_id
             AND w.wko_typ = input.wko_typ)
 WHEN NOT MATCHED THEN
     INSERT (wh_id, wko_typ, disass_flg, prcare, prdlin) 
     VALUES (input.wh_id, input.wko_typ, input.disass_flg, input.prcare, input.prdlin)]
