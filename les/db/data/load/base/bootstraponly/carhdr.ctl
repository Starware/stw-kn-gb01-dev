[ select count(*) row_count 
    from carhdr 
   where carcod = '@carcod@' ] | 

    if (@row_count = 0) 
    { 
       [insert into carhdr 
            (carcod, 
             accnum, 
             carnam, 
             scacod, 
             autoclsflg, 
             autocls_mansts, 
             autocls_wait_tim, 
             adr_id, 
             hrs_opr_set_id, 
             excp_hrs_set_id, 
             crncy_code) 
           values 
            ('@carcod@', 
             '@accnum@', 
             '@carnam@', 
             '@scacod@', 
             '@autoclsflg@', 
             '@autocls_mansts@', 
             '@autocls_wait_tim@', 
             '@adr_id@', 
             '@hrs_opr_set_id@', 
             '@excp_hrs_set_id@', 
             '@crncy_code@') ] 
    }

