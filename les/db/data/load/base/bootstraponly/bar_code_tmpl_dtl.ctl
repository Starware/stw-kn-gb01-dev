[MERGE INTO bar_code_tmpl_dtl b 
      USING (SELECT '@bar_code_tmpl_id@' bar_code_tmpl_id, '@bar_code_appl_id@' bar_code_appl_id, '@map_fld@' map_fld, 
                    @map_fld_len@ map_fld_len, '@dat_fmt@' dat_fmt, to_number('@frac_digits@') frac_digits
                    FROM dual) input 
         ON (b.bar_code_tmpl_id = input.bar_code_tmpl_id
             AND b.bar_code_appl_id = input.bar_code_appl_id)
 WHEN NOT MATCHED THEN
     INSERT (bar_code_tmpl_id, bar_code_appl_id, map_fld, map_fld_len, dat_fmt, frac_digits) 
     VALUES (input.bar_code_tmpl_id, input.bar_code_appl_id, input.map_fld, input.map_fld_len, input.dat_fmt, input.frac_digits)]
