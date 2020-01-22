[ select count(*) row_count 
    from dat_fmt 
   where dat_fmt = '@dat_fmt@' 
] 
| 
if (@row_count = 0) 
{
   [ insert into dat_fmt
             (dat_fmt, dat_fmt_cd, mon_dsp_typ, 
              dat_sep_char, grp_nam)
      VALUES ('@dat_fmt@', '@dat_fmt_cd@', '@mon_dsp_typ@', 
              '@dat_sep_char@', '@grp_nam@') 
    ] 
}

