[MERGE INTO wave_rule w 
      USING (SELECT '@rule_nam@' rule_nam, @dumkey@ dumkey, '@cmd@' cmd, @srtseq@ srtseq
                    FROM dual) input 
         ON (w.rule_nam = input.rule_nam
             AND w.dumkey = input.dumkey)
 WHEN NOT MATCHED THEN
     INSERT (rule_nam, dumkey, cmd, srtseq) 
     VALUES (input.rule_nam, input.dumkey, input.cmd, input.srtseq)]
