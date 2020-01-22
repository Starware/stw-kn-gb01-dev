[ select count(*) row_count from cst_billto_acct where
    cstnum = '@cstnum@' and client_id = '@client_id@' and carcod = '@carcod@' ] | if (@row_count = 0) {
	
	     [ insert into cst_billto_acct
                      (cstnum, client_id, carcod, accnum, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id)
                      VALUES
                      ('@cstnum@', '@client_id@', '@carcod@', '@accnum@', to_date('@ins_dt@','YYYYMMDDHH24MISS'), to_date('@last_upd_dt@','YYYYMMDDHH24MISS'), '@ins_user_id@', '@last_upd_user_id@') ]
        }
