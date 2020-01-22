[select count(*) row_count 
   from devcls_function_dtl 
  where devcls = '@devcls@'
    and dev_function = '@dev_function@'
    and oprcod = '@oprcod@'
    and wh_id = '@wh_id@'] 
| 
if (@row_count = 0) 
{
    [insert into devcls_function_dtl
            (devcls, dev_function, oprcod, wh_id,last_upd_dt, last_upd_user_id, ins_dt, ins_user_id)
         values
            ('@devcls@', '@dev_function@', '@oprcod@','@wh_id@', to_date('@last_upd_dt@','YYYYMMDDHH24MISS'),
            '@last_upd_user_id@',to_date('@ins_dt@','YYYYMMDDHH24MISS'),'@ins_user_id@') ] 
}

