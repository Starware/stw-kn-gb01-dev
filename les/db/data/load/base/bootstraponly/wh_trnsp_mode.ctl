[MERGE INTO wh_trnsp_mode w 
      USING (SELECT '@trnsp_mode@' trnsp_mode, '@wh_id@' wh_id, to_number('@max_usr@') max_usr, nvl(to_number('@lock_usr_flg@'),0) lock_usr_flg, 
                    to_number('@def_stacks_rel@') def_stacks_rel, nvl(to_number('@stack_cmpl_flg@'),0) stack_cmpl_flg, nvl(to_number('@trlr_dck_flg@'),0) trlr_dck_flg, 
                    '@bol_break_lvl@' bol_break_lvl
                    FROM dual) input 
         ON (w.trnsp_mode = input.trnsp_mode
             AND w.wh_id = input.wh_id) 
 WHEN NOT MATCHED THEN
     INSERT (trnsp_mode, wh_id, max_usr, lock_usr_flg, def_stacks_rel, stack_cmpl_flg, trlr_dck_flg, bol_break_lvl) 
     VALUES (input.trnsp_mode, input.wh_id, input.max_usr, input.lock_usr_flg, input.def_stacks_rel, input.stack_cmpl_flg, 
             input.trlr_dck_flg, input.bol_break_lvl)]
