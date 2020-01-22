[MERGE INTO nottyp_dtl n 
      USING (SELECT '@nottyp@' nottyp, '@exitpnt@' exitpnt, to_number('@dsp_auto_flg@') dsp_auto_flg, to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, 
                    to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, '@ins_user_id@' ins_user_id, 
                    '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (n.nottyp = input.nottyp
             AND n.exitpnt = input.exitpnt)
 WHEN NOT MATCHED THEN
     INSERT (nottyp, exitpnt, dsp_auto_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.nottyp, input.exitpnt, input.dsp_auto_flg, input.ins_dt, input.last_upd_dt, input.ins_user_id, input.last_upd_user_id)]
