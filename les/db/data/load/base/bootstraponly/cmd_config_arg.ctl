[MERGE INTO cmd_config_arg c 
      USING (SELECT '@cmd_config_id@' cmd_config_id, '@cmd_config_arg@' cmd_config_arg, @seq@ seq, '@arg_typ@' arg_typ, @req_flg@ req_flg, 
                    @null_flg@ null_flg, to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, 
                    to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, '@ins_user_id@' ins_user_id, 
                    '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (c.cmd_config_id = input.cmd_config_id
             AND c.cmd_config_arg = input.cmd_config_arg) 
 WHEN NOT MATCHED THEN
     INSERT (cmd_config_id, cmd_config_arg, seq, arg_typ, req_flg, null_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.cmd_config_id, input.cmd_config_arg, input.seq, input.arg_typ, input.req_flg, input.null_flg, input.ins_dt, 
             input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
