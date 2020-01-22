[MERGE INTO rule_parm r 
      USING (SELECT '@rule_nam@' rule_nam, '@parm_id@' parm_id, '@parm_typ@' parm_typ
                    FROM dual) input 
         ON (r.rule_nam = input.rule_nam
             AND r.parm_id = input.parm_id) 
 WHEN NOT MATCHED THEN
     INSERT (rule_nam, parm_id, parm_typ) 
     VALUES (input.rule_nam, input.parm_id, input.parm_typ)]
