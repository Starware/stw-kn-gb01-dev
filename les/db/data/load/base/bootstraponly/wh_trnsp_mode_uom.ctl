[MERGE INTO wh_trnsp_mode_uom w 
      USING (SELECT '@trnsp_mode@' trnsp_mode, '@uomcod@' uomcod, '@wh_id@' wh_id, @opt_dck_flg@ opt_dck_flg, 
                    nvl(to_number('@rel_palletctl_flg@'),0) rel_palletctl_flg
                    FROM dual) input 
         ON (w.trnsp_mode = input.trnsp_mode
             AND w.uomcod = input.uomcod
             AND w.wh_id = input.wh_id) 
 WHEN NOT MATCHED THEN
     INSERT (trnsp_mode, uomcod, wh_id, opt_dck_flg, rel_palletctl_flg) 
     VALUES (input.trnsp_mode, input.uomcod, input.wh_id, input.opt_dck_flg, input.rel_palletctl_flg)]
