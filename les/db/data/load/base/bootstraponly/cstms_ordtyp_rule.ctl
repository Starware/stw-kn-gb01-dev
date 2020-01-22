/*
 * The processing here is a bit different.
 * dest_site_typ and dty_ctry_typ can have null values.
 * So when we select and update we need to check for 
 * the values to be specifically null if they are not
 * present or else we will end up creating them again.
 * So here we are buiding the select and update statements
 * taking care of the null values.
 */
publish data 
  where cmd = '[select 1'
         || '  from cstms_ordtyp_rule'
         || ' where cstms_ordtyp   = ''@cstms_ordtyp@'''
         || '   and cstms_site_typ = ''@cstms_site_typ@'''
         || '   and wh_id = ''@wh_id@'''
|
if ('@dest_site_typ@' is null)
{
    publish data 
      where cmd = @cmd || ' and dest_site_typ is null'
}
else
{
    publish data 
      where cmd = @cmd || ' and dest_site_typ = ''@dest_site_typ@'''
}
|
if ('@dty_ctry_typ@' is null)
{
    publish data 
      where cmd = @cmd || ' and dty_ctry_typ is null] catch(-1403)'
}
else
{
    publish data 
      where cmd = @cmd || ' and dty_ctry_typ = ''@dty_ctry_typ@''] catch(-1403)'
}
|
execute server command >> res
|
if (rowcount(@res) = 0)
{
     generate next number
        where numcod = 'cstms_ordtyp_id'
    |
    publish data
        where cstms_ordtyp_id = @nxtnum
    |
    [insert into cstms_ordtyp_rule
            (cstms_ordtyp_id, 
             cstms_ordtyp, 
             cstms_site_typ, 
             dest_site_typ, 
             dty_ctry_typ, 
             def_flg,
             wh_id)
     values
            (@cstms_ordtyp_id, 
             '@cstms_ordtyp@', 
             '@cstms_site_typ@', 
             '@dest_site_typ@',
             '@dty_ctry_typ@',
             @def_flg@,
             '@wh_id@')]
}
