[MERGE INTO les_lkp_fld l 
      USING (SELECT '@lkp_id@' lkp_id, @cust_lvl@ cust_lvl, '@fld_nam@' fld_nam, @srt_seq@ srt_seq, '@fld_var@' fld_var, @inp_flg@ inp_flg, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.lkp_id = input.lkp_id
             AND l.cust_lvl = input.cust_lvl
             AND l.fld_nam = input.fld_nam) 
 WHEN NOT MATCHED THEN
     INSERT (lkp_id, cust_lvl, fld_nam, srt_seq, fld_var, inp_flg, grp_nam) 
     VALUES (input.lkp_id, input.cust_lvl, input.fld_nam, input.srt_seq, input.fld_var, input.inp_flg, input.grp_nam)]
|

create cache time stamp 
  where obj_nam = "MCSLookups"
    and idx_val = "@lkp_id@"