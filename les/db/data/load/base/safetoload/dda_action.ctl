[MERGE INTO dda_action d 
      USING (SELECT '@dda_id@' dda_id, '@action@' action, @cust_lvl@ cust_lvl, '@action_flds@' action_flds, '@action_frm@' action_frm, 
                    '@img_link@' img_link, to_number('@ena_flg@') ena_flg, '@grp_nam@' grp_nam, to_number('@srtseq@') srtseq, 
                    '@action_init_cmd@' action_init_cmd, '@action_post_cmd@' action_post_cmd, to_number('@rqdflg@') rqdflg, 
                    '@submit_mls_id@' submit_mls_id, '@post_mls_id@' post_mls_id, to_number('@auto_clear@') auto_clear
                    FROM dual) input 
         ON (d.dda_id = input.dda_id
             AND d.action = input.action
             AND d.cust_lvl = input.cust_lvl) 
  WHEN NOT MATCHED THEN
     INSERT (dda_id, action, cust_lvl, action_flds, action_frm, img_link, ena_flg, grp_nam, srtseq, action_init_cmd, action_post_cmd, 
             rqdflg, submit_mls_id, post_mls_id, auto_clear) 
     VALUES (input.dda_id, input.action, input.cust_lvl, input.action_flds, input.action_frm, input.img_link, input.ena_flg, input.grp_nam, 
             input.srtseq, input.action_init_cmd, input.action_post_cmd, input.rqdflg, input.submit_mls_id, input.post_mls_id, 
             input.auto_clear)]
;

create cache time stamp
 where obj_nam = "DDAActions"
   and idx_val = "LES"