[MERGE INTO crncy_conv_rate c 
      USING (SELECT '@src_crncy_code@' src_crncy_code, '@dst_crncy_code@' dst_crncy_code, 
                    to_date('@effectivedate@','YYYYMMDDHH24MISS') effectivedate, @conv_rate@ conv_rate
                    FROM dual) input 
         ON (c.src_crncy_code = input.src_crncy_code
             AND c.dst_crncy_code = input.dst_crncy_code
             AND c.effectivedate = input.effectivedate) 
 WHEN NOT MATCHED THEN
     INSERT (src_crncy_code, dst_crncy_code, effectivedate, conv_rate) 
     VALUES (input.src_crncy_code, input.dst_crncy_code, input.effectivedate, input.conv_rate)]
