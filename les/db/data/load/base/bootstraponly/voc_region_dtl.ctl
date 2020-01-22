[MERGE INTO voc_region_dtl v 
      USING (SELECT @region_num@ region_num, @voc_valid_function@ voc_valid_function, '@wh_id@' wh_id, '@varnam@' varnam, '@value@' value, 
                    to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (v.region_num = input.region_num
             AND v.voc_valid_function = input.voc_valid_function
             AND v.wh_id = input.wh_id
             AND v.varnam = input.varnam)
 WHEN NOT MATCHED THEN
     INSERT (region_num, voc_valid_function, wh_id, varnam, value, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.region_num, input.voc_valid_function, input.wh_id, input.varnam, input.value, input.ins_dt, input.last_upd_dt, 
             input.ins_user_id, input.last_upd_user_id)]
