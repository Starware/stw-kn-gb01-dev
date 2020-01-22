[select count(1) row_count
   from web_filter_column
  where filter_type = '@filter_type@'
    and column_name = '@column_name@']
|
if (@row_count = 0)
{
    [insert into web_filter_column(
        filter_type,
        column_name,
        data_type,
        func_group,
        sort_seq,
        ins_date,
        ins_user_id,
        mod_date,
        mod_user_id
     )
     VALUES(
        '@filter_type@',
        '@column_name@',
        '@data_type@',
        '@func_group@',
        @sort_seq@,
        sysdate,
        @@usr_id,
        sysdate,
        @@usr_id
     )]
}
