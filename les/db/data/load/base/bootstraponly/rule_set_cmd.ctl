[MERGE INTO rule_set_cmd r 
      USING (SELECT '@rule_set@' rule_set, @rule_seq@ rule_seq, '@cmd_config_id@' cmd_config_id, '@cmd_arg@' cmd_arg, '@cmd_grp@' cmd_grp
                    FROM dual) input 
         ON (r.rule_set = input.rule_set
             AND r.rule_seq = input.rule_seq)
 WHEN NOT MATCHED THEN
     INSERT (rule_set, rule_seq, cmd_config_id, cmd_arg, cmd_grp) 
     VALUES (input.rule_set, input.rule_seq, input.cmd_config_id, input.cmd_arg, input.cmd_grp)]
