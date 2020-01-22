[MERGE INTO crncy_mst c 
      USING (SELECT '@crncy_code@' crncy_code, '@decimal_point@' decimal_point, '@thousands_sep@' thousands_sep, 
                    '@grouping_len@' grouping_len, '@crncy_sym@' crncy_sym, '@pos_fmt@' pos_fmt, '@neg_fmt@' neg_fmt, 
                    to_number('@frac_digits@') frac_digits, to_number('@ena_flg@') ena_flg, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (c.crncy_code = input.crncy_code)
 WHEN NOT MATCHED THEN
     INSERT (crncy_code, decimal_point, thousands_sep, grouping_len, crncy_sym, pos_fmt, neg_fmt, frac_digits, ena_flg, grp_nam)
     VALUES (input.crncy_code, input.decimal_point, input.thousands_sep, input.grouping_len, input.crncy_sym, input.pos_fmt, input.neg_fmt,
             input.frac_digits, input.ena_flg, input.grp_nam)]
