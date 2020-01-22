[MERGE INTO les_usr_role l
      USING (SELECT '@usr_id@' usr_id, '@role_id@' role_id, to_number('@ldap_flg@') ldap_flg, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (l.usr_id = input.usr_id
             AND l.role_id = input.role_id)
 WHEN NOT MATCHED THEN
     INSERT (usr_id, role_id, ldap_flg, grp_nam)
     VALUES (input.usr_id, input.role_id, input.ldap_flg, input.grp_nam)]
