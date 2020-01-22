[select count(*) row_count 
   from devcls_function 
  where devcls = '@devcls@'
    and dev_function = '@dev_function@'] 
| 
if (@row_count = 0) 
{
    [insert into devcls_function
            (devcls, dev_function, last_upd_dt, last_upd_user_id, ins_dt, ins_user_id)
         values
            ('@devcls@', '@dev_function@', to_date('@last_upd_dt@','YYYYMMDDHH24MISS'),
            '@last_upd_user_id@',to_date('@ins_dt@','YYYYMMDDHH24MISS'),'@ins_user_id@') ] 
}

