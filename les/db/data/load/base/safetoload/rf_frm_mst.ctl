[ select count(*) row_count 
    from rf_frm_mst 
   where rf_frm = '@rf_frm@' 
     and cust_lvl = to_number(@cust_lvl@) 
] 
| 
   if (@row_count > 0) 
   {
   
      [ insert into rf_frm_mst
               (rf_frm,
                cust_lvl,
                frm_cls,
                grp_nam,
                ins_dt,
                last_upd_dt,
                ins_user_id,
                last_upd_user_id)
            VALUES
               ('@rf_frm@', 
                to_number(@cust_lvl@),
                '@frm_cls@', 
                '@grp_nam@',
                sysdate,
                sysdate,
                'NOUSER',
                'NOUSER') 
       ]
        
   }
