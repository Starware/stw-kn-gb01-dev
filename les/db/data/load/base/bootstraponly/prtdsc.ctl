[select count(*) row_count
   from prtdsc
  where colnam = '@colnam@'
    and colval = '@colval@'
    and locale_id = '@locale_id@']
|
if (@row_count = 0) 
{
    [insert into prtdsc
       (colnam, colval, locale_id, lngdsc, short_dsc)
     VALUES
       ('@colnam@', '@colval@', '@locale_id@', '@lngdsc@', '@short_dsc@') ] 
}
