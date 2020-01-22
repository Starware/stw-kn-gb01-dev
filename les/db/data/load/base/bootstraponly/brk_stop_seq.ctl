[MERGE INTO brk_stop_seq b 
      USING (SELECT '@brk_stop_seq_cod@' brk_stop_seq_cod, @seqnum@ seqnum
                    FROM dual) input 
         ON (b.brk_stop_seq_cod = input.brk_stop_seq_cod)
 WHEN NOT MATCHED THEN
     INSERT (brk_stop_seq_cod, seqnum) 
     VALUES (input.brk_stop_seq_cod, input.seqnum)]
