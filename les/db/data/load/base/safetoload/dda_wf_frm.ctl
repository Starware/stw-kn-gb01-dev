[ select count(*) row_count 
    from wf_frm 
   where frm_id = '@frm_id@' 
     and cust_lvl = @cust_lvl@ 
] 

| 
   if (@row_count = 0) 
   {
     [ insert into wf_frm
               (frm_id, cust_lvl, descr_id, 
	        frm_progid, dda_id, grp_nam)
            VALUES
               ('@frm_id@', @cust_lvl@, '@descr_id@', 
	        'ddamgtopr.ctlmgmntopr', '@dda_id@', '@grp_nam@') 
       ]
        
   }
   |
   create cache time stamp 
     where obj_nam = "MCSWorkFlow" 
       and idx_val = 'LES' 

