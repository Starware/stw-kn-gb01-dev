[MERGE INTO sys_dsc_mst s 
      USING (SELECT '@colnam@' colnam, '@colval@' colval, '@locale_id@' locale_id, @cust_lvl@ cust_lvl, '@mls_text@' mls_text, 
                    '@short_dsc@' short_dsc, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (s.colnam = input.colnam
             AND s.colval = input.colval
             AND s.locale_id = input.locale_id
             AND s.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (colnam, colval, locale_id, cust_lvl, mls_text, short_dsc, grp_nam) 
     VALUES (input.colnam, input.colval, input.locale_id, input.cust_lvl, input.mls_text, input.short_dsc, input.grp_nam)]
