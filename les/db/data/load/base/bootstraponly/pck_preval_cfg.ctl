[MERGE INTO pck_preval_cfg p 
      USING (SELECT '@pck_preval_id@' pck_preval_id, '@info_cd@' info_cd, '@action_cd@' action_cd, @skip_limit@ skip_limit, 
                    '@cancod@' cancod
                    FROM dual) input 
         ON (p.pck_preval_id = input.pck_preval_id) 
 WHEN NOT MATCHED THEN
     INSERT (pck_preval_id, info_cd, action_cd, skip_limit, cancod) 
     VALUES (input.pck_preval_id, input.info_cd, input.action_cd, input.skip_limit, input.cancod)]
