[MERGE INTO job_definition j 
      USING (SELECT '@job_id@' job_id, '@role_id@' role_id, '@name@' name, @enabled@ enabled, '@type@' type, '@command@' command, 
                    '@log_file@' log_file, '@trace_level@' trace_level, @overlap@ overlap, '@schedule@' schedule, 
                    to_number('@start_delay@') start_delay, to_number('@timer@') timer, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (j.job_id = input.job_id)
 WHEN NOT MATCHED THEN
     INSERT (job_id, role_id, name, enabled, type, command, log_file, trace_level, overlap, schedule, start_delay, timer, grp_nam) 
     VALUES (input.job_id, input.role_id, input.name, input.enabled, input.type, input.command, input.log_file, input.trace_level, 
             input.overlap, input.schedule, input.start_delay, input.timer, input.grp_nam)]
