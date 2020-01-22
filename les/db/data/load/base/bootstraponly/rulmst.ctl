[ select count(*) row_count 
    from rulmst 
   where rule_nam = '@rule_nam@' ]
   | 
  
    if (@row_count = 0) 
    { 
        create record
         where table = 'rulmst'
           and rule_nam   = '@rule_nam@'
           and summary_cmd = '@summary_cmd@'
       and cancel_cmd = '@cancel_cmd@'
           and locale_id = 'US_ENGLISH'
            and chg_carlvl = '@chg_carlvl@'
    }  

