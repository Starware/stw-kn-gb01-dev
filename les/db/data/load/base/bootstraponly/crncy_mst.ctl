[ select count(*) row_count 
    from crncy_mst 
   where crncy_code = '@crncy_code@' 
] 
| 
if (@row_count = 0) 
{
    [ insert into crncy_mst
             (crncy_code, decimal_point, thousands_sep, 
              grouping_len, crncy_sym,pos_fmt, neg_fmt, frac_digits, ena_flg, grp_nam)
      VALUES ('@crncy_code@', '@decimal_point@', '@thousands_sep@', 
              '@grouping_len@','@crncy_sym@', '@pos_fmt@', '@neg_fmt@', @frac_digits@, @ena_flg@, '@grp_nam@') 
    ]
}

