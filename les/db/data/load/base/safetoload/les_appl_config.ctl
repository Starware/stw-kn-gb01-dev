[MERGE INTO les_appl_config l
      USING (SELECT '@user_id@' user_id, '@locale_id@' locale_id, '@appl_id@' appl_id, '@frm_id@' frm_id, '@ctl_nam@' ctl_nam,
                    '@prf_lbl@' prf_lbl, '@srt_seq@' srt_seq, to_number('@prf_num@') prf_num, '@prf_str@' prf_str, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (l.user_id = input.user_id
             AND l.locale_id = input.locale_id
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.ctl_nam = input.ctl_nam
             AND l.prf_lbl = input.prf_lbl)
 WHEN NOT MATCHED THEN
     INSERT (user_id, locale_id, appl_id, frm_id, ctl_nam, prf_lbl, srt_seq, prf_num, prf_str, grp_nam)
     VALUES (input.user_id, input.locale_id, input.appl_id, input.frm_id, input.ctl_nam, input.prf_lbl, input.srt_seq, input.prf_num,
             input.prf_str, input.grp_nam)]
