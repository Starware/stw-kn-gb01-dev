[select count(1) row_count
   from web_validation_config
  where id = '@id@']
|
if (@row_count = 0)
{
    [insert into web_validation_config(
        id,
        validation_config
     )
     VALUES(
        '@id@',
        '@validation_config@'
     )]
}
