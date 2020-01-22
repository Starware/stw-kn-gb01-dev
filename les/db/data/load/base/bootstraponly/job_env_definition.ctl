[MERGE INTO job_env_definition j 
      USING (SELECT '@job_id@' job_id, '@name@' name, '@value@' value
                    FROM dual) input 
         ON (j.job_id = input.job_id
             AND j.name = input.name)
 WHEN NOT MATCHED THEN
     INSERT (job_id, name, value) 
     VALUES (input.job_id, input.name, input.value)]
