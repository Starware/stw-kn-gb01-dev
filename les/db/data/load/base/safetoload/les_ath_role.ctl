[MERGE INTO les_ath_role l
      USING (SELECT '@role_id@' role_id, to_number('@ena_flg@') ena_flg, nvl('@par_role_id@', 'SUPER') par_role_id, '@ath_grp_nam@' ath_grp_nam,
                    to_number('@adj_thr_cst@') adj_thr_cst, to_number('@adj_thr_unit@') adj_thr_unit, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.role_id = input.role_id) 
 WHEN NOT MATCHED THEN
     INSERT (role_id, ena_flg, par_role_id, ath_grp_nam, adj_thr_cst, adj_thr_unit, grp_nam)
     VALUES (input.role_id, input.ena_flg, input.par_role_id, input.ath_grp_nam, input.adj_thr_cst, input.adj_thr_unit, input.grp_nam)]
