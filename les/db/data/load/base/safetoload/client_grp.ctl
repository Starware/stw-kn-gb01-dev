[MERGE INTO client_grp c 
      USING (SELECT '@client_grp@' client_grp, to_number('@adj_thr_cst@') adj_thr_cst, to_number('@adj_thr_unit@') adj_thr_unit, 
                    to_number('@u_version@') u_version, to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, 
                    to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, '@ins_user_id@' ins_user_id, 
                    '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (c.client_grp = input.client_grp) 
 WHEN NOT MATCHED THEN
     INSERT (client_grp, adj_thr_cst, adj_thr_unit, u_version, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.client_grp, input.adj_thr_cst, input.adj_thr_unit, input.u_version, input.ins_dt, input.last_upd_dt, input.ins_user_id, 
             input.last_upd_user_id)]
