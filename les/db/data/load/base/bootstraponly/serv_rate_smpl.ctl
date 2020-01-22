[ select count(*) row_count 
    from serv_rate_smpl 
   where serv_rate_id = '@serv_rate_id@' 
     and minqty = @minqty@ ] 
| 
if (@row_count = 0) 
{
     [insert into serv_rate_smpl
            (serv_rate_id, minqty, prob_qty, max_prob_qty, moddte, mod_usr_id)
         VALUES
            ('@serv_rate_id@', @minqty@, @prob_qty@, @max_prob_qty@, to_date('@moddte@','YYYYMMDDHH24MISS'), '@mod_usr_id@') ] 
}

