[MERGE INTO reacod tbl
      USING (SELECT '@reacod@' reacod,
                    '@cstms_ordtyp@' cstms_ordtyp,
                    '@cstms_rcpt_typ@' cstms_rcpt_typ,
                    to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt,
                    '@last_upd_user_id@' last_upd_user_id,
                    to_date('@ins_dt@', 'YYYYMMDDHH24MISS') ins_dt,
                    '@ins_user_id@' ins_user_id
               FROM dual) input
         ON (tbl.reacod = input.reacod)
 WHEN NOT MATCHED THEN
     INSERT (reacod,
             cstms_ordtyp,
             cstms_rcpt_typ,
             last_upd_dt,
             last_upd_user_id,
             ins_dt,
             ins_user_id)
     VALUES (input.reacod,
             input.cstms_ordtyp,
             input.cstms_rcpt_typ,
             input.last_upd_dt,
             input.last_upd_user_id,
             input.ins_dt,
             input.ins_user_id)]
