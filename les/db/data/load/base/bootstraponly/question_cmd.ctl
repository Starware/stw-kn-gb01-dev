[MERGE INTO question_cmd tbl
      USING (SELECT '@question_set@' question_set,
                    '@cmd_type@' cmd_type,
                    '@cmd@' cmd,
                    to_date('@last_upd_dt@', 'YYYYMMDDHH24MISS') last_upd_dt,
                    '@last_upd_user_id@' last_upd_user_id,
                    to_date('@ins_dt@', 'YYYYMMDDHH24MISS') ins_dt,
                    '@ins_user_id@' ins_user_id
               FROM dual) input
         ON (tbl.question_set = input.question_set
        AND tbl.cmd_type = input.cmd_type)
 WHEN NOT MATCHED THEN
     INSERT (question_set,
             cmd_type,
             cmd,
             last_upd_dt,
             last_upd_user_id,
             ins_user_id,
             ins_dt
             )
     VALUES (input.question_set,
             input.cmd_type,
             input.cmd,
             input.last_upd_dt,
             input.last_upd_user_id,
             input.ins_user_id,
             input.ins_dt)]