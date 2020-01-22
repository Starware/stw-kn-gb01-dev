[MERGE INTO mov_zone m 
      USING (SELECT @mov_zone_id@ mov_zone_id, '@mov_zone_cod@' mov_zone_cod, '@wh_id@' wh_id, '@bldg_id@' bldg_id, 
                    @clr_dstloc_flg@ clr_dstloc_flg, @split_trn@ split_trn, @lbl_on_split@ lbl_on_split, @ovrpck_rpl_flg@ ovrpck_rpl_flg, 
                    @cap_fill_flg@ cap_fill_flg, '@def_rplcfg_invsts@' def_rplcfg_invsts, 
                    to_number('@def_rplcfg_maxunt@') def_rplcfg_maxunt, to_number('@def_rplcfg_minunt@') def_rplcfg_minunt, 
                    @def_rplcfg_pctflg@ def_rplcfg_pctflg, @dyn_slot_flg@ dyn_slot_flg, @recalc_putaway@ recalc_putaway, 
                    '@max_mhu_deposit@' max_mhu_deposit, '@dstr_excp_loc@' dstr_excp_loc, @bto_kit_dep_flg@ bto_kit_dep_flg
                    FROM dual) input 
         ON (m.mov_zone_id = input.mov_zone_id)
 WHEN NOT MATCHED THEN
     INSERT (mov_zone_id, mov_zone_cod, wh_id, bldg_id, clr_dstloc_flg, split_trn, lbl_on_split, ovrpck_rpl_flg, cap_fill_flg, 
             def_rplcfg_invsts, def_rplcfg_maxunt, def_rplcfg_minunt, def_rplcfg_pctflg, dyn_slot_flg, recalc_putaway, max_mhu_deposit, 
             dstr_excp_loc, bto_kit_dep_flg) 
     VALUES (input.mov_zone_id, input.mov_zone_cod, input.wh_id, input.bldg_id, input.clr_dstloc_flg, input.split_trn, input.lbl_on_split, 
             input.ovrpck_rpl_flg, input.cap_fill_flg, input.def_rplcfg_invsts, input.def_rplcfg_maxunt, input.def_rplcfg_minunt, 
             input.def_rplcfg_pctflg, input.dyn_slot_flg, input.recalc_putaway, input.max_mhu_deposit, input.dstr_excp_loc, 
             input.bto_kit_dep_flg)]
