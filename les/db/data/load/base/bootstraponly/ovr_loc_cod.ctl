[MERGE INTO ovr_loc_cod o 
      USING (SELECT '@ovr_loc_cod@' ovr_loc_cod, to_number('@defflg@') defflg, '@cyc_cnt_cod@' cyc_cnt_cod, '@set_locsts@' set_locsts, 
                    to_number('@set_maxqvl_flg@') set_maxqvl_flg
                    FROM dual) input 
         ON (o.ovr_loc_cod = input.ovr_loc_cod) 
 WHEN NOT MATCHED THEN
     INSERT (ovr_loc_cod, defflg, cyc_cnt_cod, set_locsts, set_maxqvl_flg) 
     VALUES (input.ovr_loc_cod, input.defflg, input.cyc_cnt_cod, input.set_locsts, input.set_maxqvl_flg)]
