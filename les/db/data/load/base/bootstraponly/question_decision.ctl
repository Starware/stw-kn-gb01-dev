[MERGE INTO question_decision tbl
      USING (SELECT '@question_id@' question_id,
                    '@question_set@' question_set,
                    '@next_question@' next_question,
                    '@resp_path@' resp_path,
                    to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt,
                    '@last_upd_user_id@' last_upd_user_id
               FROM dual) input
         ON (tbl.question_id = input.question_id
        AND tbl.question_set = input.question_set
        AND tbl.next_question = input.next_question
        AND tbl.resp_path = input.resp_path
         )
 WHEN NOT MATCHED THEN
     INSERT (question_id,
             question_set,
             next_question,
             resp_path,
             last_upd_dt,
             last_upd_user_id)
     VALUES (input.question_id,
             input.question_set,
             input.next_question,
             input.resp_path,
             input.last_upd_dt,
             input.last_upd_user_id)]
