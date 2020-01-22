[ select count(*) row_count from chart_prop where
    chart_id = '@chart_id@' and cust_lvl = @cust_lvl@ and var_nam = '@var_nam@' ] 
| 
  if (@row_count > 0) 
  {
    [ insert into chart_prop
                      (chart_id, cust_lvl, var_nam, chart_prop_val, grp_nam)
                      VALUES
                      ('@chart_id@', @cust_lvl@, '@var_nam@', '@chart_prop_val@', '@grp_nam@') ]
        
  }
