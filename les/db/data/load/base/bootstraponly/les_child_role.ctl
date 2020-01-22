[select count(*) row_count 
   from les_child_role
  where role_id = '@role_id@'
    and child_role_id = '@child_role_id@' ] 
| 
if (@row_count = 0) 
{
       [ insert into les_child_role (role_id, child_role_id, moddte, mod_usr_id)
     VALUES ('@role_id@', '@child_role_id@', null, null) ] 
	 }

