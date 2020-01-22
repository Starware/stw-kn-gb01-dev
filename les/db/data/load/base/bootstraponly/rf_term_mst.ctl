[MERGE INTO rf_term_mst rtm
      USING (SELECT '@rf_ven_nam@' rf_ven_nam, 
                    '@wh_id@' wh_id, 
                    '@term_id@' term_id, 
                    to_number('@dsply_wid@') dsply_wid, 
                    to_number('@dsply_hgt@') dsply_hgt, 
                    '@term_typ@' term_typ, 
                    '@devcod@' devcod, 
                    '@locale_id@' locale_id, 
                    '@recplycod@' recplycod, 
                    '@recplyfil@' recplyfil
               FROM dual) input
         ON (    rtm.rf_ven_nam = input.rf_ven_nam
             AND rtm.wh_id = input.wh_id
             AND rtm.term_id = input.term_id)
 WHEN NOT MATCHED THEN
     INSERT (rf_ven_nam, 
             wh_id, 
             term_id, 
             dsply_wid, 
             dsply_hgt, 
             term_typ, 
             devcod, 
             locale_id, 
             recplycod, 
             recplyfil)
     VALUES (input.rf_ven_nam, 
             input.wh_id, 
             input.term_id, 
             input.dsply_wid, 
             input.dsply_hgt, 
             input.term_typ, 
             input.devcod, 
             input.locale_id, 
             input.recplycod, 
             input.recplyfil)]
