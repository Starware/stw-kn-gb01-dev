[ select count(*) row_count 
    from tim_zon_mapping
   where java_id = '@java_id@' ] 
   |
if (@row_count = 0) 
{
    [ insert into tim_zon_mapping 
       (java_id, win32_id, ena_flg)
      VALUES ('@java_id@', '@win32_id@', @ena_flg@)
     ] 
}


