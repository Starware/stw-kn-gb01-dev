[MERGE INTO les_mls_cat l 
      USING (SELECT '@mls_id@' mls_id, '@locale_id@' locale_id, '@prod_id@' prod_id, '@appl_id@' appl_id, '@frm_id@' frm_id, 
                    '@vartn@' vartn, @srt_seq@ srt_seq, @cust_lvl@ cust_lvl, '@mls_text@' mls_text, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.mls_id = input.mls_id
             AND l.locale_id = input.locale_id
             AND l.prod_id = input.prod_id
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.vartn = input.vartn
             AND l.srt_seq = input.srt_seq
             AND l.cust_lvl = input.cust_lvl) 
 WHEN NOT MATCHED THEN
     INSERT (mls_id, locale_id, prod_id, appl_id, frm_id, vartn, srt_seq, cust_lvl, mls_text, grp_nam) 
     VALUES (input.mls_id, input.locale_id, input.prod_id, input.appl_id, input.frm_id, input.vartn, input.srt_seq, input.cust_lvl, 
             input.mls_text, input.grp_nam)]
;

create cache time stamp
 where obj_nam = "MLSCat-" || "@locale_id@"
   and idx_val = "LES"