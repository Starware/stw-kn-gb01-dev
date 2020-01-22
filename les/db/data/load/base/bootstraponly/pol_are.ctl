[select count(*) cnt
  from pol_are 
 where pol_are_id = '@pol_are_id@' ] |
if (@cnt = 0)
{
create policy area 
    where pol_are_id = '@pol_are_id@'
      and cmnt = "@cmnt@"
      and grp_nam = '@grp_nam@'  
}

