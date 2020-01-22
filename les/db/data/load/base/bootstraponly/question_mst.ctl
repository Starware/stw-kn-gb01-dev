[MERGE INTO question_mst tbl
      USING (SELECT '@question_id@' question_id,
                    '@question_set@' question_set,
                    '@message@' message,
                    '@class_name@' class_name,
                    '@tooltip_id@' tooltip_id,
                    '@resp_path_aff_act@' resp_path_aff_act,
                    '@resp_path_neg_act@' resp_path_neg_act,
                    to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt,
                    '@last_upd_user_id@' last_upd_user_id
               FROM dual) input
         ON (tbl.question_id = input.question_id
        AND  tbl.question_set = input.question_set)
 WHEN NOT MATCHED THEN
     INSERT (question_id,
             question_set,
             message,
             class_name,
             tooltip_id,
             resp_path_aff_act,
             resp_path_neg_act,
             last_upd_dt,
             last_upd_user_id)
     VALUES (input.question_id,
             input.question_set,
             input.message,
             input.class_name,
             input.tooltip_id,
             input.resp_path_aff_act,
             input.resp_path_neg_act,
             input.last_upd_dt,
             input.last_upd_user_id)]
