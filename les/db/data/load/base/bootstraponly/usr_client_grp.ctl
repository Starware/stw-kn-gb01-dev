[ select count(*) row_count 
    from usr_client_grp 
   where usr_id = '@usr_id@' 
     and client_grp = '@client_grp@' ] | 
if (@row_count = 0) 
{
    [ insert into usr_client_grp
                      (usr_id, client_grp, u_version, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id)
                      VALUES
                      ('@usr_id@', '@client_grp@', to_number('@u_version@'), to_date('@ins_dt@','YYYYMMDDHH24MISS'), to_date('@last_upd_dt@','YYYYMMDDHH24MISS'), '@ins_user_id@', '@last_upd_user_id@') ] 

 }

