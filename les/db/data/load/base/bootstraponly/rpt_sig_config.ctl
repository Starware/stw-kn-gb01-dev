[MERGE INTO rpt_sig_config r 
      USING (SELECT '@rpt_id@' rpt_id, '@sig_id@' sig_id, '@rpt_page@' rpt_page, @sig_top@ sig_top, @sig_left@ sig_left, @sig_wid@ sig_wid, 
                    @sig_hgt@ sig_hgt
                    FROM dual) input 
         ON (r.rpt_id = input.rpt_id
             AND r.sig_id = input.sig_id)
 WHEN NOT MATCHED THEN
     INSERT (rpt_id, sig_id, rpt_page, sig_top, sig_left, sig_wid, sig_hgt) 
     VALUES (input.rpt_id, input.sig_id, input.rpt_page, input.sig_top, input.sig_left, input.sig_wid, input.sig_hgt)] catch(-208, -942)
