[ select count(*) row_count from chart_prop_def where
    graph_type = @graph_type@ and var_nam = '@var_nam@' ] 
| 
  if (@row_count = 0) 
  {
        [ insert into chart_prop_def
                      (graph_type, var_nam, posn, category_id, chart_usage, grp_nam)
                      VALUES
                      (@graph_type@, '@var_nam@', @posn@, '@category_id@', '@chart_usage@', '@grp_nam@') ]
  }

