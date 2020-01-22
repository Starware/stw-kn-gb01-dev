[MERGE INTO velocity_type v 
      USING (SELECT '@velocity_type@' velocity_type
                    FROM dual) input 
         ON (v.velocity_type = input.velocity_type) 
 WHEN NOT MATCHED THEN
     INSERT (velocity_type) 
     VALUES (input.velocity_type)]
