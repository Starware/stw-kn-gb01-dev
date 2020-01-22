[ select count(*) row_count 
    from devmst_reader
   where wh_id = '@wh_id@'
     and devcod = '@devcod@'
     and reader_id = '@reader_id@' ]
| 
if (@row_count = 0) 
{ 
     [ insert into devmst_reader
          (wh_id, devcod, reader_id) 
        values 
          ('@wh_id@', '@devcod@', '@reader_id@') ]
}  
