[ select count(*) row_count from devmst where
    devcod = '@devcod@' and wh_id = '@wh_id@' ] | if (@row_count = 0) {
	
	[ insert into devmst
                      (devcod, wh_id, devcls, devnam, voc_term_id, prtadr, lst_usr_id, lbl_prtadr, rfid_prtadr, locale_id, mod_usr_id, ins_user_id, last_upd_user_id, wko_prcloc, touchscreen_flg, pko_mov_zone_id, spl_hand_loc, scanner_ser_dev_id)
                      VALUES
                      ('@devcod@', '@wh_id@', '@devcls@', '@devnam@', '@voc_term_id@', '@prtadr@', '@lst_usr_id@', '@lbl_prtadr@', '@rfid_prtadr@', '@locale_id@', '@mod_usr_id@', '@ins_user_id@', '@last_upd_user_id@', '@wko_prcloc@', @touchscreen_flg@, '@pko_mov_zone_id@', '@spl_hand_loc@', '@scanner_ser_dev_id@') ]
       }
           
