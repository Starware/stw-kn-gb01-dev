[ select count(*) row_count
    from pmsn_role_assoc
   where pmsn_id = '@pmsn_id@'
     and role_id = '@role_id@' ]
|
if (@row_count = 0)
{
    [ insert into pmsn_role_assoc
             (pmsn_id, role_id, pmsn_mask)
      VALUES
             ('@pmsn_id@', '@role_id@', to_number('@pmsn_mask@')) ]
}

