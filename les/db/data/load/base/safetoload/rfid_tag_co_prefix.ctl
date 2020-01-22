[ select count(*) row_count 
    from rfid_tag_co_prefix 
   where co_prefix_index = '@co_prefix_index@'
] 

| 
    if (@row_count = 0) 
    {
       [ insert into rfid_tag_co_prefix
               (co_prefix_index, co_prefix, grp_nam)
            VALUES
               ('@co_prefix_index@', '@co_prefix@', '@grp_nam@') 
       ] 
    }

