[ select count(*) row_count 
   from crncy_fmt 
  where crncy_fmt = '@crncy_fmt@' 
] 
| 
if (@row_count = 0) 
{
    [ insert into crncy_fmt
         (crncy_fmt, pos_neg_cd, cs_precedes, 
          sep_by_space, sign_posn, grp_nam)
        VALUES
         ('@crncy_fmt@', '@pos_neg_cd@', @cs_precedes@, 
          @sep_by_space@, @sign_posn@, '@grp_nam@') 
    ]
}

