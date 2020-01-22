[MERGE INTO reacod_reagrp tbl
      USING (SELECT '@reacod@' reacod,
                    '@reagrp@' reagrp,
                    '@client_id@' client_id,
                    '@seqnum@' seqnum,
                    to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt,
                    '@last_upd_user_id@' last_upd_user_id,
                    to_date('@ins_dt@', 'YYYYMMDDHH24MISS') ins_dt,
                    '@ins_user_id@' ins_user_id
               FROM dual) input
         ON (tbl.reacod = input.reacod
        AND tbl.reagrp = input.reagrp
        AND tbl.client_id = input.client_id)
 WHEN NOT MATCHED THEN
     INSERT (reacod,
             reagrp,
             client_id,
             seqnum,
             last_upd_dt,
             last_upd_user_id,
             ins_dt,
             ins_user_id)
     VALUES (input.reacod,
             input.reagrp,
             input.client_id,
             input.seqnum,
             input.last_upd_dt,
             input.last_upd_user_id,
             input.ins_dt,
             input.ins_user_id)]
