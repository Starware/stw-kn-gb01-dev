[MERGE INTO slot_attr_join s 
      USING (SELECT '@table_nam@' table_name, '@next_table@' next_table, '@join_cmd@' join_cmd, 
                    to_number('@outer_join_flg@') outer_join_flg
                    FROM dual) input 
         ON (s.table_name = input.table_name)
 WHEN NOT MATCHED THEN
     INSERT (table_name, next_table, join_cmd, outer_join_flg) 
     VALUES (input.table_name, input.next_table, input.join_cmd, input.outer_join_flg)]
