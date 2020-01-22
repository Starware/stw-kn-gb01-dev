[MERGE INTO task_env_definition t 
      USING (SELECT '@task_id@' task_id, '@name@' name, '@value@' value
                    FROM dual) input 
         ON (t.task_id = input.task_id
             AND t.name = input.name)
 WHEN NOT MATCHED THEN
     INSERT (task_id, name, value) 
     VALUES (input.task_id, input.name, input.value)]
