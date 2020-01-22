[MERGE INTO usr_client_grp u 
      USING (SELECT '@usr_id@' usr_id, '@client_grp@' client_grp, to_number('@u_version@') u_version, 
                    to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (u.usr_id = input.usr_id
             AND u.client_grp = input.client_grp) 
 WHEN NOT MATCHED THEN
     INSERT (usr_id, client_grp, u_version, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.usr_id, input.client_grp, input.u_version, input.ins_dt, input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
