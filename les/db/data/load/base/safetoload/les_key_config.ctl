[MERGE INTO les_key_config l 
      USING (SELECT @key_code@ key_code, @key_shift@ key_shift, '@frm_id@' frm_id, @cust_lvl@ cust_lvl, '@act_key@' act_key, 
                    '@grp_nam@' grp_nam, to_number('@ena_flg@') ena_flg
                    FROM dual) input 
         ON (l.key_code = input.key_code
             AND l.key_shift = input.key_shift
             AND l.frm_id = input.frm_id
             AND l.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (key_code, key_shift, frm_id, cust_lvl, act_key, grp_nam, ena_flg) 
     VALUES (input.key_code, input.key_shift, input.frm_id, input.cust_lvl, input.act_key, input.grp_nam, input.ena_flg)]
|
   create cache time stamp
    where obj_nam = "MCSKeys"
      and idx_val = "LES"