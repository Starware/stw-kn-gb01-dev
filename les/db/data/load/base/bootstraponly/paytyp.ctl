[ select count(*) row_count 
    from paytyp 
   where paycod = '@paycod@'
     and dstnam = '@dstnam@']
|
if (@row_count = 0)
{
    [ insert into paytyp
         (paycod, dstnam,
          payval, codflg)
      values
         ('@paycod@', '@dstnam@',
          '@payval@', '@codflg@') ]
}

