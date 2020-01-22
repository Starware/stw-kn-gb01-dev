[MERGE INTO rf_ven_mst rvm
      USING (SELECT '@rf_ven_nam@' rf_ven_nam, 
                    '@rf_ven_inq@' rf_ven_inq, 
                    '@rf_ven_resp@' rf_ven_resp, 
                    to_number('@rf_ven_resp_time@') rf_ven_resp_time, 
                    '@ins_dt@' ins_dt, 
                    to_date('@last_upd_dt@') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, 
                    to_date('@last_upd_user_id@') last_upd_user_id
               FROM dual) input
         ON (rvm.rf_ven_nam = input.rf_ven_nam)
 WHEN NOT MATCHED THEN
     INSERT (rf_ven_nam, 
             rf_ven_inq, 
             rf_ven_resp, 
             rf_ven_resp_time, 
             ins_dt, 
             last_upd_dt, 
             ins_user_id, 
             last_upd_user_id)
     VALUES (input.rf_ven_nam, 
             input.rf_ven_inq, 
             input.rf_ven_resp, 
             input.rf_ven_resp_time, 
             input.ins_dt, 
             input.last_upd_dt, 
             input.ins_user_id, 
             input.last_upd_user_id)]