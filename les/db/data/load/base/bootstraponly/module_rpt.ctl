[MERGE INTO module_rpt m 
      USING (SELECT @module_rpt_id@ module_rpt_id, '@module@' module, '@rpt_id@' rpt_id, '@lblfmt@' lblfmt
                    FROM dual) input 
         ON (m.module_rpt_id = input.module_rpt_id)
 WHEN NOT MATCHED THEN
     INSERT (module_rpt_id, module, rpt_id, lblfmt) 
     VALUES (input.module_rpt_id, input.module, input.rpt_id, input.lblfmt)]
