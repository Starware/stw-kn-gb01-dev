[select count(1) row_count
   from web_validation_container
  where id = '@id@']
|
if (@row_count = 0)
{
[insert into web_validation_container(
        id,
        component_path,
        config_id
     )
     VALUES(
        '@id@',
        '@component_path@',
        '@config_id@'
     )]
}
