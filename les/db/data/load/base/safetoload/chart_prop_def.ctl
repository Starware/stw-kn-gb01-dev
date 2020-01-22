[MERGE INTO chart_prop_def c 
      USING (SELECT @graph_type@ graph_type, '@var_nam@' var_nam, @posn@ posn, '@category_id@' category_id, '@chart_usage@' chart_usage, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (c.graph_type = input.graph_type
             AND c.var_nam = input.var_nam) 
 WHEN NOT MATCHED THEN
     INSERT (graph_type, var_nam, posn, category_id, chart_usage, grp_nam) 
     VALUES (input.graph_type, input.var_nam, input.posn, input.category_id, input.chart_usage, input.grp_nam)]
