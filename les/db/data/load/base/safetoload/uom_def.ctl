[MERGE INTO uom_def u 
      USING (SELECT '@mu_sys@' mu_sys, '@mu@' mu, '@mu_cat@' mu_cat
                    FROM dual) input 
         ON (u.mu_sys = input.mu_sys
             AND u.mu_cat = input.mu_cat)
 WHEN NOT MATCHED THEN
     INSERT (mu_sys, mu, mu_cat) 
     VALUES (input.mu_sys, input.mu, input.mu_cat)]