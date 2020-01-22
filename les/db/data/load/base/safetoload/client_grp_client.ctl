[MERGE INTO client_grp_client c 
      USING (SELECT '@client_grp@' client_grp, '@client_id@' client_id, to_number('@u_version@') u_version, 
                    to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (c.client_grp = input.client_grp
             AND c.client_id = input.client_id) 
 WHEN NOT MATCHED THEN
     INSERT (client_grp, client_id, u_version, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.client_grp, input.client_id, input.u_version, input.ins_dt, input.last_upd_dt, input.ins_user_id, 
             input.last_upd_user_id)]
