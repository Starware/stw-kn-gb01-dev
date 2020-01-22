[MERGE INTO arcdtl a 
      USING (SELECT '@arc_nam@' arc_nam, @seqnum@ seqnum, to_number('@srtseq@') srtseq, '@arc_table@' arc_table, '@list_cmd@' list_cmd, 
                    '@post_arc_cmd@' post_arc_cmd, '@action_on_dup@' action_on_dup
                    FROM dual) input 
         ON (a.arc_nam = input.arc_nam
             AND a.seqnum = input.seqnum)
 WHEN NOT MATCHED THEN
     INSERT (arc_nam, seqnum, srtseq, arc_table, list_cmd, post_arc_cmd, action_on_dup) 
     VALUES (input.arc_nam, input.seqnum, input.srtseq, input.arc_table, input.list_cmd, input.post_arc_cmd, input.action_on_dup)]
