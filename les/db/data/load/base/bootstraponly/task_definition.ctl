[MERGE INTO task_definition t 
      USING (SELECT '@task_id@' task_id, '@role_id@' role_id, '@name@' name, '@task_typ@' task_typ, '@cmd_line@' cmd_line, 
                    '@run_dir@' run_dir, '@log_file@' log_file, '@trace_level@' trace_level, @restart@ restart, @auto_start@ auto_start, 
                    to_number('@start_delay@') start_delay, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (t.task_id = input.task_id)
 WHEN NOT MATCHED THEN
     INSERT (task_id, role_id, name, task_typ, cmd_line, run_dir, log_file, trace_level, restart, auto_start, start_delay, grp_nam) 
     VALUES (input.task_id, input.role_id, input.name, input.task_typ, input.cmd_line, input.run_dir, input.log_file, input.trace_level, 
             input.restart, input.auto_start, input.start_delay, input.grp_nam)]
