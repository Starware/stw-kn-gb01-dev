[MERGE INTO les_usr_ath l 
      USING (SELECT '@usr_id@' usr_id, '@login_id@' login_id, '@usr_pswd@' usr_pswd, '@locale_id@' locale_id, '@usr_sts@' usr_sts, 
                    to_number('@super_usr_flg@') super_usr_flg, to_date('@acct_expir_dat@','YYYYMMDDHH24MISS') acct_expir_dat, 
                    to_date('@pswd_chg_dat@','YYYYMMDDHH24MISS') pswd_chg_dat, to_number('@pswd_chg_flg@') pswd_chg_flg, 
                    to_number('@pswd_expir_flg@') pswd_expir_flg, '@adr_id@' adr_id, '@client_id@' client_id, 
                    to_date('@lmsdte@','YYYYMMDDHH24MISS') lmsdte, to_date('@lst_dat@','YYYYMMDDHH24MISS') lst_dat, 
                    to_date('@lst_logout_dte@','YYYYMMDDHH24MISS') lst_logout_dte, to_number('@intruder_cnt@') intruder_cnt, 
                    to_number('@single_signon_flg@') single_signon_flg, to_number('@ext_ath_flg@') ext_ath_flg, 
                    to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id, '@pin_num@' pin_num, 
                    to_number('@incentive_flg@') incentive_flg, to_number('@differential_flg@') differential_flg, 
                    to_number('@unmeasured_flg@') unmeasured_flg, to_number('@payroll_flg@') payroll_flg, '@ath_grp_nam@' ath_grp_nam, 
                    '@cntbck_ena_cod@' cntbck_ena_cod, to_number('@adj_thr_cst@') adj_thr_cst, to_number('@adj_thr_unit@') adj_thr_unit, 
                    '@grp_nam@' grp_nam, '@voc_pin@' voc_pin, '@ba_user_id@' ba_user_id
                    FROM dual) input 
         ON (l.usr_id = input.usr_id) 
 WHEN NOT MATCHED THEN
     INSERT (usr_id, login_id, usr_pswd, locale_id, usr_sts, super_usr_flg, acct_expir_dat, pswd_chg_dat, pswd_chg_flg, pswd_expir_flg, 
             adr_id, client_id, lmsdte, lst_dat, lst_logout_dte, intruder_cnt, single_signon_flg, ext_ath_flg, moddte, mod_usr_id, pin_num, 
             incentive_flg, differential_flg, unmeasured_flg, payroll_flg, ath_grp_nam, cntbck_ena_cod, adj_thr_cst, adj_thr_unit, grp_nam, 
             voc_pin, ba_user_id) 
     VALUES (input.usr_id, input.login_id, input.usr_pswd, input.locale_id, input.usr_sts, input.super_usr_flg, input.acct_expir_dat, 
             input.pswd_chg_dat, input.pswd_chg_flg, input.pswd_expir_flg, input.adr_id, input.client_id, input.lmsdte, input.lst_dat, 
             input.lst_logout_dte, input.intruder_cnt, input.single_signon_flg, input.ext_ath_flg, input.moddte, input.mod_usr_id, 
             input.pin_num, input.incentive_flg, input.differential_flg, input.unmeasured_flg, input.payroll_flg, input.ath_grp_nam, 
             input.cntbck_ena_cod, input.adj_thr_cst, input.adj_thr_unit, input.grp_nam, input.voc_pin, input.ba_user_id)]
