[MERGE INTO dat_fmt d
      USING (SELECT '@dat_fmt@' dat_fmt, '@dat_fmt_cd@' dat_fmt_cd, '@mon_dsp_typ@' mon_dsp_typ, '@dat_sep_char@' dat_sep_char,
                    '@grp_nam@' grp_nam
                    FROM dual) input
         ON (d.dat_fmt = input.dat_fmt)
 WHEN NOT MATCHED THEN
     INSERT (dat_fmt, dat_fmt_cd, mon_dsp_typ, dat_sep_char, grp_nam)
     VALUES (input.dat_fmt, input.dat_fmt_cd, input.mon_dsp_typ, input.dat_sep_char, input.grp_nam)]
