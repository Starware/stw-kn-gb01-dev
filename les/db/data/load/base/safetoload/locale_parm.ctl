[MERGE INTO locale_parm l
      USING (SELECT '@locale_id@' locale_id, '@usr_id@' usr_id, '@bool_t_char@' bool_t_char, '@bool_f_char@' bool_f_char, 
                    '@bool_toggle@' bool_toggle, '@crncy_code@' crncy_code, '@positive_sign@' positive_sign, 
                    '@negative_sign@' negative_sign, to_number('@p_sign_posn@') p_sign_posn, to_number('@n_sign_posn@') n_sign_posn, 
                    '@decimal_point@' decimal_point, '@thousands_sep@' thousands_sep, '@grouping@' grouping, '@dat_fmt_cd@' dat_fmt_cd, 
                    '@long_dat_fmt@' long_dat_fmt, '@mon_dsp_typ@' mon_dsp_typ, '@dat_sep_char@' dat_sep_char, '@tim_fmt_cd@' tim_fmt_cd, 
                    '@long_tim_fmt@' long_tim_fmt, '@tim_sep_char@' tim_sep_char, '@am_str@' am_str, '@pm_str@' pm_str, 
                    to_number('@wk_strt@') wk_strt, to_number('@wk_rule@') wk_rule, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (l.locale_id = input.locale_id
             AND l.usr_id = input.usr_id)
 WHEN NOT MATCHED THEN
     INSERT (locale_id, usr_id, bool_t_char, bool_f_char, bool_toggle, crncy_code, positive_sign, negative_sign, p_sign_posn, n_sign_posn, 
             decimal_point, thousands_sep, grouping, dat_fmt_cd, long_dat_fmt, mon_dsp_typ, dat_sep_char, tim_fmt_cd, long_tim_fmt, 
             tim_sep_char, am_str, pm_str, wk_strt, wk_rule, grp_nam) 
     VALUES (input.locale_id, input.usr_id, input.bool_t_char, input.bool_f_char, input.bool_toggle, input.crncy_code, input.positive_sign, 
             input.negative_sign, input.p_sign_posn, input.n_sign_posn, input.decimal_point, input.thousands_sep, input.grouping, 
             input.dat_fmt_cd, input.long_dat_fmt, input.mon_dsp_typ, input.dat_sep_char, input.tim_fmt_cd, input.long_tim_fmt, 
             input.tim_sep_char, input.am_str, input.pm_str, input.wk_strt, input.wk_rule, input.grp_nam)]
