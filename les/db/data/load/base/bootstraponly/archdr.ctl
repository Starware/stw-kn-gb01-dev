[MERGE INTO archdr a 
      USING (SELECT '@arc_nam@' arc_nam, '@arc_table@' arc_table, '@list_cmd@' list_cmd, to_number('@max_rows@') max_rows, 
                    '@sts_fil@' sts_fil, to_number('@purge_flg@') purge_flg, '@post_arc_cmd@' post_arc_cmd, 
                    '@action_on_dup@' action_on_dup
                    FROM dual) input 
         ON (a.arc_nam = input.arc_nam)
 WHEN NOT MATCHED THEN
     INSERT (arc_nam, arc_table, list_cmd, max_rows, sts_fil, purge_flg, post_arc_cmd, action_on_dup) 
     VALUES (input.arc_nam, input.arc_table, input.list_cmd, input.max_rows, input.sts_fil, input.purge_flg, input.post_arc_cmd, 
             input.action_on_dup)]
