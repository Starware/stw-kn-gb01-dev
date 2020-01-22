[MERGE INTO cmd_config c 
      USING (SELECT '@cmd_config_id@' cmd_config_id, '@cmd_config@' cmd_config, '@cmd_grp@' cmd_grp
                    FROM dual) input 
         ON (c.cmd_config_id = input.cmd_config_id) 
 WHEN NOT MATCHED THEN
     INSERT (cmd_config_id, cmd_config, cmd_grp) 
     VALUES (input.cmd_config_id, input.cmd_config, input.cmd_grp)]
