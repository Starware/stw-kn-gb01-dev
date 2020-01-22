[MERGE INTO cnttyp c 
      USING (SELECT '@cnttyp@' cnttyp, '@base_count_type@' base_count_type, '@oprcod@' oprcod, '@lpncnt_oprcod@' lpncnt_oprcod, 
                    to_number('@dtl_flg@') dtl_flg, '@end_loc_cnt@' end_loc_cnt, '@nxt_cnttyp@' nxt_cnttyp, 
                    to_number('@sum_retry_flg@') sum_retry_flg, '@cls_loc_cnt_mthd@' cls_loc_cnt_mthd, 
                    to_number('@emp_loc_flg@') emp_loc_flg, '@adj_mthd@' adj_mthd, sysdate last_upd_dt, '@last_upd_usr_id@' last_upd_usr_id, sysdate ins_dt, '@ins_usr_id@' ins_usr_id, to_number('@homog_adj_flg@') homog_adj_flg, 
                    to_number('@rf_prmpt_rea_flg@') rf_prmpt_rea_flg, to_number('@diff_usr_flg@') diff_usr_flg, to_number('@abc_cnt_flg@') abc_cnt_flg
                    FROM dual) input 
         ON (c.cnttyp = input.cnttyp)
 WHEN NOT MATCHED THEN
     INSERT (cnttyp, base_count_type, oprcod, lpncnt_oprcod, dtl_flg, end_loc_cnt, nxt_cnttyp, sum_retry_flg, cls_loc_cnt_mthd, 
             emp_loc_flg, adj_mthd, ins_dt, ins_usr_id, homog_adj_flg, rf_prmpt_rea_flg, diff_usr_flg, abc_cnt_flg) 
     VALUES (input.cnttyp, input.base_count_type, input.oprcod, input.lpncnt_oprcod, input.dtl_flg, input.end_loc_cnt, input.nxt_cnttyp, 
             input.sum_retry_flg, input.cls_loc_cnt_mthd, input.emp_loc_flg, input.adj_mthd, input.ins_dt, input.ins_usr_id, input.homog_adj_flg, input.rf_prmpt_rea_flg, 
             input.diff_usr_flg, input.abc_cnt_flg)]
