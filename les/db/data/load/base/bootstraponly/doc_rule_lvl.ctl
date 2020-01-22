[MERGE INTO doc_rule_lvl d 
      USING (SELECT '@doc_typ@' doc_typ, @seqnum@ seqnum, '@colval@' colval, @par_uom_flg@ par_uom_flg, 
                    to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (d.doc_typ = input.doc_typ
             AND d.seqnum = input.seqnum
             AND d.colval = input.colval
             AND d.par_uom_flg = input.par_uom_flg) 
 WHEN NOT MATCHED THEN
     INSERT (doc_typ, seqnum, colval, par_uom_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.doc_typ, input.seqnum, input.colval, input.par_uom_flg, input.ins_dt, input.last_upd_dt, input.ins_user_id, 
             input.last_upd_user_id)]
