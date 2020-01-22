[ select count(*) row_count 
    from ctry_mst 
   where ctry_name = '@ctry_name@' 
] 
| 
if (@row_count = 0) 
{
[ insert into ctry_mst
              (ctry_name, iso_2_ctry_name, iso_3_ctry_name, 
               iso_ctry_num, adr_fmt, dom_ld_acc_cd, 
               intl_acc_cd, ctry_phone_cd, cs_ctry_name,
               zip_cod_len, dty_ctry_typ, grp_nam)
        VALUES
              ('@ctry_name@', '@iso_2_ctry_name@', '@iso_3_ctry_name@', 
               '@iso_ctry_num@', '@adr_fmt@', '@dom_ld_acc_cd@', 
               '@intl_acc_cd@', '@ctry_phone_cd@', '@cs_ctry_name@', 
               '@zip_cod_len@', '@dty_ctry_typ@', '@grp_nam@') 
     ]
}

